# RIDE-CANCELLATIONS - MODEL ANALYSIS

<p align="center">
  <img src="ride.jpg" width="600"/>
  <br>
  <em>  RIDE CANCELLED
</p>

# 🚖 Ride Cancellation Prediction – San Francisco Auto Rental (SAR)

Predicting whether a booked ride will be cancelled before it happens.  
This end-to-end machine learning project leverages **Python-first modeling** on 10,000+ car rental bookings to help SAR reduce driver-related cancellations and optimize operational planning.

---

## 🧠 Problem Statement

San Francisco Auto Rental (SAR) reported ~20% of rides getting cancelled by drivers, affecting customer satisfaction and operations.

**Goal:**  
Build an accurate classification model to predict ride cancellations **with >90% accuracy** and support real-time intervention.

---

## 🧰 Tech Stack

### 💻 Primary Language: Python

- `pandas`, `numpy`
- `scikit-learn`
- `imblearn` (oversampling)
- `matplotlib`, `seaborn`
- `geopy` (Haversine distance)
- `datetime`, `warnings`

### 📊 R (only for early EDA/imputation)

- `dplyr`, `ggplot2`
- `mice`, `DMwR`, `lubridate`

---

## 🧪 Modeling Techniques (Python)

| Model                  | Accuracy | Sensitivity | Specificity |
|------------------------|----------|-------------|-------------|
| Logistic Regression (L1) | 92.5%  | 99.75%     | 5.97%       |
| Decision Tree          | 91.0%    | 97.25%      | 15.67%      |
| K-Nearest Neighbors    | 92.3%    | 98.6%       | 13.9%       |
| **Random Forest ✅**   | **93.3%**| **99.2%**    | **18.6%**   |

> ✅ **Best model**: `RandomForestClassifier` (Python), with class balancing using `imblearn.oversample.RandomOverSampler`

---

## 🔧 Feature Engineering

- **Haversine distance** between pickup/dropoff locations (`geopy`)
- **Time features**: hour of day, day of week, booking delay
- **Categorical features**: booking channel, vehicle ID
- **Behavioral patterns**: user frequency, weekend booking flag

---

## 🔍 Exploratory Insights (via Python & R)

- **Mobile app bookings** had the **lowest cancellation rate (~0.7%)**
- Cancellations **peak on Sundays at 9–10 PM**
- Specific vehicles and time windows contributed to higher risks

---

## 📂 Repository Contents

| File | Description |
|------|-------------|
| `README.md` | Project documentation |
| `SAR_Cancellation_Analysis.ipynb` | Final Python notebook – full ML pipeline |
| `SAR_PYTHON_ipynb_notebook` | Intermediate Colab notebook (Python) |
| `sar_code.R` | Optional EDA and imputation in R |
| `SAR_Cleaned_Median.csv` | Cleaned dataset used for modeling |
| `SAR_SHRUTHI (1).docx` | Full technical report with results |
| `SAR_SHRUTHI.pptx` | Business-facing presentation slides |
| `ride.jpg` | Sample project visual (EDA or chart) |

---

## 🚀 Future Roadmap

- [ ] Apply SMOTE/ADASYN for deeper class imbalance mitigation
- [ ] Deploy final model as REST API for real-time cancellation alerts
- [ ] Build Streamlit dashboard to visualize booking risk in real time
- [ ] Monitor drift in booking behavior across seasons

---

## 📈 Business Impact

- Estimated annual savings: **$150K–$250K** through proactive cancellation reduction
- Enables **smarter driver dispatch** and **targeted user incentives**
- Reinforces importance of **mobile booking flows** in reducing churn

---

## 🔑 Tags & Keywords

`Machine Learning`, `Python`, `Random Forest`, `Logistic Regression`, `Ride Cancellations`, `Geospatial Modeling`, `Operational Forecasting`, `scikit-learn`, `pandas`, `EDA`, `Haversine`, `Classification`, `Time Features`, `Imbalanced Data`, `Real-World ML`

---

## 🙋‍♀️ About the Author

**Shruthi Reddy Vudem**  
AI/ML Researcher | Data Scientist | Builder of real-world models that drive impact  
[LinkedIn](https://linkedin.com/in/shruthivudem) · [GitHub](https://github.com/shruthivudem)

---

