package domain

import (
	"time"
)

// Base Model
type Model struct {
	ID        uint       `gorm:"primarykey" json:"id"`
	CreatedAt time.Time  `json:"created_at"`
	UpdatedAt time.Time  `json:"updated_at"`
	ID        uint       `gorm:"primarykey" json:"id"`
	CreatedAt time.Time  `json:"created_at"`
	UpdatedAt time.Time  `json:"updated_at"`
	DeletedAt *time.Time `gorm:"index" json:"deleted_at,omitempty"`
	Version   int        `json:"version" gorm:"default:1"`
}

// Order Represents a Sales Transaction
type Order struct {
	Model
	UUID            string    `gorm:"uniqueIndex;not null" json:"orderUuid"` // Matches Flutter
	OrderNumber     string    `gorm:"not null" json:"orderNumber"`
	ShiftUUID       string    `json:"shiftUuid"`
	CustomerUUID    string    `json:"customerUuid"`
	TenantID        string    `json:"tenantId"`
	Status          string    `json:"status"`
	PaymentStatus   string    `json:"paymentStatus"`
	TransactionDate time.Time `json:"transactionDate"`

	// Financials
	Subtotal      float64 `json:"subtotal"`
	DiscountTotal float64 `json:"discount"` // Flutter sends 'discount'
	TaxTotal      float64 `json:"tax"`      // Flutter sends 'tax'? Need to check CartBloc
	GrandTotal    float64 `json:"total"`    // Flutter sends 'total'

	// Payment
	PaymentMethod  string  `json:"paymentMethod"`
	TenderedAmount float64 `json:"tenderedAmount"`
	ChangeAmount   float64 `json:"changeAmount"`

	// Relations
	Items []OrderItem `gorm:"foreignKey:OrderUUID;references:UUID" json:"items"`
}

type OrderItem struct {
	Model
	OrderUUID   string  `gorm:"index" json:"orderUuid"`
	ProductUUID string  `gorm:"index" json:"productUuid"`
	Name        string  `json:"name"`  // Flutter doesn't send name in item map usually, checking payload...
	Price       float64 `json:"price"` // Not in minimalistic payload?
	Quantity    float64 `json:"quantity"`
	Note        string  `json:"note"`
	Total       float64 `json:"total"` // Not in minimalistic payload?
}

// Product Catalog (Simplified for Sync)
type Product struct {
	Model
	UUID        string  `gorm:"uniqueIndex" json:"uuid"`
	Name        string  `json:"name"`
	Price       float64 `json:"price"`
	SKU         string  `json:"sku"`
	Category    string  `json:"category"`
	TenantID    string  `json:"tenant_id"`
	IsComposite bool    `json:"is_composite"`
}

type Ingredient struct {
	Model
	TenantID string  `json:"tenant_id"`
	Name     string  `json:"name"`
	Stock    float64 `json:"stock"`
	Unit     string  `json:"unit"`
	Cost     float64 `json:"cost"`
}

type Recipe struct {
	Model
	TenantID       string  `json:"tenant_id"`
	ProductUUID    string  `gorm:"index" json:"product_uuid"`
	IngredientUUID string  `gorm:"index" json:"ingredient_uuid"`
	Quantity       float64 `json:"quantity"`
}

// Customer (CRM)
type Customer struct {
	Model
	UUID     string `gorm:"uniqueIndex" json:"uuid"`
	Name     string `json:"name"`
	Phone    string `json:"phone"`
	Email    string `json:"email"`
	TenantID string `json:"tenant_id"`
}

// TenantConfig for multi-tenant support
type TenantConfig struct {
	Model
	TenantID string `gorm:"uniqueIndex" json:"tenant_id"`
	Name     string `json:"name"`
	Config   string `json:"config"` // JSON string or specific fields
}

// Employee for Auth
type Employee struct {
	Model
	TenantID string `json:"tenant_id"`
	Name     string `json:"name"`
	Username string `json:"username"`
	Password string `json:"password"` // Hash
	PIN      string `json:"pin"`      // Alternative Login
}

// InventoryLedger for Audit Trail
type InventoryLedger struct {
	Model
	ProductUUID    string  `gorm:"index" json:"productUuid"`
	ReferenceID    string  `gorm:"index" json:"referenceId"`
	Type           string  `json:"type"` // SALE, PURCHASE, ADJUSTMENT
	QuantityChange float64 `json:"quantityChange"`
	SnapshotCost   float64 `json:"snapshotCost"`
	TenantID       string  `json:"tenantId"`
}

// Enterprise Features

type Outlet struct {
	Model
	UUID     string `gorm:"uniqueIndex" json:"uuid"`
	TenantID string `json:"tenantId"`
	Name     string `json:"name"`
	Address  string `json:"address"`
	Phone    string `json:"phone"`
}

type Warehouse struct {
	Model
	UUID         string `gorm:"uniqueIndex" json:"uuid"`
	TenantID     string `json:"tenantId"`
	Name         string `json:"name"`
	IsStoreFront bool   `json:"isStoreFront"`
	OutletUUID   string `json:"outletUuid"`
}

type Supplier struct {
	Model
	UUID     string `gorm:"uniqueIndex" json:"uuid"`
	TenantID string `json:"tenantId"`
	Name     string `json:"name"`
	Email    string `json:"email"`
	Phone    string `json:"phone"`
	Address  string `json:"address"`
}

type ProductSupplier struct {
	Model
	ProductUUID  string  `gorm:"index" json:"productUuid"`
	SupplierUUID string  `gorm:"index" json:"supplierUuid"`
	TenantID     string  `json:"tenantId"`
	CostPrice    float64 `json:"costPrice"`
	LeadTimeDays int     `json:"leadTimeDays"`
	MinOrderQty  float64 `json:"minOrderQty"`
}

type InventoryStock struct {
	Model
	ProductUUID   string  `gorm:"index" json:"productUuid"`
	WarehouseUUID string  `gorm:"index" json:"warehouseUuid"`
	TenantID      string  `json:"tenantId"`
	Quantity      float64 `json:"quantity"`
}
