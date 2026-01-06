package middleware

import (
	"net/http"
	"savvy-pos-backend/internal/features/auth/service"
	"strings"

	"github.com/gin-gonic/gin"
)

func AuthMiddleware(jwtService *service.JWTService) gin.HandlerFunc {
	return func(c *gin.Context) {
		authHeader := c.GetHeader("Authorization")
		if authHeader == "" {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Authorization header missing"})
			return
		}

		parts := strings.Split(authHeader, " ")
		if len(parts) != 2 || parts[0] != "Bearer" {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Invalid authorization format"})
			return
		}

		claims, err := jwtService.ValidateToken(parts[1])
		if err != nil {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"error": "Invalid or expired token"})
			return
		}

		c.Set("userID", claims.UserID)

		// Prioritize X-Tenant-ID header if present (Multi-tenant support)
		if tenantID := c.GetHeader("X-Tenant-ID"); tenantID != "" {
			c.Set("tenantID", tenantID)
		} else {
			c.Set("tenantID", claims.TenantID)
		}

		c.Next()
	}
}
