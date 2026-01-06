package service

import (
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
			// If product not found (rare race or sync issue), we might log and continue or error.
			// For strict inventory, we error.
			return err
		}

		qty := item.Quantity

		if !product.IsComposite {
			// Direct Deduction
			// UPDATE products SET stock = stock - qty WHERE uuid = ...
			if err := tx.Model(&product).Update("stock", gorm.Expr("stock - ?", qty)).Error; err != nil {
				return err
			}
		} else {
			// Composite Deduction (Recipe)
			var recipes []domain.Recipe
			if err := tx.Where("product_uuid = ?", product.UUID).Find(&recipes).Error; err != nil {
				return err
			}

			if len(recipes) == 0 {
				// If composite product has no recipe, we can't deduct ingredients.
				// We should probably log this warning.
				// For now, valid to just continue or error.
				continue
			}

			for _, recipe := range recipes {
				deductionQty := recipe.Quantity * qty
				// Update Ingredient Stock
				if err := tx.Model(&domain.Ingredient{}).Where("uuid = ?", recipe.IngredientUUID).
					Update("stock", gorm.Expr("stock - ?", deductionQty)).Error; err != nil {
					return err
				}
			}
		}
	}
	return nil
}
