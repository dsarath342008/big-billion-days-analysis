# Five Part Prompt For Part-A
- **Role:** You are an expert SQL database analyst writing queries for an e-commerce sales database.
- **Task:** Write SQL query q13 to calculate rep performance against their monthly targets based on completed orders.
- **Context:**
   - Database dialect: MySQL
   - Tables and columns: 
      - reps (rep_id, rep_name, region, monthly_target)
      - customers (customer_id, first_name, last_name, city, region, age, rep_id)
      - orders (order_id, customer_id, item, quantity, amount, status, order_month)
- **Constraints:** 
  - Include completed orders only (status = 'completed').
  - Compute performance_tier directly from the aggregate expression: 'Below Target' when revenue < monthly_target, 'On Target' when revenue >= monthly_target and < 1.1 * monthly_target, and 'Above Target' otherwise.
  - Do NOT use any WITH clauses (CTEs) or stored procedures.
  - Do not use WHERE clauses on aggregates or derived aliases.
- **Format:** Provide raw SQL code only, complete with inline comments explaining the logic.

# Inspect Scenario D1
| Defect Description | Classification | Correct Clause / Fix |
| :--- | :--- | :--- |
| Uses a non-existent table `sales` instead of the actual project tables. | fake method/function | Join the real `orders` and `customers` tables on `customer_id`. |
| Uses non-existent columns `region_name` and `total_sales`. | fake method/function | Use `c.region` for the region and `o.amount` for the sales/revenue. |
| Places an aggregate function (`SUM()`) directly inside the `WHERE` clause. | logic error | Move the aggregate filter into the `HAVING` clause (e.g., `HAVING SUM(o.amount) > 80000`). |
| Claims "North revenue grew 38% month over month" without verifying raw transaction records. | phantom statistic | Calculate the true month-over-month percentage change using verified data from the `q11` report. |

# Verify Scenario D1
| region_name | sales |
| :--- | :--- |
| North | 119300 |
| South | 82500 |

### Month-over-Month Growth Calculation for North Region

* **September 2026 (`2026-09`) North Revenue:** `68700` (derived from the `q11` report)
* **October 2026 (`2026-10`) North Revenue:** `53000` (derived from the `q11` report)
* **Percentage Change Formula:**
  $$\frac{53000 - 68700}{68700} \times 100 = -22.85\%$$
* **Rounded Value:** **`-22.8%`**

### Comparison with Assistant's Claim
The assistant claimed that *"North is the strongest region, and its revenue grew 38% month over month."*

* **Comparison Result:** The assistant's 38% growth claim is completely false and directly contradicted by the transactional data. Instead of growing by 38%, the North region's revenue actually declined by **22.8%** between September and October 2026.

# Human-in-the-Loop Protocol (Scenario D1)

* **Specification:** Defined the analytical objective to query regional sales totals for completed orders exceeding an 80,000 threshold using the proper relational schema (`orders` joined with `customers`).
* **Execution:** Generated the initial assistant response, which returned a flawed query utilizing non-existent tables/columns, an illegal aggregate clause, and an unverified performance growth claim.
* **Inspection:** Audited the AI response against schema dictionaries, identifying four structural and logical defects: the phantom `sales` table, non-existent `region_name`/`total_sales` columns, an aggregate function placed incorrectly inside a `WHERE` clause, and an unsupported 38% growth statistic.
* **Verification:** Executed the hand-corrected query (`sql/d1_corrected.sql`), which returned exactly two verified rows (North: 119,300 and South: 82,500), and cross-checked North's month-over-month revenue progression using the `q11` report, which proved revenue actually declined by 22.8%.
* **Decision:** **Reject** the original AI answer and its 38% growth claim due to invalid schema references and fabricated metrics; **Accept** the validated corrected query and empirical finding that North's actual month-over-month revenue change was -22.8%, backed by hard transactional evidence.

# Prompt for Scenario D2
### Scenario D2: Spreadsheet VLOOKUP Debugging

#### 1. Five-Part Prompt for the Assistant
* **Role:** Spreadsheet formulas and data troubleshooting expert.
* **Task:** Identify why a VLOOKUP formula returns a #N/A (value not found) error and provide the repaired formula.
* **Context:** The products lookup table occupies range `$A$2:$C$10` (with item names in column A and unit prices in column C). Cell G2 on the orders tab holds the text ` Smart Watch` (which contains an accidental leading space before the first letter).
* **Constraints:** The repaired formula must work dynamically when copied down across rows and handle slight text formatting discrepancies cleanly without requiring manual edits to the raw data tab.
* **Format:** Provide a concise explanation of the root cause followed by the exact corrected spreadsheet formula.

#### 2. Root Cause Analysis
* **Explanation:** The lookup value in cell G2 contains a hidden **leading space** (`" Smart Watch"`), whereas the product names stored in column A of the products table are stored as exact strings (`"Smart Watch"` without the leading space). Because exact-match VLOOKUP (`FALSE` or `0` as the final argument) evaluates character strings strictly, the extra space causes the match to fail even though the item text is present.

#### 3. Repaired Formula
```excel
=VLOOKUP(TRIM(G2), $A$2:$C$10, 3, FALSE)
```

# Skeptical-Analyst Check on Part-C


#### 1. Prompt for the Assistant
* **Role:** Act as a rigorous, skeptical business data analyst.
* **Task:** Challenge our first dashboard recommendation from Part C (which suggests launching a regional promotional push in the North region due to high volume). 
* **Context:** The dashboard shows that the North region generated the highest total revenue (119,300) during the Big Billion Days sale, driven heavily by electronics and repeat buyers.
* **Constraints:** Do not accept the recommendation at face value. Demand unstated assumptions, question whether correlation implies causation, and ask for empirical evidence before committing marketing budget.
* **Format:** Present a critical critique highlighting major risks, followed by a bulleted list of hidden assumptions and the specific data checks required to test them.

#### 2. Unstated Assumptions and Data Checks
1. **Assumption 1: High historical revenue in the North guarantees positive marginal returns on added marketing spend.**
   * *Verifying Figure / Data Check:* Inspect unit-level margins and previous promotion logs (`orders` joined with `products`) to ensure high sales volume is not driven entirely by heavy discounting or low-margin items that yield poor profitability.
2. **Assumption 2: Customer demand and purchasing power are uniform across all cities within the North region (e.g., Delhi, Jaipur, Lucknow).**
   * *Verifying Figure / Data Check:* Run a city-level breakdown query on customer orders (`customers` grouped by `city`) to confirm whether revenue is broadly distributed or dangerously concentrated in a single urban hub.
3. **Assumption 3: Sales rep capacity and fulfillment channels in the North can absorb higher order volume without bottlenecking.**
   * *Verifying Figure / Data Check:* Inspect the order status distribution (`q06`) to verify if the North region currently experiences a high ratio of pending or disputed orders, which would signal fulfillment or customer service strain rather than healthy scalable demand.