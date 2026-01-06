package server

import (
	"context"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"go.uber.org/fx"

	"savvy-pos-backend/internal/core/middleware"
	authHttp "savvy-pos-backend/internal/features/auth/http"
	authService "savvy-pos-backend/internal/features/auth/service"
	syncHttp "savvy-pos-backend/internal/features/sync/http"
)

func NewGinEngine() *gin.Engine {
	r := gin.Default()

	r.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{"status": "ok", "service": "savvy-pos-backend"})
	})

	return r
}

func RegisterRoutes(r *gin.Engine, syncHandler *syncHttp.SyncHandler, authHandler *authHttp.AuthHandler, jwtService *authService.JWTService) {
	v1 := r.Group("/v1")
	{
		auth := v1.Group("/auth")
		auth.POST("/login", authHandler.Login)

		sync := v1.Group("/sync")
		sync.Use(middleware.AuthMiddleware(jwtService))
		sync.POST("/push", syncHandler.HandlePush)
		sync.GET("/pull", syncHandler.HandlePull)
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
