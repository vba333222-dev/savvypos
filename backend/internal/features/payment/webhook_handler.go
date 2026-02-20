package payment

import (
	"encoding/json"
	"log"
	"net/http"
)

type WebhookHandler struct {
	// In a real app, inject OrderService here to update DB
}

func NewWebhookHandler() *WebhookHandler {
	return &WebhookHandler{}
}

type PaymentCallbackPayload struct {
	TransactionID string `json:"transaction_id"`
	OrderID       string `json:"order_id"`
	Status        string `json:"status"`
	Signature     string `json:"signature"` // For security verification
}

func (h *WebhookHandler) HandleCallback(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	var payload PaymentCallbackPayload
	if err := json.NewDecoder(r.Body).Decode(&payload); err != nil {
		http.Error(w, "Invalid payload", http.StatusBadRequest)
		return
	}

	// 1. Verify Signature (Security Critical)
	// In production, HMAC-SHA256 compare payload.Signature with calculated hash using Secret Key.
	// For prototype, we skip or do basic check.
	if payload.Signature == "" {
		log.Println("[Warning] Webhook received without signature.")
	}

	log.Printf("[Webhook] Payment Update: Order %s is now %s (Tx: %s)\n", payload.OrderID, payload.Status, payload.TransactionID)

	if payload.Status == "SUCCESS" {
		// 2. Update Database via Service
		// orderService.MarkAsPaid(payload.OrderID)

		// 3. Broadcast WebSocket Event (The "Signal")
		// wsHub.Broadcast("payment_success", payload)
		log.Println("BROADCAST: payment_success -> Clients")
	}

	w.WriteHeader(http.StatusOK)
	w.Write([]byte("OK"))
}
