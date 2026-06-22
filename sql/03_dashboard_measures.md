# Power BI Dashboard Measures

## AI Workforce Transformation Analysis

This document outlines the DAX measures used in the Power BI dashboard to support analysis of AI adoption, workforce outcomes, and economic trends.

---

## 1. Core Business Metrics

### Average AI Adoption Score

```DAX
Avg AI Adoption = AVERAGE(ai_workforce_data[ai_adoption_score])
```

### Average Revenue Growth

```DAX
Avg Revenue Growth = AVERAGE(ai_workforce_data[revenue_growth])
```

### Average Productivity Index

```DAX
Avg Productivity = AVERAGE(ai_workforce_data[productivity_index])
```

### Average Employee Satisfaction

```DAX
Avg Satisfaction = AVERAGE(ai_workforce_data[employee_satisfaction])
```

---

## 2. Workforce Metrics

### Average Layoffs

```DAX
Avg Layoffs = AVERAGE(ai_workforce_data[layoffs])
```

### Average Attrition Rate

```DAX
Avg Attrition = AVERAGE(ai_workforce_data[attrition_rate])
```

### Average Salary

```DAX
Avg Salary = AVERAGE(ai_workforce_data[avg_salary])
```

---

## 3. Automation Metrics

### Average Automation Level

```DAX
Avg Automation = AVERAGE(ai_workforce_data[automation_level])
```

---

## 4. Grouped Analysis Measures

### Productivity by AI Adoption Tier

```DAX
Productivity by Tier =
AVERAGEX(
    VALUES(ai_workforce_data[ai_adoption_tier]),
    CALCULATE(AVERAGE(ai_workforce_data[productivity_index]))
)
```

---

### Revenue Growth by AI Adoption Tier

```DAX
Revenue by Tier =
AVERAGEX(
    VALUES(ai_workforce_data[ai_adoption_tier]),
    CALCULATE(AVERAGE(ai_workforce_data[revenue_growth]))
)
```

---

### Workforce Stability Index

```DAX
Workforce Stability =
AVERAGE(ai_workforce_data[employee_satisfaction]) -
AVERAGE(ai_workforce_data[attrition_rate])
```

---

## 5. Time-Based Measures

### AI Adoption Over Time

```DAX
AI Adoption Trend = AVERAGE(ai_workforce_data[ai_adoption_score])
```

### Productivity Over Time

```DAX
Productivity Trend = AVERAGE(ai_workforce_data[productivity_index])
```

---

## 6. Insight Support Measures

### Leading vs Minimal Gap (Productivity)

```DAX
Productivity Gap =
CALCULATE(AVERAGE(ai_workforce_data[productivity_index]),
    ai_workforce_data[ai_adoption_tier] = "Leading"
)
-
CALCULATE(AVERAGE(ai_workforce_data[productivity_index]),
    ai_workforce_data[ai_adoption_tier] = "Minimal"
)
```

---

## Purpose of These Measures

These DAX measures support the Power BI dashboard by enabling:

* AI adoption trend analysis
* Workforce outcome comparisons
* Productivity and revenue benchmarking
* Tier-based segmentation analysis
* Executive-level KPI aggregation

---

## End of Document
