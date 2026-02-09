# Product Funnel & Drop-Off Analysis Using User Event Data

## 📌 Project Overview
This project analyzes **user behavior across a product funnel** to identify **drop-off points, conversion performance, and engagement patterns**.  
It is designed from a **Product / Growth Analytics** perspective, similar to how teams at Google analyze user event data.

The goal is to help stakeholders understand:
- Where users drop off in the funnel
- Which segments convert better
- How engagement (session duration) impacts purchases

---

## 🎯 Business Problem
Product teams observed that many users do not complete the full journey from **app open to purchase**.  
This project answers key questions:
- Which funnel stage has the highest drop-off?
- How does conversion vary by device and country?
- Do longer sessions lead to higher purchase probability?

---

## 🗂️ Dataset Description
The dataset simulates **realistic event-level user data** similar to Google Analytics / Firebase.

**Key Characteristics:**
- ~53,000 rows
- Event-level data
- Contains missing values, duplicates, and inconsistent records
- Multiple user actions per user

**Main Columns:**
- `user_id`
- `event_name` (app_open, signup, login, search, view_product, add_to_cart, checkout, purchase)
- `event_time`
- `event_date`
- `event_step`
- `device_type`
- `country`
- `session_duration`

---

## 🛠️ Tools & Technologies
- **Python** (Pandas, NumPy, Matplotlib)
- **SQL** (CTEs, conditional aggregation, funnel analysis)
- **Power BI** (DAX, KPI cards, funnel charts, slicers)
- **GitHub** (project versioning & documentation)

---

## 🧹 Data Cleaning & Preparation
Performed in Python:
- Removed duplicate event records
- Handled missing values for categorical fields
- Validated session duration values
- Engineered funnel step ordering
- Created clean dataset for SQL & Power BI analysis

---

## 📊 Key KPIs
- **Total Users**
- **Purchasers**
- **Overall Conversion Rate**
- **Average Session Duration (minutes)**

All KPIs were created using **DAX measures** to ensure correct aggregation across filters.

---

## 📈 Dashboard Highlights (Power BI)
The dashboard is designed for **Product & Growth teams** and includes:

### 🔹 Funnel Analysis
- User funnel from `app_open` → `purchase`
- User-level counts at each step
- Drop-off visualization

### 🔹 Segmentation Analysis
- Conversion by **Device Type**
- Conversion by **Country**
- Engagement comparison using session duration

### 🔹 Trend Analysis
- Monthly user activity trends

### 🔹 Interactive Slicers
- Device Type
- Country
- Date Range
- Day of Week

---

## 🔍 Key Insights
- Significant drop-off occurs between **signup and login**
- Web users show higher conversion compared to mobile
- Users with longer session durations are more likely to purchase
- Conversion performance varies across countries

---

## ✅ Recommendations
- Improve onboarding flow between signup and login
- Optimize mobile user experience
- Use engagement-based nudges for inactive users
- Apply segmentation-based personalization strategies

---

## 📁 Project Structure
Product-Funnel-Dropoff-Analysis/
│
├── data/
│ ├── raw_user_event_data.csv
│ └── cleaned_user_event_data.csv
│
├── notebooks/
│ └── data_cleaning_eda.ipynb
│
├── sql/
│ └── funnel_analysis.sql
│
├── dashboard/
│ └── product_funnel_analysis.pbix
│
└── README.md


---

## 🧠 Key Learnings
- Importance of user-level aggregation for funnel analysis
- Difference between measures vs calculated columns in Power BI
- How data visualization drives product decision-making
- Translating analytics into business recommendations

---

## 🚀 Future Enhancements
- Cohort-based retention analysis
- A/B test evaluation for onboarding improvements
- Predictive churn modeling

---

## 👤 Author
**Mohan Reddy**  
Aspiring Data Analyst | Product Analytics  
📍 Bangalore, India

---

## 📬 Contact
- Email: mohanreddym4912@gmail.com
