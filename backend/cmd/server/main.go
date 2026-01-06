package main

import (
	"context"
	"log"

	"savvy-pos-backend/internal/core/server"
	"savvy-pos-backend/internal/core/storage"
	"savvy-pos-backend/internal/features/sync/http"

	"go.uber.org/fx"
)

func main() {
	app := fx.New(
		fx.Provide(
			storage.NewPostgresDB,
			server.NewGinEngine,
			http.NewSyncHandler,
		),
			server.RegisterRoutes,
			server.Start,
			func(db *gorm.DB) error {
				return db.AutoMigrate(
					&domain.TenantConfig{},
					&domain.Product{},
					&domain.Customer{},
					&domain.Order{},
					&domain.OrderItem{},
				)
			},
		),
	)

	if err := app.Start(context.Background()); err != nil {
		log.Fatal(err)
	}

	<-app.Done()
}
