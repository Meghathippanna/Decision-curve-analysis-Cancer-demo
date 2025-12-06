# Decision Curve Analysis (DCA) in R — Example Project

This repository demonstrates **Decision Curve Analysis (DCA)** using a publicly available
clinical dataset (from the `dcurves` tutorial).  
The project shows how to:

- build logistic regression models  
- generate predicted probabilities  
- calculate net benefit across thresholds  
- compare: **Prediction Model vs. Treat-All vs. Treat-None**  
- visualize clinical usefulness using DCA curves  

This can serve as a template for anyone learning DCA or creating reproducible workflows
for clinical prediction models.

---

## About Decision Curve Analysis

Decision Curve Analysis is a method used to evaluate whether a prediction model
is *clinically useful*.  
Instead of reporting just AUC, sensitivity, specificity, etc., DCA answers:

> **“If we use this model in real life, will patients truly benefit?”**

It does this by combining:
- true positives (benefit)  
- false positives (harm)  
- threshold probability (risk–benefit tradeoff)

DCA plots **Net Benefit vs Threshold Probability**, comparing:

- **Prediction Model**  
- **Treat All patients**  
- **Treat None**  

---

## 📂 Dataset Used

We use the publicly available dataset provided by  
`dcurves` tutorial on GitHub:
# 🔍 Decision Curve Analysis (DCA) in R — Example Project

This repository demonstrates **Decision Curve Analysis (DCA)** using a publicly available
clinical dataset (from the `dcurves` tutorial).  
The project shows how to:

- build logistic regression models  
- generate predicted probabilities  
- calculate net benefit across thresholds  
- compare: **Prediction Model vs. Treat-All vs. Treat-None**  
- visualize clinical usefulness using DCA curves  

This can serve as a template for anyone learning DCA or creating reproducible workflows
for clinical prediction models.

---

## 📌 About Decision Curve Analysis

Decision Curve Analysis is a method used to evaluate whether a prediction model
is *clinically useful*.  
Instead of reporting just AUC, sensitivity, specificity, etc., DCA answers:

> **“If we use this model in real life, will patients truly benefit?”**

It does this by combining:
- true positives (benefit)  
- false positives (harm)  
- threshold probability (risk–benefit tradeoff)

DCA plots **Net Benefit vs Threshold Probability**, comparing:

- **Prediction Model**  
- **Treat All patients**  
- **Treat None**  

---

## 📂 Dataset Used

We use the publicly available dataset provided by  
`dcurves` tutorial on GitHub:


