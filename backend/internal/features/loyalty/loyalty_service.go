package loyalty

import (
	"log"
)

type TierLevel string

const (
	TierBronze TierLevel = "BRONZE"
	TierSilver TierLevel = "SILVER" // > 1000 pts
	TierGold   TierLevel = "GOLD"   // > 5000 pts
)

type Customer struct {
	ID             string
	Name           string
	Phone          string
	CurrentPoints  int
	LifetimePoints int
	Tier           TierLevel
}

type Reward struct {
	ID         string
	Name       string
	PointsCost int
	Icon       string
}

type LoyaltyService struct {
	// Inject DB Repo here
}

func NewLoyaltyService() *LoyaltyService {
	return &LoyaltyService{}
}

func (s *LoyaltyService) ProcessPayment(customerID string, amount float64) (*Customer, error) {
	// 1. Calculate Points (1 Unit = 1 Point)
	pointsEarned := int(amount)

	// 2. Fetch Customer (Mock)
	customer := &Customer{
		ID:             customerID,
		Name:           "John Doe",
		CurrentPoints:  450,
		LifetimePoints: 950,
		Tier:           TierBronze,
	}

	// 3. Update Points
	customer.CurrentPoints += pointsEarned
	customer.LifetimePoints += pointsEarned

	// 4. Check Tier Upgrade
	previousTier := customer.Tier
	customer.Tier = s.calculateTier(customer.LifetimePoints)

	if customer.Tier != previousTier {
		log.Printf("[Loyalty] Customer %s leveled up to %s!\n", customer.Name, customer.Tier)
		// Trigger "Level Up" Notification/Effect
	}

	log.Printf("[Loyalty] Added %d points to %s. Total: %d (Tier: %s)\n", pointsEarned, customer.Name, customer.CurrentPoints, customer.Tier)

	// Save to DB...

	return customer, nil
}

func (s *LoyaltyService) calculateTier(lifetimePoints int) TierLevel {
	if lifetimePoints > 5000 {
		return TierGold
	}
	if lifetimePoints > 1000 {
		return TierSilver
	}
	return TierBronze
}

func (s *LoyaltyService) GetRewards() []Reward {
	return []Reward{
		{ID: "1", Name: "Free Coffee", PointsCost: 500, Icon: "☕"},
		{ID: "2", Name: "Donut", PointsCost: 300, Icon: "🍩"},
		{ID: "3", Name: "10% Discount", PointsCost: 1000, Icon: "🏷️"},
	}
}
