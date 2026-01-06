package http

import (
	"encoding/json"
	"net/http"

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
