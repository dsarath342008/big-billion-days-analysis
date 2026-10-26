# Spreadsheet Workflow & Analysis Documentation (`docs/spreadsheet_notes.md`)

## (a) Formulas Typed in the First Data Row of Added Columns
* **`clean_first_name` (Column C)**: `=PROPER(TRIM(C2:C64))`
* **`clean_last_name` (Column D)**: `=PROPER(TRIM(D2:D64))`
* **`category` (Column H)**: `=VLOOKUP(G2, products!$A$2:$C$10, 2, FALSE)`
* **`unit_price` (Column I)**: `=XLOOKUP(B2, products!$A$2:$A$10, products!$C$2:$C$10, "UNKNOWN_ITEM")`
* **Filtered Count Cell (`P5`)**: `=SUBTOTAL(3, K6:K91)`

---

## (b) Five Aggregate Results from Task 5 (Amount Column)
* **COUNT**: `63`
* **SUM**: `346,200`
* **AVERAGE**: `5,495.23`
* **MIN**: `1,100`
* **MAX**: `15,600`

---

## (c) Pivot Tables with Grand Totals

### Pivot Table 1: Category vs. Region (Sum of Amount)
| category | East | North | South      | West      | Grand Total |
| :--- | :--- | :--- |:-----------|:----------|:------------|
| **Apparel** | 10,600 | 19,400 | 10,200     | 37500     | **77,500**  |
| **Electronics** | 21,400 | 73,400 | 28,800     | 18800     | **142,300** |
| **Home** | 37,500 | 26,500 | 43,800     | 18600     | **126,400** |
| **Grand Total** | **69,500** | **119,300** |  **82,500**| **74900** | **346,200** |

### Pivot Table 2: Order Month (Sum of Amount & Count of Orders)
| order_month | SUM of amount | COUNT of order_id |
|:------------|:--------------|:------------------|
| **2026-09** | 98,300        | 19                |
| **2026-10** | 93,100        | 20                |
| **2026-11** | 154,800       | 24                |
|**Grand Total**| **346,200**   | **63**            |  
---

## (d) Reconciliation Table
| Metric | Spreadsheet Figure | Part A (q05) Figure | Match / Mismatch |
| :--- |:-------------------|:--------------------| :--- |
| **COUNT** | 63                 | 63                  | **Match** |
| **SUM** | 346,200            | 346,200             | **Match** |
| **AVERAGE** | 5,495.23           | 5,495.23            | **Match** |

---

## (e) Data Validation Section
* **Handling Missing Amounts**: No missing amounts were encountered in the completed orders subset. If any had occurred, they would be isolated or filtered out using explicit logical checks (`ISBLANK`) to prevent skewing sums and averages.
* **Data Type Consistency**: Confirmed that numeric columns (`amount`, `unit_price`, `quantity`) are explicitly stored as numbers to ensure aggregation functions process them correctly without text-coercion errors.
* **Duplicate `order_id` & Outliers**: 
  * No duplicate `order_id` values exist among the completed orders.
  * **Largest Amount**: `15,600`
  * **Order IDs with the Largest Amount**: `1061`, `1065`, `1069`, and `1077` (4-way tie).
* **Colleague Handoff Decision**: *Always verify that dynamic lookup ranges (such as `products!$A$2:$C$10`) are fully anchored with absolute references (`$`) before dragging formulas down a dataset to prevent reference drift.*
* **XLOOKUP Fallback Test**: Tested the `XLOOKUP` fallback outside the primary range using `=XLOOKUP("Mystery Item", products!$A$2:$A$10, products!$C$2:$C$10, "UNKNOWN_ITEM")`, confirming that it correctly outputs **`UNKNOWN_ITEM`** when an item is missing.

---

## (f) Setup Section
* **Tabs Created**: `orders` and `products`
* **Rows Imported into Orders**: 91 total source rows (yielding 63 filtered completed rows).
* **Products Tab Range**: `products!$A$2:$C$10` (fully anchored).
* **Filter & Sort Applied**: Filtered by `status = completed` and sorted visible rows by `amount` from **largest to smallest**.