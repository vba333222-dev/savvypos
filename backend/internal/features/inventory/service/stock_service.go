package service

import (
	"fmt"
	"savvy-pos-backend/internal/core/domain"

	"gorm.io/gorm"
)

type StockService struct{}

func NewStockService() *StockService {
	return &StockService{}
}

func (s *StockService) ProcessOrderStock(tx *gorm.DB, order domain.Order) error {
	for _, item := range order.Items {
		var product domain.Product
		// Fetch product
		if err := tx.Where("uuid = ?", item.ProductUUID).First(&product).Error; err != nil {
			return fmt.Errorf("product not found for stock deduction: %v", err)
		}

		qty := item.Quantity

		if !product.IsComposite {
			// Case A: Simple Product
			// 1. Deduct Stock (Allow Negative)
			if err := tx.Model(&product).Update("stock", gorm.Expr("stock - ?", qty)).Error; err != nil {
				return fmt.Errorf("failed to deduct stock for %s: %w", product.Name, err)
			}

			// 2. Ledger Entry
			ledger := domain.InventoryLedger{
				ProductUUID:    product.UUID,
				ReferenceID:    order.UUID,
				Type:           "SALE",
				QuantityChange: -qty, // Negative for deduction
				SnapshotCost:   0,    // could fetch cost if needed
				TenantID:       order.TenantID,
			}
			if err := tx.Create(&ledger).Error; err != nil {
				// Log warning but don't fail? Or fail?
				// User said "Opsional tapi disarankan". We'll try to insert.
				return fmt.Errorf("failed to create ledger entry: %w", err)
			}

		} else {
			// Case B: Composite Product (Recipe)
			var recipes []domain.Recipe
			if err := tx.Where("product_uuid = ?", product.UUID).Find(&recipes).Error; err != nil {
				return fmt.Errorf("failed to fetch recipes for %s: %w", product.Name, err)
			}

			if len(recipes) == 0 {
				// Warning Logger
				fmt.Printf("WARNING: Product %s is composite but has no recipe\n", product.Name)
				continue
			}

			for _, recipe := range recipes {
				deductionQty := recipe.Quantity * qty

				// Update Ingredient Stock
				if err := tx.Model(&domain.Ingredient{}).Where("uuid = ?", recipe.IngredientUUID).
					Update("stock", gorm.Expr("stock - ?", deductionQty)).Error; err != nil {
					return fmt.Errorf("failed to deduct ingredient stock: %w", err)
				}

				// Ledger for Ingredient?
				// Usually yes.
				// find ingredient to get UUID? recipe.IngredientUUID is enough.
				ledger := domain.InventoryLedger{
					ProductUUID: recipe.IngredientUUID, // Storing Ingredient UUID in ProductUUID field of ledger? Or should Ledger be polymorphic?
					// Typically Ledger tracks generic "Items". Assuming Ingredient UUID works here if Ledger is for both or we skip.
					// Let's assume we track ingredients too.
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
