# Data Science & FinTech Intelligence Portfolio (R Programming) 🚀

Welcome to my professional data science portfolio. This space showcases production-ready R code, structured data pipeline engineering, exploratory data analysis (EDA), and machine learning implementations designed to solve real-world financial and statistical problems.

---

## 📂 Core Project 1: AI-Powered BNPL Credit Risk Analysis Platform

### 🔹 Executive Summary
In the rapidly expanding Buy Now Pay Later (BNPL) Fintech sector, default rates pose a massive operational risk to lenders. Traditional static credit metrics (like basic history) often fail to capture immediate digital risk. This project builds a **Dynamic Credit Risk Intelligence Platform** that blends traditional financial pillars (Income, Credit Scores) with digital behavioral metadata to classify borrowers in real-time.

### 🛠️ The Technical Pipeline
- **Data Engineering:** Managed and synthetically fused a robust dataset of 50,000 transaction records utilizing `dplyr` left-joins to generate a unified "Customer 360" view.
- **Feature Sanitization & Audit:** Implemented Pearson correlation heatmaps to programmatically detect and drop redundant variables, preventing multicollinearity and data leakage.
- **Handling Class Imbalance:** Leveraged ROSE sampling (`ovun.sample`) to perfectly balance the skewed target variable (`Is_Bad`), ensuring the algorithm trains without majority-class bias.
- **The Engine (Random Forest):** Selected an ensemble Random Forest Classifier (`ntree = 100`, `mtry = 3`) to map highly complex, non-linear consumer risk patterns without risking overfitting.
- **Cloud Deployment:** Wrapped the backend predictive model into an interactive, enterprise-grade **R Shiny Web Application** deployed live on cloud servers for non-technical credit officers.

### 📈 Model Evaluation Metrics (Testing Phase)
Evaluated on a strict, unseen 10,500 record hold-out validation set, the model achieved world-class performance:
- **Overall Accuracy:** 98.4% (Significantly outperforming the No Information Rate)
- **Sensitivity:** 96.96% (Flawless capability to approve credit-worthy clients)
- **Specificity:** 99.94% (Near-perfect risk shield; caught 5,065 defaults while missing only 3)
- **Cohen’s Kappa Score:** 0.968 (Proves the model's high reliability and rules out random chance)
- **Out-of-Bag (OOB) Error Rate:** 1.76%

### 🔗 Project Live Assets
* **Interactive Web Application:** [Live R Shiny Dashboard](https://vipasharai.shinyapps.io/fintechapp/)
* **Comprehensive Technical Compilation:** [Full Project Report on RPubs](https://rpubs.com/Vipasharai16/1428751)

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
- **Name:** Vipasha Rai
- **Specialization:** Master of Computer Applications (MCA) – Data Science Specialty 
- **University:** School of Computer Applications, Lovely Professional University
