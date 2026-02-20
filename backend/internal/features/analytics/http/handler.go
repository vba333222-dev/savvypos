package http

import (
	"net/http"
	"strconv"
	"time"

	"savvy-pos-backend/internal/core/domain"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type AnalyticsHandler struct {
	db *gorm.DB
}

func NewAnalyticsHandler(db *gorm.DB) *AnalyticsHandler {
	return &AnalyticsHandler{db: db}
}

// GetSalesSummary godoc
// @Summary Get Sales Summary
// @Description Get total revenue, order count, and gross profit for a date range
// @Tags analytics
// @Accept json
// @Produce json
// @Param date_start query string true "Start Date (ISO8601)"
// @Param date_end query string true "End Date (ISO8601)"
// @Success 200 {object} map[string]interface{}
// @Router /v1/analytics/sales_summary [get]
func (h *AnalyticsHandler) GetSalesSummary(c *gin.Context) {
	dateStartStr := c.Query("date_start")
	dateEndStr := c.Query("date_end")

	if dateStartStr == "" || dateEndStr == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "date_start and date_end are required"})
		return
	}

	// Basic Validation/Parsing could replace string usage
	// Using default GORM range query for Strings works if format is standard ISO (YYYY-MM-DD...)

	var totalRevenue float64
	var totalOrders int64

	// Query Revenue and Count
	// Select SUM(grand_total) ...
	if err := h.db.Model(&domain.Order{}).
		Where("transaction_date >= ? AND transaction_date <= ?", dateStartStr, dateEndStr).
		Select("COALESCE(SUM(grand_total), 0)").
		Scan(&totalRevenue).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to calculate revenue"})
		return
	}

	if err := h.db.Model(&domain.Order{}).
		Where("transaction_date >= ? AND transaction_date <= ?", dateStartStr, dateEndStr).
		Count(&totalOrders).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to count orders"})
		return
	}

	// COGS Calculation (simplified: sum of cost of sold items)
	// Requires joining OrderItems -> Products/Ingredients
	// For MVP, returning 0 or placeholder if Cost data not reliably populated yet.
	// We added Cost to Ingredient, but Product cost might be static.
	// Let's defer comprehensive COGS to next phase or provide simple placeholder.
	grossProfit := totalRevenue // - COGS

	c.JSON(http.StatusOK, gin.H{
		"total_revenue": totalRevenue,
		"total_orders":  totalOrders,
		"gross_profit":  grossProfit,
	})
}

// GetTopProducts godoc
// @Summary Get Top Selling Products
// @Description Get list of products sorted by quantity sold
// @Tags analytics
// @Accept json
// @Produce json
// @Success 200 {array} map[string]interface{}
// @Router /v1/analytics/top_products [get]
// GetTopProducts godoc
// @Summary Get Top Selling Products
// @Description Get list of products sorted by quantity sold
// @Tags analytics
// @Accept json
// @Produce json
// @Param limit query int false "Limit (default 5)"
// @Success 200 {array} map[string]interface{}
// @Router /v1/analytics/top_products [get]
func (h *AnalyticsHandler) GetTopProducts(c *gin.Context) {
	limitStr := c.Query("limit")
	limit := 5
	if limitStr != "" {
		if val, err := strconv.Atoi(limitStr); err == nil {
			limit = val
		}
	}

	type Result struct {
		Name     string  `json:"name"`
		Quantity float64 `json:"quantity"`
	}

	var results []Result

	// Using Raw SQL or Gorm Scope for limit could be cleaner
	query := h.db.Model(&domain.OrderItem{}).
		Select("name, SUM(quantity) as quantity").
		Group("name").
		Order("quantity desc")

	if limitStr != "" {
		// If using raw SQL injection protection is needed, but limit is int.
		// Safe way:
		// query = query.Limit(limitParsed)
		// We'll just trust GORM or default to 10 if not provided in previous implementation,
		// but requirement says "Query: limit=5" implies dynamic.
		// For simplicty in this snippet without strconv import:
		if limitStr == "10" {
			limit = 10
		}
		if limitStr == "20" {
			limit = 20
		}
	}
	query.Limit(limit)

	if err := query.Scan(&results).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch top products"})
		return
	}

	c.JSON(http.StatusOK, results)
}

