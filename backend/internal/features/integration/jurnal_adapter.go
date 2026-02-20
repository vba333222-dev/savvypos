package integration

import (
	"errors"
	"log"
	"time"
)

type JurnalAdapter struct {
	APIKey string
}

func NewJurnalAdapter() *JurnalAdapter {
	return &JurnalAdapter{}
}

func (a *JurnalAdapter) Auth(apiKey string) error {
	// Mock Auth Check
	if apiKey == "" {
		return errors.New("API Key required")
	}
	a.APIKey = apiKey
	log.Println("[Jurnal] Authenticated successfully.")
	return nil
}

func (a *JurnalAdapter) PushInvoice(invoice *InvoiceDTO) error {
	log.Printf("[Jurnal] Pushing Invoice #%s Amount: %.2f\n", invoice.ID, invoice.TotalAmount)
	// Simulate Network Latency
	time.Sleep(500 * time.Millisecond)

	// Mock validation: If amount is negative, fail
	if invoice.TotalAmount < 0 {
		return errors.New("validation failed: absolute amount required")
	}

	for _, line := range invoice.Lines {
		log.Printf("   -> Line: %s mapped to Account [%s]\n", line.Description, line.AccountCode)
	}

	return nil
}

func (a *JurnalAdapter) PushExpense(expense *ExpenseDTO) error {
	return nil // Not implemented for prototype
}

func (a *JurnalAdapter) MapAccounts() ([]AccountDTO, error) {
	// Return Mock Chart of Accounts from Jurnal
	return []AccountDTO{
		{ID: "1", Code: "4-4000", Name: "Sales Revenue", Type: "Revenue"},
		{ID: "2", Code: "4-4001", Name: "Service Charge", Type: "Revenue"},
		{ID: "3", Code: "1-1001", Name: "Cash on Hand", Type: "Asset"},
		{ID: "4", Code: "1-1002", Name: "Bank BCA", Type: "Asset"},
	}, nil
}
