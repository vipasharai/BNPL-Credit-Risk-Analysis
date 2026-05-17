# Data Science & FinTech Intelligence Portfolio (R Programming) 🚀

Welcome to my professional data science repository. This space showcases production-ready R code, structured data pipeline engineering, exploratory data analysis (EDA), and machine learning implementations designed to solve real-world financial and statistical problems.

---

## 📂 Core Project 1: AI-Powered BNPL Credit Risk Analysis Platform

### 🔹 Executive Summary
In the rapidly expanding Buy Now Pay Later (BNPL) Fintech sector, default rates pose a massive operational risk to lenders. Traditional static credit metrics (like basic history) often fail to capture immediate digital risk. This project builds a **Dynamic Credit Risk Intelligence Platform** that blends traditional financial pillars (Income, Credit Scores) with digital behavioral metadata to classify borrowers in real-time.

### 🛠️ The Technical Pipeline
- [cite_start]**Data Engineering:** Managed and synthetically fused a robust dataset of 50,000 transaction records utilizing `dplyr` left-joins to generate a unified "Customer 360" view[cite: 70, 75, 584, 1104].
- [cite_start]**Feature Sanitization & Audit:** Implemented Pearson correlation heatmaps to programmatically detect and drop redundant variables, preventing multicollinearity and data leakage[cite: 805, 806, 831, 832].
- [cite_start]**Handling Class Imbalance:** Leveraged ROSE sampling (`ovun.sample`) to perfectly balance the skewed target variable (`Is_Bad`), ensuring the algorithm trains without majority-class bias[cite: 1180, 1192, 1194].
- [cite_start]**The Engine (Random Forest):** Selected an ensemble Random Forest Classifier (`ntree = 100`, `mtry = 3`) to map highly complex, non-linear consumer risk patterns without risking overfitting[cite: 1247, 1253, 1263, 1264, 1277, 1278].
- [cite_start]**Cloud Deployment:** Wrapped the backend predictive model into an interactive, enterprise-grade **R Shiny Web Application** deployed live on cloud servers for non-technical credit officers[cite: 1382, 1415].

### 📈 Model Evaluation Metrics (Testing Phase)
[cite_start]Evaluated on a strict, unseen 10,500 record hold-out validation set, the model achieved world-class performance[cite: 1289]:
- [cite_start]**Overall Accuracy:** 98.4% (Significantly outperforming the No Information Rate) [cite: 1307, 1310]
- [cite_start]**Sensitivity:** 96.96% (Flawless capability to approve credit-worthy clients) [cite: 1320]
- [cite_start]**Specificity:** 99.94% (Near-perfect risk shield; caught 5,065 defaults while missing only 3) [cite: 1301, 1302, 1303, 1322]
- [cite_start]**Cohen’s Kappa Score:** 0.968 (Proves the model's high reliability and rules out random chance) [cite: 1315]
- [cite_start]**Out-of-Bag (OOB) Error Rate:** 1.76% [cite: 1267]

---

## 📂 Core Project 2: Advanced Statistical Analysis & Data Preparation Suite

This section contains automated solutions for complex data transformation, missing value treatment, and diagnostic analytics tasks across various classic and custom datasets.

### 🧠 Implemented Solutions Summary

#### 1. Linear & Multiple Regression Frameworks
- **Macroeconomic Forecasting (`longley`):** Modeled employment rates dynamically by tracking Gross National Product (GNP) changes.
- **Academic Analytics:** Modeled student final grading variables using multi-variable matrices combining `StudyHours` and `Attendance` metrics.
- **Organizational Psychology (`attitude`):** Calculated multivariate feature interaction heatmaps to map corporate job ratings against employee complaints and privileges.

#### 2. Advanced Data Transformation & Wrangling Pipeline
- **Conditional Imputation Engine:** Designed reproducible pipelines to scan data frames, identify missing fields (`NA`), and substitute them cleanly with mathematical column averages (e.g., product review optimization).
- **Relational Data Filtering:** Built complex `dplyr` chain workflows to filter multidimensional indices (e.g., identifying premium consumer brackets using cross-variable thresholds like high credit limits paired with selective payment providers).
- **Volumetric Reshaping:** Reshaped narrow tabular rows into structural wide matrices using `pivot_wider()` to evaluate regional asset consumption variations across demographic fields.

#### 3. Diagnostic Visualizations (`ggplot2`)
- **Kernel Density Estimations (KDE):** Evaluated continuous probability spreads of financial assets to prove that traditional static thresholds fail to isolate default risks.
- **Notched Boxplots:** Utilized geometric median notches to visually confirm statistical significance across disparate risk tiers.
- **Multivariate Scatter Metrics:** Overlaid linear regression curves onto dense consumer clouds to explicitly map wealth-to-consumption correlations.

---

## 🛠️ Global Tech Stack & Tools
- **Language:** R (v4.x)
- **Core Ecosystem:** `tidyverse`, `dplyr`, `ggplot2`, `scales`
- **Machine Learning & Validation:** `randomForest`, `caret`, `ROSE`, `corrplot`, `reshape2`
- **Deployment Platform:** R Shiny Cloud Engine (`shinyapps.io`)

---
### 👤 Developer Profile
- [cite_start]**Name:** Vipasha Rai [cite: 9, 24]
- **Specialization:** Master of Computer Applications (MCA) – Data Science Specialty 
- [cite_start]**University:** School of Computer Applications, Lovely Professional University [cite: 13, 15, 16]
