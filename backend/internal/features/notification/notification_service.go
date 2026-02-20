package notification

import (
	"log"
	"time"

	"github.com/google/uuid"
)

type NotificationType string

const (
	TypeAlert NotificationType = "ALERT" // Red, Urgent
	TypeInfo  NotificationType = "INFO"  // Blue, Informational
)

type Notification struct {
	ID        string
	Type      NotificationType
	Title     string
	Body      string
	IsRead    bool
	CreatedAt time.Time
}

type NotificationService struct {
	// Inject DB repository here
}

func NewNotificationService() *NotificationService {
	return &NotificationService{}
}

func (s *NotificationService) TriggerAlert(title, body string) error {
	return s.send(TypeAlert, title, body)
}

func (s *NotificationService) TriggerInfo(title, body string) error {
	return s.send(TypeInfo, title, body)
}

func (s *NotificationService) send(nType NotificationType, title, body string) error {
	notif := Notification{
		ID:        uuid.New().String(),
		Type:      nType,
		Title:     title,
		Body:      body,
		IsRead:    false,
		CreatedAt: time.Now(),
	}

	// 1. Save to DB
	// repo.Save(notif)
	log.Printf("[Notification] Persisting %s: %s - %s\n", nType, title, body)

	// 2. Push to WebSocket (The Signal)
	// wsHub.Broadcast("new_notification", notif)
	log.Println("BROADCAST: new_notification -> Clients")

	return nil
}
