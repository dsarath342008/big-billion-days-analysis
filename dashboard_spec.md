# Dashboard Specification
## Data Source

Connected to `data/orders\_clean.csv`. Below is the list of all 13 columns in the dataset along with their classification as a Dimension or Measure:



| Column Name | Classification | Description / Notes |
| :--- | :--- | :--- |
| `order\_id` | Dimension | Unique transaction identifier |
| `order\_month` | Dimension | Month and year of the order |
| `first\_name` | Dimension | Customer first name |
| `last\_name` | Dimension | Customer last name |
| `region` | Dimension | Geographic sales region |
| `rep\_name` | Dimension | Sales representative name |
| `item` | Dimension | Purchased product item name |
| `category` | Dimension | Product category |
| `unit\_price` | Measure | Price per individual unit |
| `quantity` | Measure | Number of units purchased |
| `amount` | Measure | Total recorded amount |
| `revenue\_calc` | Measure | Calculated revenue metric |
| `status` | Dimension | Order fulfillment status (completed, pending, etc.) |




# Dashboard Specification & Executive Narrative

## 1. Visualization Summary
The dashboard provides a comprehensive executive overview of retail performance across regions, product categories, and order timelines based on the `orders_clean` dataset. It features key high-level metrics including total revenue ($346,200) and units sold (106), alongside multi-dimensional breakdowns: a monthly revenue trend line by category, comparative revenue charts per region and category, and a detailed cross-tabulation table mapping every regional category intersection. This enables stakeholders to quickly identify top-performing markets, track seasonal growth, and spot lagging product segments at a glance.

## 2. Summary Analysis
* **Regional Sales Volume Comparison:** The **North** region leads all territories as the highest-grossing market with total revenue reaching **$119,300**, significantly outperforming the lowest-performing **West** region, which recorded **$69,500** in total sales.
* **Leading Category Contribution:** **Electronics** is the dominant product category overall, generating exceptional sales volume, particularly driven by strong consumer demand in the **North** region where electronics sales reached **$73,400**.
* **Monthly Trajectory Change:** Across the timeline from September to November, overall sales show a noticeable upward momentum, shifting from moderate baseline activity in **September** to peak revenue spikes across multiple categories by **November**.

## 3. Recommendations

### Recommendation 1: East Region / Electronics
* **Action:** Launch a focused promotional campaign and bundle high-demand items to stimulate conversion rates in lagging areas.
* **Supporting Number:** The **East** region lags behind other territories with a lower total revenue baseline of **$69,500**.
* **Success Metric:** Increase monthly electronics revenue in the West region by **15%** within 60 days.

### Recommendation 2: South Region / Home
* **Action:** Increase stock levels and feature targeted local discounts for popular home goods (such as air fryers and appliances).
* **Supporting Number:** The **South** region demonstrates a solid mid-tier foundation with **$43,800** coming directly from the Home category.
* **Success Metric:** Lift Home category sales volume in the South region by **20%** over the next quarter.


## 4. Reconciliation Table
To ensure accuracy across all aggregated levels of the dataset, the master revenue figure has been independently reconciled across multiple dashboard views and matrix roll-ups:

| Metric Source / Component | Breakdown Level | Total Revenue Value | Status / Verification |
| :--- | :--- | :--- | :--- |
| **Total Revenue KPI** | Overall Dashboard Metric | **$346,200** | Baseline KPI Match |
| **Revenue by Region** | Sum of (East + North + South + West) | **$346,200** | Fully Reconciled |
| **Revenue by Category** | Sum of (Apparel + Electronics + Home) | **$346,200** | Fully Reconciled |
| **Pivot Grand Total (Part B)** | Matrix / Cross-Tabulation Total | **$346,200** | Fully Reconciled |

