# 🚴‍♂️ Last-Mile Delivery Analytics: Financial & SLA Audit

**Dashboard Link:** [View Interactive Dashboard on Tableau Public](#) *(Insert your link here)*

##  Executive Summary
In high-volume last-mile delivery networks, a minor discrepancy in dynamic pricing or a slight delay in dispatch can result in significant financial bleed. This project simulates an enterprise-level data pipeline to audit courier payouts, predict Service Level Agreement (SLA) breaches, and optimize routing infrastructure across Budapest. 

By bridging the gap between rigorous back-end data engineering and front-end product design, this project translates raw system logs into an actionable, executive-level BI tool.

## 🛠️ Tech Stack
* **Data Engineering & Database:** PostgreSQL, SQL (CTEs, Window Functions)
* **Predictive Analytics:** Python (Pandas, Scikit-Learn, NumPy)
* **Data Visualization & UI/UX:** Tableau (Calculated Fields, Dual-Axis Mapping, Custom Layout Containers)

##  Architecture & Methodology

### 1. Data Engineering & Auditing (PostgreSQL)
* **Objective:** Establish baseline expectations and isolate anomalous delivery behavior.
* **Execution:** Processed raw delivery logs into a relational database. Engineered complex SQL queries utilizing rolling window functions to calculate the cohort-average cost-per-kilometer and expected delivery times. 
* **Outcome:** Successfully flagged critical anomalies: deliveries exceeding SLA by 5+ minutes, and routes incurring a 10%+ financial bleed over the baseline.

### 2. Predictive Modeling (Python / Machine Learning)
* **Objective:** Predict critical SLA breaches before dispatch to enable proactive routing interventions.
* **Execution:** Built a Machine Learning pipeline utilizing a `RandomForestClassifier`. Strict data isolation protocols were enforced to prevent data leakage, ensuring only pre-dispatch features (weather, vehicle type, hour of day, pickup coordinates) influenced the model.
* **Outcome:** Deployed balanced class weights to successfully identify rare delay events within a highly imbalanced dataset.

### 3. Spatial Analytics & Dashboard UI (Tableau)
* **Objective:** Design an intuitive, neumorphic executive dashboard for real-time operational monitoring.
* **Execution:** Engineered custom front-end calculations to bypass rigid database schema limitations. Designed a custom Hub-and-Spoke (Spider) map utilizing spatial `MAKEPOINT` and `MAKELINE` functions to visualize cross-city routing between restaurants and customers.
* **Outcome:** Delivered a fully interactive, card-based UI featuring dynamic filters, dual-donut gauge charts for SLA/Bleed percentages, and a 24-hour cost curve analysis.

## 📊 Key Business Insights (Budapest Simulation)
1. **Weather-Induced Vulnerability:** Bicycle couriers experienced systemic SLA failures during snow conditions, whereas car dispatch maintained a stable delivery baseline.
2. **Dynamic Pricing Inefficiencies:** The highest cost-per-kilometer variance (Financial Bleed) occurred consistently during the 18:00 - 21:00 dinner rush. This indicates the platform's dynamic pricing multiplier over-compensated for short-distance routes during peak demand.
3. **Infrastructure Bottlenecks:** Spatial route mapping revealed that cross-Danube deliveries (connecting Buda and Pest) suffered a disproportionately high rate of critical SLA breaches compared to intra-district routing, highlighting a need for localized supply hubs.

## 📂 Repository Structure
* `/data` -  dataset and data dictionary.
* `/sql_queries` - PostgreSQL scripts for anomaly detection and rolling averages.
* `/notebooks` - Jupyter Notebooks containing the EDA, spatial enrichment, and Scikit-Learn pipeline.
* `/assets` - High-resolution screenshots of the Tableau dashboard and spatial maps.

---
**Author:** Gorisi Deepak Reddy  
*Data Analyst*
