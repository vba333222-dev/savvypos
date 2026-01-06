package service

import (
	"errors"
	"fmt"
	"savvy-pos-backend/internal/core/domain"
	inventoryService "savvy-pos-backend/internal/features/inventory/service"

	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

type OrderService struct {
	stockService *inventoryService.StockService
}

func NewOrderService(stockService *inventoryService.StockService) *OrderService {
	return &OrderService{stockService: stockService}
}

func (s *OrderService) SyncOrder(tx *gorm.DB, order domain.Order) error {
	// 1. Idempotency Check (Optional here if handled by unique constraint on UUID)
	// GORM Clause: OnConflict(DoNothing) might be better if we fear partial duplicates?
	// But Sync is usually "Upsert" or "Insert only".
	// Since generated UUIDs are unique per order, we can rely on DB constraint.

	// Check if order exists
	var existing domain.Order
	if err := tx.Where("uuid = ?", order.UUID).First(&existing).Error; err == nil {
		// Order already exists.
		// If status changed, we update? For now, assume CREATE_ORDER is final.
		// If we receive the same order again, it's likely a retry.
		// We return nil to ack success.
		return nil
	} else if !errors.Is(err, gorm.ErrRecordNotFound) {
		return err // Real DB error
	}

	// 2. Save Order (and cascade Items due to gorm tags if configured, but explicit is safer)
	if err := tx.Omit(clause.Associations).Create(&order).Error; err != nil {
		return fmt.Errorf("failed to create order header: %w", err)
	}

	// 3. Save Items
	if len(order.Items) > 0 {
		if err := tx.Create(&order.Items).Error; err != nil {
			return fmt.Errorf("failed to create order items: %w", err)
		}
	}

	// 4. Stock Deduction
	if err := s.stockService.ProcessOrderStock(tx, order); err != nil {
		// Log but don't fail the sync?
		// "Requirement: If stock deduction fails, log it but don't crash the sync."
		// However, returning error triggers Rollback in Handler.
		// If we want to persist Order even if Stock fails, we must return nil here.
		// But in a "Service", we usually report success/failure of the Operation.
		// Let the Handler decide whether to rollback.
		// Handler said: "We DO NOT rollback... Inventory inconsistency is better than data loss".
		// Thus, we should log inside Service or return a special error that Handler ignores?
		// Or just swallow error here. Swallowing here is cleaner for Handler simplicity.
		fmt.Printf("Stock Deduction Failed for Order %s: %v\n", order.OrderNumber, err)
	}

	return nil
}
