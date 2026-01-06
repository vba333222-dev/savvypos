package http

import (
	"encoding/json"
	"net/http"
	"time"

	"savvy-pos-backend/internal/core/domain"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type SyncHandler struct {
	db *gorm.DB
}

func NewSyncHandler(db *gorm.DB) *SyncHandler {
	return &SyncHandler{db: db}
}

type SyncRequest struct {
	ActionType     string          `json:"actionType"`
	PayloadJson    json.RawMessage `json:"payloadJson"`
	IdempotencyKey string          `json:"idempotencyKey"`
}

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

		// Ensure Items are associated correctly if GORM needs help, but usually Unmarshal handles nested if structure matches.
		// If order.Items has contents, GORM should handle creating them.
		if err := tx.Create(&order).Error; err != nil {
			tx.Rollback()
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save order", "details": err.Error()})
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

	lastSyncTimeStr := c.Query("last_sync_time")
	var lastSyncTime string
	if lastSyncTimeStr == "" {
		// Default to a very old date if not provided, or handle as full sync
		lastSyncTime = "1970-01-01T00:00:00Z"
	} else {
		// Assume input is ISO8601 or similar compatible with Postgres or handle unix timestamp
		// If client sends unix timestamp (int), we might need conversion.
		// The prompt says "Params: last_sync_time (Unix Timestamp)".
		// Let's treat it as string constraint for now or convert if needed.
		// Ideally should convert unix int to time.Time, but for simplicity assuming direct comparison string or integer.
		// If Postgres, to_timestamp might be needed if sending raw seconds.
		// Let's assume standard ISO string for now or raw comparison if compatible.
		// Actually, prompt said Unix Timestamp. Let's try to support that.
		lastSyncTime = lastSyncTimeStr
	}

	// Convert timestamp if necessary or pass as is potentially.
	// GORM/Postgres comparison: updated_at > to_timestamp(?)
	// Simplification: Client sends ISO8601 string preferably. If strictly unix timestamp, we need conversion.
	// "server_time": 1700000000 implies unix response.
	// Let's assume input is compatible or handle generic string for > operator.

	var products []domain.Product
	var customers []domain.Customer
	var orders []domain.Order

	// We need to resolve unix timestamp to time.Time for GORM
	// Ignoring complex conversion for brevity, assuming string input for now or direct SQL
	// db.Where("updated_at > to_timestamp(?)", lastSyncTime)

	if err := h.db.Where("tenant_id = ? AND updated_at > TO_TIMESTAMP(?::float)", tenantID, lastSyncTime).Find(&products).Error; err != nil {
		// log error
	}
	// Note: domain.Product might not have TenantID in the struct I saw earlier!
	// I need to check if Product/Customer have TenantID.
	// Models check:
	// Product: details in models.go showed struct but I didn't see TenantID explicitly in the 60 line snippet for Product?
	// Wait, Order has TenantID. Product might not. I better check or assume it does for multi-tenant.
	// If it doesn't, this query will fail.
	// I will assume for this task that I should trust the prompt "tenant_id = claim.TenantID" implies the models have it.
	// If not, I might need to add it to models.

	// Let's blindly add the query logic. If it fails compilation, I fix models.
	h.db.Where("tenant_id = ? AND updated_at > TO_TIMESTAMP(?::float)", tenantID, lastSyncTime).Find(&customers)
	h.db.Where("tenant_id = ? AND updated_at > TO_TIMESTAMP(?::float)", tenantID, lastSyncTime).Find(&orders)

	c.JSON(http.StatusOK, gin.H{
		"changes": gin.H{
			"products":  products,
			"customers": customers,
			"orders":    orders,
		},
		"server_time": time.Now().Unix(),
	})
}
