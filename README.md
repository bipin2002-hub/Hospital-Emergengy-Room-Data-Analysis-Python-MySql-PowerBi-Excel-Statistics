# 🏥 Hospital Emergency Room Data Analysis

![Python](https://img.shields.io/badge/Python-3.x-blue)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)
![Status](https://img.shields.io/badge/Status-Completed-green)

---

## 📌 Project Overview

This project presents a comprehensive data analysis of a 
**Hospital Emergency Room (ER)** dataset containing **9,216 patient records** 
spanning **April 2023 to October 2024**. The analysis uncovers patterns in 
patient flow, wait times, satisfaction levels, demographic distributions, 
and department referrals to support data-driven decision-making for 
hospital management.

---

## 📂 Dataset Summary

| Attribute | Details |
|---|---|
| Total Patient Records | 9,216 |
| Data Type | Hospital Emergency Room Records |
| Total Variables | 12 Columns |
| Time Period | April 2023 – October 2024 |

---

## 📋 Dataset Columns

| Column | Description |
|---|---|
| Patient ID | Unique identifier for each patient |
| Patient Admission Date | Date the patient was admitted |
| Patient First Initial | First initial of the patient |
| Patient Last Name | Patient's last name |
| Patient Gender | Gender of the patient |
| Patient Age | Age of the patient |
| Patient Race | Racial/ethnic background |
| Department Referral | Department referred to |
| Patient Admission Flag | Whether patient was admitted |
| Patient Satisfaction Score | Patient experience score |
| Patient Wait Time | Wait time in minutes |
| Patients CM | Case Manager assigned |

---

## 🛠️ Tools & Technologies

- **Python** — Data cleaning, analysis & visualization
- **Jupyter Notebook** — Development environment
- **Pandas & NumPy** — Data manipulation
- **Matplotlib & Seaborn** — Data visualization
- **Power BI** — Interactive dashboard
- **MySQL** — Data querying

---

## 🔍 Project Workflow
```
1. Data Loading & Exploration
2. Data Cleaning & Preparation
3. Feature Engineering
4. Exploratory Data Analysis (EDA)
5. KPI Analysis
6. Time Trend Analysis
7. Correlation Analysis
8. Power BI Dashboard
9. Insights & Recommendations
```

---

## 📊 Key Performance Indicators (KPIs)

| KPI | Value |
|---|---|
| Total Patients | 9,216 |
| Average Wait Time | 35.26 minutes |
| Average Satisfaction Score | 4.99 / 10 |
| Repeat Patient Rate | 0.0% |
| Admission Rate | 0.0% |

---

## 💡 Key Findings

- 🧑‍⚕️ **Middle-Aged & Senior** patients account for **55%+** of all ER visits
- ⏱️ Average wait time of **35.26 mins** is consistent across all age groups
- ⭐ Overall satisfaction score of **4.99/10** indicates moderate satisfaction
- 🏥 **58.6%** of patients required no specialist referral
- 📅 **August 2024** was the busiest month with **530 visits**
- 📆 **Saturday** is the busiest day with **1,377 visits**
- 🕐 Patient visits are evenly distributed **24/7** across all time slots
- 🔗 Most variables show **near-zero correlation** with each other

---

## 📈 Power BI Dashboard Features

- Monthly & Consolidated View
- Patient Admission Status
- Patient by Age Group & Gender
- Department Referral Analysis
- Patient Seen Within 30 Minutes
- No. of Patients by Day & Hour
- Patient Details Table

---

## 📁 Project Structure
```
Hospital-ER-Analysis/
│
├── 📓 Hospital_ER_Analysis.ipynb   # Jupyter Notebook
├── 📊 Hospital_ER_Dashboard.pbix   # Power BI Dashboard
├── 📄 Hospital_ER_Report.pdf       # Full Analysis Report
├── 📂 data/
│   └── hospital_er_data.csv        # Raw Dataset
└── 📄 README.md                    # Project Documentation
```

---

## 🚀 How to Run

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/Hospital-ER-Analysis.git
```

2. **Install required libraries**
```bash
pip install pandas numpy matplotlib seaborn scipy
```

3. **Open Jupyter Notebook**
```bash
jupyter notebook Hospital_ER_Analysis.ipynb
```

4. **Open Power BI Dashboard**
- Open `Hospital_ER_Dashboard.pbix` in Power BI Desktop

---

## 💡 Recommendations Summary

1. ✅ Improve Patient Satisfaction Scores
2. ✅ Reduce Patient Wait Times below 30 minutes
3. ✅ Strengthen Weekend & Night Shift Staffing
4. ✅ Focus on Middle-Aged & Senior Patient Care
5. ✅ Improve Pediatric & Teen ER Services
6. ✅ Enhance Department Referral Efficiency
7. ✅ Increase Case Manager Involvement
8. ✅ Investigate Repeat Patient Patterns
9. ✅ Leverage Seasonal & Monthly Trends
10. ✅ Improve Data Quality & Completeness

---

## 👨‍💻 Author

**Bipin Chandra Arya**
---

## 📃 License

This project is licensed under the **MIT License**.

---

> ⭐ If you found this project helpful, please consider giving it a star!
