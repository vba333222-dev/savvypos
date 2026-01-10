package http

import (
	"encoding/json"
	"net/http"
	"time"

	"savvy-pos-backend/internal/core/domain"
	salesService "savvy-pos-backend/internal/features/sales/service"
	"savvy-pos-backend/internal/features/sync/dto"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type SyncHandler struct {
	db           *gorm.DB
	orderService *salesService.OrderService
}

func NewSyncHandler(db *gorm.DB, orderService *salesService.OrderService) *SyncHandler {
	return &SyncHandler{db: db, orderService: orderService}
}

func (h *SyncHandler) HandlePush(c *gin.Context) {
	var req dto.SyncRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	tenantID, exists := c.Get("tenantID")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Tenant ID not found"})
		return
	}

	tx := h.db.Begin()

	switch req.Action {
	case "CREATE_ORDER":
		// Orders are append-only usually, but we ensure version is set
		var order domain.Order
		if err := json.Unmarshal(req.Payload, &order); err != nil {
			tx.Rollback()
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid Order Payload", "details": err.Error()})
			return
		}
		order.TenantID = tenantID.(string)
		order.Version = 1 // New orders start at version 1

		if err := h.orderService.SyncOrder(tx, order); err != nil {
			tx.Rollback()
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to sync order", "details": err.Error()})
			return
		}

	case "UPDATE_PRODUCT":
		var incoming domain.Product
		if err := json.Unmarshal(req.Payload, &incoming); err != nil {
			tx.Rollback()
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid Product Payload", "details": err.Error()})
			return
		}
		incoming.TenantID = tenantID.(string)

		// 1. Fetch Current Version
		var current domain.Product
		if err := tx.Where("uuid = ? AND tenant_id = ?", incoming.UUID, tenantID).First(&current).Error; err != nil {
			// If not found, it might be a new product from offline device? Or error.
			// Assuming it exists for update.
			tx.Rollback()
			c.JSON(http.StatusNotFound, gin.H{"error": "Product not found for update"})
			return
		}

		// 2. Conflict Detection (Server-Wins)
		if incoming.Version < current.Version {
			tx.Rollback()
			// Return 409 and the LATEST server data so client can update
			c.JSON(http.StatusConflict, gin.H{
				"error":          "Version Conflict. Server has newer data.",
				"server_version": current.Version,
				"server_data":    current,
			})
			return
		}

		// 3. Increment Version & Save
		incoming.Version = current.Version + 1
		// Copy internal IDs if needed, or rely on UUID
		incoming.ID = current.ID

		if err := tx.Save(&incoming).Error; err != nil {
			tx.Rollback()
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update product"})
			return
		}

	default:
		// Unknown action, maybe log warning but acknowledge to unblock queue
	}

	if err := tx.Commit().Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Transaction commit failed"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"status": "processed", "idempotencyKey": req.IdempotencyKey})
}

func (h *SyncHandler) HandlePull(c *gin.Context) {
	tenantID, exists := c.Get("tenantID")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Tenant ID not found in context"})
		return
	}

	lastSyncedAtStr := c.Query("last_synced_at")
	warehouseID := c.Query("warehouse_id") // Optional: Filter stocks by warehouse

	var lastSyncedAt string
	if lastSyncedAtStr == "" {
		lastSyncedAt = "1970-01-01T00:00:00Z"
	} else {
		lastSyncedAt = lastSyncedAtStr
	}

	var products []domain.Product
	var customers []domain.Customer
	var stocks []domain.InventoryStock

	// Query for changes
	h.db.Where("tenant_id = ? AND updated_at > ?", tenantID, lastSyncedAt).Find(&products)
	h.db.Where("tenant_id = ? AND updated_at > ?", tenantID, lastSyncedAt).Find(&customers)

	// Fetch Stocks (Filtered by Warehouse if provided)
	stockQuery := h.db.Where("tenant_id = ? AND updated_at > ?", tenantID, lastSyncedAt)
	if warehouseID != "" {
		stockQuery = stockQuery.Where("warehouse_uuid = ?", warehouseID)
	}
	stockQuery.Find(&stocks)

	c.JSON(http.StatusOK, gin.H{
		"products":         products,
		"customers":        customers,
		"inventory_stocks": stocks, // Return the stock data!
		"server_time":      time.Now().Format(time.RFC3339),
	})
}
