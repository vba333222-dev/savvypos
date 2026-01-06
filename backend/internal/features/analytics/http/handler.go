package http

import (
	"net/http"
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
func (h *AnalyticsHandler) GetTopProducts(c *gin.Context) {
	// Query group by product_uuid, sum quantity
	type Result struct {
		Name     string  `json:"name"`
		Quantity float64 `json:"quantity"`
	}

	var results []Result

	if err := h.db.Model(&domain.OrderItem{}).
		Select("name, SUM(quantity) as quantity").
		Group("name").
		Order("quantity desc").
		Limit(10).
		Scan(&results).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch top products"})
		return
	}

	c.JSON(http.StatusOK, results)
}

// GetSummary godoc
// @Summary Get Dashboard Summary
// @Description Get today's sales, order count, and low stock count
// @Tags analytics
// @Accept json
// @Produce json
// @Success 200 {object} map[string]interface{}
// @Router /v1/analytics/summary [get]
func (h *AnalyticsHandler) GetSummary(c *gin.Context) {
	today := time.Now().Format("2006-01-02")
	var todaySales float64
	var totalOrders int64
	var lowStockCount int64

	h.db.Model(&domain.Order{}).Where("DATE(transaction_date) = ?", today).Select("COALESCE(SUM(grand_total), 0)").Scan(&todaySales)
	h.db.Model(&domain.Order{}).Where("DATE(transaction_date) = ?", today).Count(&totalOrders)

	// Heuristic: Stock < 10
	h.db.Model(&domain.Product{}).Where("stock < ?", 10).Count(&lowStockCount)

	c.JSON(http.StatusOK, gin.H{
		"today_sales":     todaySales,
		"total_orders":    totalOrders,
		"low_stock_count": lowStockCount,
	})
}

// GetSalesChart godoc
// @Summary Get 7-Day Sales Chart
// @Description Get sales data for the last 7 days
// @Tags analytics
// @Accept json
// @Produce json
// @Success 200 {array} map[string]interface{}
// @Router /v1/analytics/sales_chart [get]
func (h *AnalyticsHandler) GetSalesChart(c *gin.Context) {
	type ChartData struct {
		Date  string  `json:"date"`
		Total float64 `json:"total"`
	}
	var results []ChartData

	// Postgres specific syntax for date grouping
	// Assuming transaction_date is timestamp
	err := h.db.Raw(`
        SELECT TO_CHAR(transaction_date, 'YYYY-MM-DD') as date, SUM(grand_total) as total
        FROM orders
        WHERE transaction_date >= NOW() - INTERVAL '7 days'
        GROUP BY date
        ORDER BY date ASC
    `).Scan(&results).Error

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch chart data"})
		return
	}

	c.JSON(http.StatusOK, results)
}
