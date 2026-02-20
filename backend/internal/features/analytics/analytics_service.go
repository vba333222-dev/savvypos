package analytics

import (
	"log"
	"strings"
)

type AnalyticsService struct {
	// Inject OrderRepo to analyze past orders
}

func NewAnalyticsService() *AnalyticsService {
	return &AnalyticsService{}
}

// PredictSuggestion takes the current cart item names and returns a suggestion.
func (s *AnalyticsService) PredictSuggestion(cartItems []string) (string, float64) {
	// Mock Frequency Analysis Logic (The Oracle)
	// In reality, this would query a pre-computed association matrix or ML model.

	hasBurger := false
	hasCoffee := false

	for _, item := range cartItems {
		lowerItem := strings.ToLower(item)
		if strings.Contains(lowerItem, "burger") {
			hasBurger = true
		}
		if strings.Contains(lowerItem, "coffee") {
			hasCoffee = true
		}
	}

	// 1. Rule: Burger -> Fries
	if hasBurger {
		log.Println("[Oracle] Logic: Cart has Burger -> Suggest Fries")
		return "French Fries", 2.50
	}

	// 2. Rule: Coffee -> Donut
	if hasCoffee {
		log.Println("[Oracle] Logic: Cart has Coffee -> Suggest Donut")
		return "Glazed Donut", 1.50
	}

	return "", 0
}
