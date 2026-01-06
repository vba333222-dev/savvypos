package server

import (
	"context"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"go.uber.org/fx"

	middleware "savvy-pos-backend/internal/core/middleware"
	analyticsHttp "savvy-pos-backend/internal/features/analytics/http"
	authHttp "savvy-pos-backend/internal/features/auth/http"
	authService "savvy-pos-backend/internal/features/auth/service"
	syncHttp "savvy-pos-backend/internal/features/sync/http"

	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
)

func NewGinEngine() *gin.Engine {
	r := gin.Default()
	r.Use(middleware.CorsMiddleware())

	r.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{"status": "ok", "service": "savvy-pos-backend"})
	})

	r.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))

	return r
}

func RegisterRoutes(r *gin.Engine, syncHandler *syncHttp.SyncHandler, authHandler *authHttp.AuthHandler, jwtService *authService.JWTService, analyticsHandler *analyticsHttp.AnalyticsHandler) {
	v1 := r.Group("/v1")
	{
		auth := v1.Group("/auth")
		auth.POST("/login", authHandler.Login)

		sync := v1.Group("/sync")
		sync.Use(middleware.AuthMiddleware(jwtService))
		sync.POST("/push", syncHandler.HandlePush)
		sync.GET("/pull", syncHandler.HandlePull)

		analytics := v1.Group("/analytics")
		analytics.Use(middleware.AuthMiddleware(jwtService))
		analytics.GET("/sales_summary", analyticsHandler.GetSalesSummary)
		analytics.GET("/top_products", analyticsHandler.GetTopProducts)
		analytics.GET("/summary", analyticsHandler.GetSummary)
		analytics.GET("/sales_chart", analyticsHandler.GetSalesChart)
	}
}

func Start(lc fx.Lifecycle, r *gin.Engine) {
	server := &http.Server{
		Addr:    ":8080",
		Handler: r,
	}

	lc.Append(fx.Hook{
		OnStart: func(ctx context.Context) error {
			log.Println("Starting HTTP server on :8080")
			go server.ListenAndServe()
			return nil
		},
		OnStop: func(ctx context.Context) error {
			log.Println("Stopping HTTP server")
			return server.Shutdown(ctx)
		},
	})
}
