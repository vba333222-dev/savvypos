package domain

import (
	"time"
)

// Base Model
type Model struct {
	ID        uint       `gorm:"primarykey" json:"id"`
	CreatedAt time.Time  `json:"created_at"`
	UpdatedAt time.Time  `json:"updated_at"`
	DeletedAt *time.Time `gorm:"index" json:"deleted_at,omitempty"`
}

// Order Represents a Sales Transaction
type Order struct {
	Model
	UUID            string    `gorm:"uniqueIndex;not null" json:"uuid"`
	OrderNumber     string    `gorm:"not null" json:"order_number"`
	ShiftUUID       string    `json:"shift_uuid"`
	CustomerUUID    string    `json:"customer_uuid"`
	TenantID        string    `json:"tenant_id"`
	Status          string    `json:"status"`
	PaymentStatus   string    `json:"payment_status"`
	TransactionDate time.Time `json:"transaction_date"`

	// Financials
	Subtotal      float64 `json:"subtotal"`
	DiscountTotal float64 `json:"discount_total"`
	TaxTotal      float64 `json:"tax_total"`
	GrandTotal    float64 `json:"grand_total"`

	// Payment
	PaymentMethod  string  `json:"payment_method"`
	TenderedAmount float64 `json:"tendered_amount"`
	ChangeAmount   float64 `json:"change_amount"`

	// Relations
	Items []OrderItem `gorm:"foreignKey:OrderUUID;references:UUID" json:"items"`
}

type OrderItem struct {
	Model
	OrderUUID   string  `gorm:"index" json:"order_uuid"`
	ProductUUID string  `gorm:"index" json:"product_uuid"`
	Name        string  `json:"name"`
	Price       float64 `json:"price"`
	Quantity    float64 `json:"quantity"`
	Note        string  `json:"note"`
	Total       float64 `json:"total"`
}

// Product Catalog (Simplified for Sync)
type Product struct {
	Model
	UUID     string  `gorm:"uniqueIndex" json:"uuid"`
	Name     string  `json:"name"`
	Price    float64 `json:"price"`
	SKU      string  `json:"sku"`
	Category string  `json:"category"`
}

// Customer (CRM)
type Customer struct {
	Model
	UUID  string `gorm:"uniqueIndex" json:"uuid"`
	Name  string `json:"name"`
	Phone string `json:"phone"`
	Email string `json:"email"`
}

// TenantConfig for multi-tenant support
type TenantConfig struct {
	Model
	TenantID string `gorm:"uniqueIndex" json:"tenant_id"`
	Name     string `json:"name"`
	Config   string `json:"config"` // JSON string or specific fields
}
