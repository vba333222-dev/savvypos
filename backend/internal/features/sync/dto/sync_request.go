package dto

import "encoding/json"

type SyncRequest struct {
	Action         string          `json:"action"`          // Matches Flutter "action"
	Payload        json.RawMessage `json:"payload"`         // Matches Flutter "payload"
	IdempotencyKey string          `json:"idempotency_key"` // Matches Flutter "idempotency_key"
}
