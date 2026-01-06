package main

import (
	"context"
	"log"

	"savvy-pos-backend/internal/core/domain"
	"savvy-pos-backend/internal/core/server"
	"savvy-pos-backend/internal/core/storage"
	analyticsHttp "savvy-pos-backend/internal/features/analytics/http"
	authHttp "savvy-pos-backend/internal/features/auth/http"
	authService "savvy-pos-backend/internal/features/auth/service"
	inventoryService "savvy-pos-backend/internal/features/inventory/service"
	"savvy-pos-backend/internal/features/sync/http"

	"go.uber.org/fx"
	"gorm.io/gorm"
)

func main() {
	app := fx.New(
		fx.Provide(
			storage.NewPostgresDB,
			server.NewGinEngine,
			http.NewSyncHandler,
			authHttp.NewAuthHandler,
			authService.NewJWTService,
			inventoryService.NewStockService,
			analyticsHttp.NewAnalyticsHandler,
		),
		fx.Invoke(
			server.RegisterRoutes,
			server.Start,
			func(db *gorm.DB) error {
				return db.AutoMigrate(
					&domain.TenantConfig{},
					&domain.Product{},
					&domain.Customer{},
					&domain.Order{},
					&domain.OrderItem{},
					&domain.Employee{},
					&domain.Ingredient{},
					&domain.Recipe{},
				)
			},
		),
	)

	if err := app.Start(context.Background()); err != nil {
		log.Fatal(err)
	}

	<-app.Done()
}
