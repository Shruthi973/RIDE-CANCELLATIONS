# RIDE-CANCELLATIONS - MODEL ANALYSIS

<p align="center">
  <img src="ride.jpg" width="600"/>
  <br>
  <em>  RIDE CANCELLED
</p>

# 🚖 Ride Cancellation Prediction – San Francisco Auto Rental (SAR)

This project analyzes 10,000+ historical car rental bookings from SAR to develop machine learning models that predict ride cancellations. The solution aims to improve customer satisfaction and operational efficiency by identifying cancellation patterns and proactively managing high-risk bookings.

---

## 🧠 Project Overview

- **Client**: San Francisco Auto Rental (SAR)
- **Problem**: ~20% of scheduled rides were being cancelled by drivers
- **Goal**: Predict ride cancellations with 90%+ accuracy to improve service reliability and driver allocation

---

## 🔧 Tools & Libraries

- **Language**: R  , Python
- **Packages**: `dplyr`, `ggplot2`, `caret`, `mice`, `randomForest`, `rpart`, `DMwR`, `lubridate`
- **Techniques**: Imputation (KNN, MICE), Outlier Handling, Chi-Square Test, Feature Engineering, Logistic Regression (Lasso), Decision Tree, KNN, Random Forest

---

## 🔍 Key Highlights

- **Data Source**: SAR’s 2013 booking data (10,000 records, 19 attributes)
- **Data Cleaning**:
  - Missing geo-coordinates and distance filled using KNN and MICE
  - Feature engineering with distance (Haversine), time features, booking channels
  - Date-time transformations and POSIX conversions
- **EDA**:
  - Mobile bookings had the **lowest cancellation rate** (0.7%)
  - Highest cancellations at **9 PM–10 PM**, especially on **Sundays**
  - Top 10 vehicles & user behaviors explored

---

## 🤖 Model Performance

| Model              | Accuracy | Specificity | Sensitivity |
|-------------------|----------|-------------|-------------|
| Logistic Regression (LASSO) | 92.5%   | 5.97%       | 99.75%      |
| Decision Tree      | 91.0%   | 15.67%      | 97.25%      |
| K-Nearest Neighbors| 92.3%   | 13.9%       | 98.6%       |
| Random Forest (✅ Best) | **93.3%** | **18.6%**     | **99.2%**     |

✅ **Best Model**: Random Forest with class balancing via oversampling

---

## 📈 Business Impact

- Estimated **$150K–$250K annual savings** by reducing cancellation rates
- Insights support targeted driver incentives and smarter booking flows
- Recommends enhanced mobile app features due to lowest cancel rate

---

## 📂 Files Included

- `SAR_SHRUTHI.docx`: Full technical documentation of the workflow
- `SAR_SHRUTHI.pptx`: Final business-facing presentation with results
- `SAR_Rental.csv`: Raw dataset (synthetic sample)
- R Script (Coming Soon): Modeling + EDA + Feature Engineering pipeline

---

## 🚀 Future Work

- Address class imbalance using SMOTE
- Deploy model into real-time booking system (API-based)
- Develop alert system for high-risk booking interventions

---

## 🔑 Keywords

`R`, `Random Forest`, `Logistic Regression`, `KNN`, `Cancellations`, `Geospatial Modeling`, `Predictive Analytics`, `Booking Behavior`, `Time Series Features`, `Imputation`, `Operational Forecasting`

---

