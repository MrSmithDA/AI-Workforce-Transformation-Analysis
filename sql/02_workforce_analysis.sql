/*
Project:
AI Workforce Transformation Analysis

File:
02_workforce_analysis.sql

Focus:
Workforce outcomes — salary, satisfaction, attrition, layoffs, productivity

Goal:
Understand how AI adoption and automation impact employees and organizational health
*/
-- 1. Does AI adoption improve employee satisfaction?

SELECT
ai_adoption_tier,
ROUND(AVG(employee_satisfaction)::numeric, 2) AS avg_satisfaction,
COUNT(*) AS companies
FROM ai_workforce_data
GROUP BY ai_adoption_tier
ORDER BY avg_satisfaction DESC;

-- Finding:
-- Employee satisfaction increases slightly with higher AI adoption, but the relationship is weaker than productivity or revenue.
/*
ai_adoption_tier|avg_satisfaction|companies|
----------------+----------------+---------+
Leading         |           72.38|    24940|
Established     |           70.33|   154707|
Emerging        |           66.05|   315697|
Minimal         |           62.49|   504656|
*/
--------------------------------------------------------------------------------------
-- 2. Does automation reduce layoffs?

SELECT
automation_tier,
ROUND(AVG(layoffs)::numeric, 2) AS avg_layoffs,
COUNT(*) AS companies
FROM ai_workforce_data
GROUP BY automation_tier
ORDER BY avg_layoffs DESC;
-- Finding:
-- Lower automation firms show higher average layoffs, suggesting automation may stabilize workforce structure rather than destabilize it.
/*
automation_tier|avg_layoffs|companies|
---------------+-----------+---------+
Very Low       |    2142.61|   500086|
Low            |    1893.02|   316853|
Medium         |    1658.11|   148030|
High           |    1531.13|    35031|
*/
--------------------------------------------------------------------------------------
-- 3. How does AI adoption affect salary levels?
SELECT
ai_adoption_tier,
ROUND(AVG(avg_salary)::numeric, 2) AS avg_salary,
COUNT(*) AS companies
FROM ai_workforce_data
GROUP BY ai_adoption_tier
ORDER BY avg_salary DESC;
-- Finding:
-- Higher AI adoption is associated with higher average salaries, indicating a possible shift toward higher-skilled labor structures.
/*
ai_adoption_tier|avg_salary|companies|
----------------+----------+---------+
Leading         | 129816.18|    24940|
Established     |  99992.56|   154707|
Emerging        |  88911.10|   315697|
Minimal         |  66331.44|   504656|
*/
--------------------------------------------------------------------------------------
-- 4. What is the relationship between AI adoption and attrition?
SELECT
ai_adoption_tier,
ROUND(AVG(attrition_rate)::numeric, 2) AS avg_attrition,
COUNT(*) AS companies
FROM ai_workforce_data
GROUP BY ai_adoption_tier
ORDER BY avg_attrition DESC;
-- Finding:
-- Attrition rates show moderate variation across AI tiers, with no extreme divergence, suggesting AI adoption does not strongly destabilize workforce retention.
/*
ai_adoption_tier|avg_attrition|companies|
----------------+-------------+---------+
Minimal         |        16.31|   504656|
Emerging        |        15.79|   315697|
Established     |        15.24|   154707|
Leading         |        15.03|    24940|
*/
--------------------------------------------------------------------------------------
-- 5. Do higher AI firms show better balance between productivity and workforce stability?
SELECT
ai_adoption_tier,
ROUND(AVG(productivity_index)::numeric, 2) AS avg_productivity,
ROUND(AVG(employee_satisfaction)::numeric, 2) AS avg_satisfaction,
ROUND(AVG(attrition_rate)::numeric, 2) AS avg_attrition
FROM ai_workforce_data
GROUP BY ai_adoption_tier
ORDER BY avg_productivity DESC;
-- Finding:
-- Leading AI firms show higher productivity without proportionally higher attrition, indicating improved efficiency without major workforce instability.
/*
ai_adoption_tier|avg_productivity|avg_satisfaction|avg_attrition|
----------------+----------------+----------------+-------------+
Leading         |           83.54|           72.38|        15.03|
Established     |           78.19|           70.33|        15.24|
Emerging        |           70.62|           66.05|        15.79|
Minimal         |           63.76|           62.49|        16.31|
*/

# /*

# FINAL SUMMARY - WORKFORCE ANALYSIS

This analysis explored how AI adoption and automation levels influence workforce outcomes including productivity, salary levels, employee satisfaction, attrition, and layoffs.

Key Findings:

1. Employee satisfaction shows a mild positive relationship with AI adoption, but is not a dominant effect compared to productivity or revenue outcomes.

2. Higher automation levels are associated with lower average layoffs, suggesting automation may contribute to workforce stabilization rather than disruption.

3. AI adoption is consistently associated with higher average salary levels, indicating a shift toward higher-skilled labor structures in more advanced organizations.

4. Attrition rates do not show extreme variation across AI adoption tiers, suggesting workforce retention is not significantly disrupted by AI maturity alone.

5. Overall, leading AI adopters demonstrate a balanced improvement across productivity and workforce stability metrics, rather than trade-offs between efficiency and employee outcomes.

Final Insight:

AI adoption appears to improve organizational performance primarily through productivity and compensation improvements, while workforce disruption indicators (attrition and layoffs) remain relatively stable across adoption tiers.
*/
