package payment

import (
	"log"
	"time"

	"github.com/google/uuid"
)

// PaymentGateway defines the standard interface for any payment provider.
type PaymentGateway interface {
	CreateTransaction(orderID string, amount float64) (*PaymentTransaction, error)
	CheckStatus(transactionID string) (PaymentStatus, error)
	CancelTransaction(transactionID string) error
}

type PaymentStatus string

const (
	StatusPending PaymentStatus = "PENDING"
	StatusSuccess PaymentStatus = "SUCCESS"
	StatusFailed  PaymentStatus = "FAILED"
)

type PaymentTransaction struct {
	ID        string
	QrCodeURL string
	Status    PaymentStatus
}

// MockGateway simulates a payment provider like Xendit/Midtrans.
type MockGateway struct{}

func NewMockGateway() *MockGateway {
	return &MockGateway{}
}

func (g *MockGateway) CreateTransaction(orderID string, amount float64) (*PaymentTransaction, error) {
	log.Printf("[MockGateway] Creating Transaction for Order %s Amount %.2f\n", orderID, amount)

	// Simulate API latency
	time.Sleep(200 * time.Millisecond)

	txID := uuid.New().String()
	// Return a fake QR Code (could be a link to a static image)
	qrURL := "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=SAVVY-" + txID

	return &PaymentTransaction{
		ID:        txID,
		QrCodeURL: qrURL,
		Status:    StatusPending,
	}, nil
}

func (g *MockGateway) CheckStatus(transactionID string) (PaymentStatus, error) {
	// Mock Logic: Always return Success for now, or randomize it.
	return StatusSuccess, nil
}

func (g *MockGateway) CancelTransaction(transactionID string) error {
	log.Printf("[MockGateway] Cancelling Transaction %s\n", transactionID)
	return nil
}
