/*
Project:
AI Workforce Transformation Analysis

Business Objective:
Determine whether AI adoption and automation are associated
with business performance, productivity, workforce outcomes,
and organizational growth.

Author:
Cameron Smith
*/


-- Business Question 1
-- Does AI adoption correlate with revenue growth?

SELECT
    ai_adoption_tier,
    ROUND(AVG(revenue_growth)::numeric,2) AS avg_revenue_growth,
    COUNT(*) AS companies
FROM ai_workforce_data
GROUP BY ai_adoption_tier
ORDER BY avg_revenue_growth DESC;

-- Finding:
-- Revenue growth increases consistently with AI adoption maturity.
/* 
ai_adoption_tier|avg_revenue_growth|companies|
----------------+------------------+---------+
Leading         |             11.04|    24940|
Established     |              8.87|   154707|
Emerging        |              5.80|   315697|
Minimal         |              2.93|   504656|
*/
----------------------------------------------------------------------------------

-- Business Question 2
-- Does AI adoption increase employee productivity? 

select
	ai_adoption_tier,
	round(avg(productivity_index)::numeric,2) as avg_productivity,
	count(*) as companies
from ai_workforce_data awd 
group by ai_adoption_tier 
order by avg_productivity desc;

-- Finding: 
-- Companies leading in AI adoption show a 20% increase in average employee productivity. 
/* 
ai_adoption_tier|avg_productivity|companies|
----------------+----------------+---------+
Leading         |           83.54|    24940|
Established     |           78.19|   154707|
Emerging        |           70.62|   315697|
Minimal         |           63.76|   504656|
*/
----------------------------------------------------------------------------------

-- Business Question 3
-- Does automation reduce employee satisfaction?

select
	automation_tier, 
	round(avg(employee_satisfaction)::numeric,2) as avg_satisfaction, 
	count(*) as companies
from ai_workforce_data awd 
group by automation_tier 
order by avg_satisfaction desc;

-- Finding: 
-- Employees at companies with high automation report 9% higher average satisfaction than companies with very low automation. 
/*
automation_tier|avg_satisfaction|companies|
---------------+----------------+---------+
High           |           71.77|    35031|
Medium         |           69.79|   148030|
Low            |           65.92|   316853|
Very Low       |           62.68|   500086| 
*/
----------------------------------------------------------------------------------

-- Business Question 4
-- Does automation actually reduce layoffs?

select
	automation_tier,
	round(avg(layoffs)::numeric,2) as avg_layoffs, 
	count(*) as companies
from ai_workforce_data awd 
group by automation_tier
order by avg_layoffs desc;

-- Finding: 
-- The data shows that companies with lower automation report more average layoffs. 
-- Limitation: This dataset contains only technology industries and not things like oil, farming, etc. Where automation may be more difficult to implement. 
/*
automation_tier|avg_layoffs|companies|
---------------+-----------+---------+
Very Low       |    2142.61|   500086|
Low            |    1893.02|   316853|
Medium         |    1658.11|   148030|
High           |    1531.13|    35031|
*/
----------------------------------------------------------------------------------
-- Business Question 5
-- Which industries benefit most from AI adoption?

select
	industry,
	round(
		avg(
			case
				when ai_adoption_tier = 'Leading'
				then productivity_index
			end
		)::numeric,2
	) as leading_productivity,
	round(
		avg(
			case
				when ai_adoption_tier = 'Minimal'
				then productivity_index
			end
		)::numeric,2
	) as minimal_productivity,
	round(
		avg(
			case
				when ai_adoption_tier = 'Leading'
				then productivity_index
			end
		)::numeric
		-
		avg(
			case
				when ai_adoption_tier = 'Minimal'
				then productivity_index
			end
		)::numeric
	,2) as productivity_gain
from ai_workforce_data awd
group by industry
order by productivity_gain desc;

-- Finding: AI adoption appears to improve productivity across all industries at a remarkably consistent rate.
--
/*
industry       |leading_productivity|minimal_productivity|productivity_gain|
---------------+--------------------+--------------------+-----------------+
FinTech        |               83.50|               63.83|            19.67|
Cybersecurity  |               83.22|               63.89|            19.33|
Gaming         |               80.74|               61.41|            19.33|
Software       |               83.21|               63.89|            19.32|
E-Commerce     |               83.24|               63.93|            19.31|
Data Analytics |               83.02|               63.83|            19.19|
Cloud Computing|               82.79|               63.89|            18.89|
AI             |               83.63|               64.96|            18.67|
*/
----------------------------------------------------------------------------------
-- Business Question 6
-- What percentage of Leading AI adopters still report below-average revenue growth?

select
	count(*) as underperforming_companies,
    (
        select count(*) as companies from ai_workforce_data awd where ai_adoption_tier = 'Leading'
    ) as leading_companies
    
from ai_workforce_data awd
where ai_adoption_tier = 'Leading'
and revenue_growth < (select avg(revenue_growth)as avg_revenue from ai_workforce_data);

-- Finding: 
-- Approximately 30% of companies classified as Leading AI adopters
-- still report below-average revenue growth.
-- While AI adoption is associated with stronger business performance,
-- the results suggest that AI adoption alone does not guarantee growth.
/*
companies|total_companies|
---------+---------------+
     7370|          24940|
*/
----------------------------------------------------------------------------------
-- Business Question 7
-- Which industries rank highest in AI adoption within each year?

with ai_adopters as (
	select 
		industry,
		year,
		round(avg(ai_adoption_score)::numeric,2) as avg_adoption_score
	from ai_workforce_data awd 
	group by year, industry
	

),

ranked_ai_adopters as(
select year, industry, avg_adoption_score, (row_number() over (
									partition by year
									order by avg_adoption_score desc)) as industry_rank
from ai_adopters 
)
select *
from ranked_ai_adopters 
where industry_rank < 4
order by year, industry_rank;

-- Finding:
-- AI consistently ranks as the top industry for AI adoption across every year in the dataset.
-- Other industries rotate through the second and third positions, including Cloud Computing,
-- Data Analytics, Gaming, FinTech, Software, and E-Commerce.
-- AI adoption scores rise sharply after 2022, suggesting a major acceleration in adoption during the AI Boom period.

-- ** Note, results too large, see dashboard for visualization ** 


/*
Summary:

1. Higher AI adoption is associated with higher revenue growth.
2. Higher AI adoption is associated with higher productivity.
3. Automation is associated with higher employee satisfaction.
4. Automation is associated with fewer layoffs.
5. Productivity gains appear consistent across industries.
6. Approximately 30% of Leading AI adopters still underperform.
7. AI adoption accelerated significantly after 2022.
*/