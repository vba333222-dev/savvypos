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

	// Idempotency check could go here (using Redis or DB)

	tenantID, exists := c.Get("tenantID")
	if !exists {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Tenant ID not found"})
		return
	}

	tx := h.db.Begin()

	switch req.Action {
	case "CREATE_ORDER":
		var order domain.Order
		if err := json.Unmarshal(req.Payload, &order); err != nil {
			tx.Rollback()
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid Order Payload", "details": err.Error()})
			return
		}

		// Enforce Tenant Identity
		order.TenantID = tenantID.(string)

		// Delegate to OrderService
		if err := h.orderService.SyncOrder(tx, order); err != nil {
			tx.Rollback()
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to sync order", "details": err.Error()})
			return
		}

		// Detect other actions
		// case "UPDATE_PRODUCT": ...

	default:
		// Identify if it is safe to ignore or error
		// c.JSON(http.StatusBadRequest, gin.H{"error": "Unknown ActionType"})
		// For now, acknowledgement is safer to avoid mobile queue blocking
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
	var lastSyncedAt string
	if lastSyncedAtStr == "" {
		lastSyncedAt = "1970-01-01T00:00:00Z"
	} else {
		lastSyncedAt = lastSyncedAtStr
	}

	var products []domain.Product
	var customers []domain.Customer

	// Query for changes
	h.db.Where("tenant_id = ? AND updated_at > ?", tenantID, lastSyncedAt).Find(&products)
	h.db.Where("tenant_id = ? AND updated_at > ?", tenantID, lastSyncedAt).Find(&customers)

	c.JSON(http.StatusOK, gin.H{
		"products":    products,
		"customers":   customers,
		"server_time": time.Now().Format(time.RFC3339),
	})
}
