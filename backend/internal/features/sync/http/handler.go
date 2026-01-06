package http

import (
	"encoding/json"
	"net/http"
	"time"

	"savvy-pos-backend/internal/core/domain"
	service "savvy-pos-backend/internal/features/inventory/service"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type SyncHandler struct {
	db           *gorm.DB
	stockService *service.StockService // Check package import below
}

func NewSyncHandler(db *gorm.DB, stockService *service.StockService) *SyncHandler {
	return &SyncHandler{db: db, stockService: stockService}
}

// ... SyncRequest struct ...

func (h *SyncHandler) HandlePush(c *gin.Context) {
	var req SyncRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Idempotency check could go here (using Redis or DB)

	tx := h.db.Begin()

	switch req.ActionType {
	case "CREATE_ORDER":
		var order domain.Order
		if err := json.Unmarshal(req.PayloadJson, &order); err != nil {
			tx.Rollback()
			c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid Order Payload", "details": err.Error()})
			return
		}

		// Upsert Order
		if err := tx.Create(&order).Error; err != nil {
			tx.Rollback()
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save order", "details": err.Error()})
			return
		}

		// Trigger Inventory Logic
		if err := h.stockService.ProcessOrderStock(tx, order); err != nil {
			// Decide: Rollback transaction if stock deduction fails?
			// Yes, ensuring data consistency.
			tx.Rollback()
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Inventory processed failed", "details": err.Error()})
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
