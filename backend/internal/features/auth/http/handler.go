package http

import (
	"fmt"
	"net/http"
	"savvy-pos-backend/internal/core/domain"
	"savvy-pos-backend/internal/features/auth/service"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type AuthHandler struct {
	db         *gorm.DB
	jwtService *service.JWTService
}

func NewAuthHandler(db *gorm.DB, jwtService *service.JWTService) *AuthHandler {
	return &AuthHandler{
		db:         db,
		jwtService: jwtService,
	}
}

type LoginRequest struct {
	StoreCode string `json:"store_code"`
	Username  string `json:"username"`
	Password  string `json:"password"` // Or PIN
}

func (h *AuthHandler) Login(c *gin.Context) {
	var req LoginRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request"})
		return
	}

	var employee domain.Employee
	// In a real scenario, use bcrypt.CompareHashAndPassword
	// h.db.Where("username = ? OR pin = ?", req.Username, req.Password).First(&employee)

	// MOCK/DEMO LOGIC (Matches requirements if no seed data)
	// Query DB for employee matching username
	result := h.db.Where("username = ?", req.Username).First(&employee)

	isValid := false
	if result.Error == nil {
		// If found, check password (plaintext for now as per "Mock/Demo" speed, or simple compare)
		// If req.Password matches employee.Password (or PIN)
		if employee.Password == req.Password || employee.PIN == req.Password {
			isValid = true
		}
	} else {
		// Fallback for admin/1234 if DB empty
		if req.Username == "admin" && req.Password == "1234" {
			isValid = true
			employee.ID = 1
			employee.TenantID = "store-123"
		}
	}

	if !isValid {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid credentials"})
		return
	}

	token, err := h.jwtService.GenerateToken(fmt.Sprintf("%d", employee.ID), employee.TenantID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to generate token"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"token": token,
	})
}
