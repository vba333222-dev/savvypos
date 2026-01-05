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

type PushRequest struct {
	Items []SyncItem `json:"items"`
}

type SyncItem struct {
	Action  string                 `json:"action"`
	Payload map[string]interface{} `json:"payload"`
}

func (h *SyncHandler) HandlePush(c *gin.Context) {
	var req PushRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	tx := h.db.Begin()

	for _, item := range req.Items {
		if item.Action == "CREATE_ORDER" {
			// Marshal payload back to bytes to Unmarshal into Struct
			// Inefficent but simple for generic payload map
			bytes, _ := json.Marshal(item.Payload)
			var order domain.Order
			if err := json.Unmarshal(bytes, &order); err != nil {
				tx.Rollback()
				c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid Order Payload"})
				return
			}

			// Upsert Order
			if err := tx.Save(&order).Error; err != nil {
				tx.Rollback()
				c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save order"})
				return
			}
		}
		// Handle other actions...
	}

	tx.Commit()
	c.JSON(http.StatusOK, gin.H{"status": "processed", "count": len(req.Items)})
}
