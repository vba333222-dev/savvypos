package service

import (
	"errors"
	"fmt"
	"savvy-pos-backend/internal/core/domain"

	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

type StockService struct{}

func NewStockService() *StockService {
	return &StockService{}
}

// StockTransferItem DTO for transfer requests
type StockTransferItem struct {
	ProductUUID string  `json:"productUuid"`
	Quantity    float64 `json:"quantity"`
}

// ProcessOrderStock deduction now requires a warehouseID
func (s *StockService) ProcessOrderStock(tx *gorm.DB, order domain.Order, warehouseID string) error {
	for _, item := range order.Items {
		var product domain.Product
		if err := tx.Where("uuid = ?", item.ProductUUID).First(&product).Error; err != nil {
			return fmt.Errorf("product not found for stock deduction: %v", err)
		}

		qty := item.Quantity

		if !product.IsComposite {
			// Case A: Simple Product -> Deduct from InventoryStock (Warehouse Specific)

			// ensure record exists or handle "not found" as 0 stock if preventing negative?
			// Assumption: We allow negative stock for now as per previous logic "Deduct Stock (Allow Negative)" logic in SQL

			result := tx.Model(&domain.InventoryStock{}).
				Where("product_uuid = ? AND warehouse_uuid = ?", product.UUID, warehouseID).
				Update("quantity", gorm.Expr("quantity - ?", qty))

			if result.Error != nil {
				return fmt.Errorf("failed to deduct stock for %s: %w", product.Name, result.Error)
			}

			if result.RowsAffected == 0 {
				// If no stock record exists, we might need to create one with negative quantity?
				// Or return error? For offline-first POS, usually we authorize sale and sync later.
				// Let's create it with negative value.
				newStock := domain.InventoryStock{
					ProductUUID:   product.UUID,
					WarehouseUUID: warehouseID,
					TenantID:      order.TenantID,
					Quantity:      -qty,
				}
				if err := tx.Create(&newStock).Error; err != nil {
					return fmt.Errorf("failed to initialize negative stock for %s: %w", product.Name, err)
				}
			}

			// Ledger Entry
			ledger := domain.InventoryLedger{
				ProductUUID:    product.UUID,
				ReferenceID:    order.UUID,
				Type:           "SALE",
				QuantityChange: -qty,
				SnapshotCost:   0, // TODO: Fetch cost from ProductSupplier?
				TenantID:       order.TenantID,
			}
			if err := tx.Create(&ledger).Error; err != nil {
				return fmt.Errorf("failed to create ledger entry: %w", err)
			}

		} else {
			// Case B: Composite Product (Recipe)
			var recipes []domain.Recipe
			if err := tx.Where("product_uuid = ?", product.UUID).Find(&recipes).Error; err != nil {
				return fmt.Errorf("failed to fetch recipes for %s: %w", product.Name, err)
			}

			if len(recipes) == 0 {
				fmt.Printf("WARNING: Product %s is composite but has no recipe\n", product.Name)
				continue
			}

			for _, recipe := range recipes {
				deductionQty := recipe.Quantity * qty

				// Update Ingredient Stock
				// NOTE: Ingredients are currently NOT warehouse-scoped in legacy schema.
				// Keeping legacy behavior for Ingredients unless they are migrated to InventoryStock too.
				if err := tx.Model(&domain.Ingredient{}).Where("uuid = ?", recipe.IngredientUUID).
					Update("stock", gorm.Expr("stock - ?", deductionQty)).Error; err != nil {
					return fmt.Errorf("failed to deduct ingredient stock: %w", err)
				}

				ledger := domain.InventoryLedger{
					ProductUUID:    recipe.IngredientUUID,
					ReferenceID:    order.UUID,
					Type:           "SALE_COMPONENT",
					QuantityChange: -deductionQty,
					TenantID:       order.TenantID,
				}
				if err := tx.Create(&ledger).Error; err != nil {
					return fmt.Errorf("failed to create ingredient ledger: %w", err)
				}
			}
		}
	}
	return nil
}

// StockTransfer handles moving stock between warehouses
func (s *StockService) StockTransfer(tx *gorm.DB, tenantID, fromWarehouseID, toWarehouseID string, items []StockTransferItem) error {
	if fromWarehouseID == toWarehouseID {
		return errors.New("cannot transfer to the same warehouse")
	}

	transferRef := fmt.Sprintf("TRF-%d", 12345) // In prod, generate UUID or unique ID

	for _, item := range items {
		if item.Quantity <= 0 {
			continue
		}

		// 1. Deduct from Source
		// We use clause.Returning{} if we need to check values, but simple Update is fine.
		// Using db raw SQL or GORM expressions.
		res := tx.Model(&domain.InventoryStock{}).
			Where("product_uuid = ? AND warehouse_uuid = ? AND tenant_id = ?", item.ProductUUID, fromWarehouseID, tenantID).
			Update("quantity", gorm.Expr("quantity - ?", item.Quantity))

		if res.Error != nil {
			return fmt.Errorf("failed to deduct from source: %w", res.Error)
		}
		if res.RowsAffected == 0 {
			// Fail if source doesn't have record? Or allow negative?
			// Usually Transfer requires stock. Let's error.
			return fmt.Errorf("insufficient stock record for product %s in source warehouse", item.ProductUUID)
		}

		// 2. Add to Destination
		// Upsert logic: On Conflict (product, warehouse) Do Update
		destStock := domain.InventoryStock{
			ProductUUID:   item.ProductUUID,
			WarehouseUUID: toWarehouseID,
			TenantID:      tenantID,
			Quantity:      item.Quantity,
		}

		// PostgreSQL Upsert
		err := tx.Clauses(clause.OnConflict{
			Columns:   []clause.Column{{Name: "product_uuid"}, {Name: "warehouse_uuid"}},
			DoUpdates: clause.Assignments(map[string]interface{}{"quantity": gorm.Expr("inventory_stocks.quantity + ?", item.Quantity)}),
		}).Create(&destStock).Error

		if err != nil {
			return fmt.Errorf("failed to add to destination: %w", err)
		}

		// 3. Ledger Entries (Out and In)
		ledgerOut := domain.InventoryLedger{
			ProductUUID:    item.ProductUUID,
			ReferenceID:    transferRef,
			Type:           "TRANSFER_OUT",
			QuantityChange: -item.Quantity,
			TenantID:       tenantID,
		}
		ledgerIn := domain.InventoryLedger{
			ProductUUID:    item.ProductUUID,
			ReferenceID:    transferRef,
			Type:           "TRANSFER_IN",
			QuantityChange: item.Quantity,
			TenantID:       tenantID,
		}

		if err := tx.Create(&ledgerOut).Error; err != nil {
			return err
		}
		if err := tx.Create(&ledgerIn).Error; err != nil {
			return err
		}
	}

	return nil
}
