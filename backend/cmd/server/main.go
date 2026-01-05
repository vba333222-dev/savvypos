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
		fx.Invoke(
			server.RegisterRoutes,
			server.Start,
		),
	)

	if err := app.Start(context.Background()); err != nil {
		log.Fatal(err)
	}

	<-app.Done()
}
