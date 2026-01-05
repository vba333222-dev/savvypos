package http

import (
	"fmt"
	"net/http"
	
	"github.com/gin-gonic/gin"
)

type SyncHandler struct {}

func NewSyncHandler() *SyncHandler {
	return &SyncHandler{}
}

type PushRequest struct {
	Items []map[string]interface{} `json:"items"`
}

func (h *SyncHandler) HandlePush(c *gin.Context) {
	var req PushRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	
	// Just print for now
	fmt.Printf("Received Sync Push: %d items\n", len(req.Items))
	for _, item := range req.Items {
		fmt.Printf(" - Item: %+v\n", item)
	}
	
	c.JSON(http.StatusOK, gin.H{"status": "processed", "count": len(req.Items)})
}
