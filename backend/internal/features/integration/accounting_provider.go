package integration

type AccountingProvider interface {
	// Auth initiates the OAuth flow or API Key validation
	Auth(apiKey string) error

	// PushInvoice sends a sales invoice to the accounting software
	PushInvoice(invoice *InvoiceDTO) error

	// PushExpense sends an expense/PO to the accounting software
	PushExpense(expense *ExpenseDTO) error

	// MapAccounts returns a list of chart of accounts from the provider
	MapAccounts() ([]AccountDTO, error)
}

// DTOs
type InvoiceDTO struct {
	ID          string
	TotalAmount float64
	Date        string
	Lines       []InvoiceLineDTO
}

type InvoiceLineDTO struct {
	Description string
	Amount      float64
	AccountCode string // The mapped account code
}

type ExpenseDTO struct {
	ID          string
	TotalAmount float64
}

type AccountDTO struct {
	ID   string
	Name string
	Code string
	Type string // e.g., 'Revenue', 'Expense', 'Asset'
}
