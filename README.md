\# Big Billion Days Regional Performance Review — SQL, Spreadsheet, Dashboard and AI-Verified Analysis



\## Project Overview

This repository contains a fully traceable end-to-end data analytics pipeline examining Flipkart's Big Billion Days (BBD) sale performance. The project spans raw SQL data generation and querying, spreadsheet data cleaning and reconciliation, dashboard specifications, and rigorous AI-assisted analysis verified via human-in-the-loop protocols.



\---



\## Environment \& Tools

\* \*\*SQL Compiler \& Dialect:\*\* MySQL

\* \*\*Spreadsheet Tool:\*\* Google Sheets

\* \*\*Dashboard Platform:\*\* Tableau Public



\---



\## Key Findings

During the Big Billion Days sale, sales performance exhibited distinct regional and categorical concentrations. First, the North region emerged as the top-performing territory overall, generating 119,300 in total revenue led primarily by robust electronics demand. Second, category performance was heavily skewed toward Electronics and Apparel, with individual items like Smart Watches and Air Fryers driving the majority of high-value completed orders. Finally, monthly trend analysis revealed critical operational fluctuations—specifically, the North region experienced a 22.8% month-over-month revenue decline between September and October 2026, contradicting preliminary assumptions of steady compounding growth and highlighting the necessity of targeted promotional interventions.



\---



\## File Index \& Mapping

\* \*\*`README.md`\*\* $\\rightarrow$ Project Overview \& Metadata (General)

\* \*\*`sql/00\_schema\_and\_seed.sql`\*\* $\\rightarrow$ Part A: Database Schema \& Seed Data

\* \*\*`sql/q01.sql` to `sql/q13.sql`\*\* $\\rightarrow$ Part A: Analytical SQL Query Files (Queries 1 through 13)

\* \*\*`sql/d1\_corrected.sql`\*\* $\\rightarrow$ Part D: Corrected Regional Sales Query

\* \*\*`results/query\_results.md`\*\* $\\rightarrow$ Part A: Query Row Counts and Result Tables

\* \*\*`data/orders\_enriched.csv`\*\* $\\rightarrow$ Part A / Part B: Raw Enriched Order-Level Fact Table Export

\* \*\*`data/orders\_clean.csv`\*\* $\\rightarrow$ Part B: Cleaned and Filtered Completed Orders Export

\* \*\*`docs/spreadsheet\_notes.md`\*\* $\\rightarrow$ Part B: Spreadsheet Formulas, Notes, Pivots, and Reconciliation

\* \*\*`docs/dashboard\_spec.md`\*\* $\\rightarrow$ Part C: Tableau Public Dashboard Layout and Business Narrative

\* \*\*`docs/ai\_log.md`\*\* $\\rightarrow$ Part D: AI Prompt Logs, Defect Inspections, Protocol Steps, and Skeptical Analyst Checks



\---



\## Assumptions Made

\* \*\*Text Formatting \& Cleaning:\*\* Assumed that customer names with leading/trailing whitespace (`customers` table) required systematic cleaning via nested `PROPER(TRIM(...))` formulas to ensure consistent categorization.

\* \*\*Missing Order Values:\*\* Assumed that orders with `NULL` amount fields (identified in query `q02`) should be excluded from active revenue calculations unless explicitly evaluated under pending/disputed status rules.

\* \*\*Date Handling:\*\* Assumed `order\_month` values (e.g., `2026-09`) must be strictly preserved as text data types across both CSV exports and spreadsheet tabs to prevent unintended automated date conversions.

