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
		// Fetch product to check IsComposite
		if err := tx.Where("uuid = ?", item.ProductUUID).First(&product).Error; err != nil {
			// If product not found (rare race or sync issue), error to allow handler to decide policy.
			// Ideally, we should log warnings rather than fail sync if product was deleted.
			// But strict consisteny means we error.
			return fmt.Errorf("product not found for stock deduction: %v", err)
		}

		qty := item.Quantity

		if !product.IsComposite {
			// Direct Deduction
			// UPDATE products SET stock = stock - qty WHERE uuid = ...
			// Using gorm.Expr for atomic update
			if err := tx.Model(&product).Update("stock", gorm.Expr("stock - ?", qty)).Error; err != nil {
				return fmt.Errorf("failed to deduct stock for %s: %w", product.Name, err)
			}

			// Ledger Entry? User asked for "Simple Product: Kurangi stok ... (atau buat entri stock_ledger)".
			// Let's stick to simple decrement for now as requested by user logic "Kurangi stok langsung di tabel products".
			// A ledger table would be better but let's follow explicit "Kurangi stok langsung".
		} else {
			// Composite Deduction (Recipe)
			var recipes []domain.Recipe
			if err := tx.Where("product_uuid = ?", product.UUID).Find(&recipes).Error; err != nil {
				return fmt.Errorf("failed to fetch recipes for %s: %w", product.Name, err)
			}

			if len(recipes) == 0 {
				// No recipe found for composite item.
				// Log and continue
				// fmt.Printf("No recipe for composite product %s\n", product.Name)
				continue
			}

			for _, recipe := range recipes {
				deductionQty := recipe.Quantity * qty
				// Update Ingredient Stock
				if err := tx.Model(&domain.Ingredient{}).Where("uuid = ?", recipe.IngredientUUID).
					Update("stock", gorm.Expr("stock - ?", deductionQty)).Error; err != nil {
					return fmt.Errorf("failed to deduct ingredient stock: %w", err)
				}
			}
		}
	}
	return nil
}
