package cds

import (
	"log"
)

type CdsHandler struct {
	// Inject WebSocket Hub here
}

func NewCdsHandler() *CdsHandler {
	return &CdsHandler{}
}

func (h *CdsHandler) BroadcastToDevice(deviceID string, event string, payload interface{}) {
	// In production: Lookup connection by deviceID and write JSON
	log.Printf("[CDS-Hub] Broadcasting to %s | Event: %s | Payload: %+v\n", deviceID, event, payload)
}

// CDS Events Constants
const (
	EventIdle           = "CDS_IDLE"
	EventUpdateCart     = "CDS_UPDATE_CART"
	EventPaymentRequest = "CDS_PAYMENT_REQUEST"
	EventSuccess        = "CDS_SUCCESS"
)

type CartPayload struct {
	Items []CartItemDTO `json:"items"`
	Total float64       `json:"total"`
	Tax   float64       `json:"tax"`
}

type CartItemDTO struct {
	Name     string  `json:"name"`
	Qty      int     `json:"qty"`
	Price    float64 `json:"price"`
	Modifier string  `json:"modifier,omitempty"`
}
