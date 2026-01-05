package storage

import (
	"fmt"
	"os"

	"savvy-pos-backend/internal/core/domain"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func NewPostgresDB() (*gorm.DB, error) {
	host := os.Getenv("POSTGRES_HOST")
	if host == "" {
		host = "localhost"
	}

	dsn := fmt.Sprintf(
		"host=%s user=%s password=%s dbname=%s port=%s sslmode=disable TimeZone=UTC",
		host,
		os.Getenv("POSTGRES_USER"),
		os.Getenv("POSTGRES_PASSWORD"),
		os.Getenv("POSTGRES_DB"),
		"5432", // Default port inside docker or mapped
	)

	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		return nil, err
	}

	// Auto Migrate Tables
	err = db.AutoMigrate(
		&domain.Order{},
		&domain.OrderItem{},
		&domain.Product{},
		&domain.Customer{},
	)
	if err != nil {
		return nil, err
	}

	return db, nil
}