// GetSummary godoc
// @Summary Get Dashboard Summary
// @Description Get total revenue, order count, and gross profit for a date range (default today)
// @Tags analytics
// @Accept json
// @Produce json
// @Param date_start query string false "Start Date (YYYY-MM-DD)"
// @Param date_end query string false "End Date (YYYY-MM-DD)"
// @Success 200 {object} map[string]interface{}
// @Router /v1/analytics/summary [get]
func (h *AnalyticsHandler) GetSummary(c *gin.Context) {
	dateStart := c.Query("date_start")
	dateEnd := c.Query("date_end")

	if dateStart == "" {
		dateStart = time.Now().Format("2006-01-02")
	}
	if dateEnd == "" {
		dateEnd = time.Now().Format("2006-01-02")
	}

	var totalRevenue float64
	var totalOrders int64
	var lowStockCount int64

	// Revenue & Orders
	// Note: We use DATE() for strict day comparison or ranges
	// Since inputs are YYYY-MM-DD, we can just compare >= start AND <= end (assuming 00:00:00 to 23:59:59 implied or string comparison works for days)
	// Ideally: start at 00:00 and end at 23:59.
	// For MVP: string compare 'transaction_date >= dateStart' works if transaction_date is ISO.
	// But transaction_date is stored as Timestamp.
	// Better: WHERE DATE(transaction_date) between ? and ?

	h.db.Model(&domain.Order{}).
		Where("DATE(transaction_date) >= ? AND DATE(transaction_date) <= ?", dateStart, dateEnd).
		Select("COALESCE(SUM(grand_total), 0)").
		Scan(&totalRevenue)

	h.db.Model(&domain.Order{}).
		Where("DATE(transaction_date) >= ? AND DATE(transaction_date) <= ?", dateStart, dateEnd).
		Count(&totalOrders)

	// Low Stock (Static)
	h.db.Model(&domain.Product{}).Where("stock < ?", 10).Count(&lowStockCount)

	c.JSON(http.StatusOK, gin.H{
		"total_revenue":   totalRevenue,
		"today_sales":     totalRevenue, // Alias for backward compatibility if dates are today
		"total_orders":    totalOrders,
		"gross_profit":    totalRevenue, // Placeholder as per logic
		"low_stock_count": lowStockCount,
	})
}

// GetSalesChart godoc
// @Summary Get Sales Chart
// @Description Get sales data for a specific range (weekly, monthly)
// @Tags analytics
// @Accept json
// @Produce json
// @Param range query string false "Range (weekly, monthly)"
// @Success 200 {array} map[string]interface{}
// @Router /v1/analytics/sales_chart [get]
func (h *AnalyticsHandler) GetSalesChart(c *gin.Context) {
	rangeType := c.Query("range")
	interval := "7 days" // Default
	if rangeType == "monthly" {
		interval = "30 days"
	} else if rangeType == "weekly" {
		interval = "7 days"
	}

	type ChartData struct {
		Date  string  `json:"date"`
		Total float64 `json:"total"`
	}
	var results []ChartData

	// Postgres specific syntax
	// SAFE from SQL injection because interval is controlled by if/else above
	query := `
        SELECT TO_CHAR(transaction_date, 'YYYY-MM-DD') as date, SUM(grand_total) as total
        FROM orders
        WHERE transaction_date >= NOW() - INTERVAL '` + interval + `'
        GROUP BY date
        ORDER BY date ASC
    `

	if err := h.db.Raw(query).Scan(&results).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch chart data"})
		return
	}

	c.JSON(http.StatusOK, results)
}
