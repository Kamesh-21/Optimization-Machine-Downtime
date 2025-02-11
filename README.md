# Optimization-Machine-Downtime

## Project Overview
360DigitMG, a leading vehicle fuel pump manufacturing company, is facing unplanned machine downtime, resulting in productivity loss. To address this issue, the company aims to minimize unplanned machine downtime and maintenance costs while maximizing equipment efficiency.
As a Data Analyst, I analyzed nearly two years of machine downtime data from 360DigitMG and conducted Exploratory Data Analysis (EDA), preprocessing, and data analysis using Python and MySQL. My goal was to extract statistical and actionable insights to help track key machine parameters and identify the root causes of machine failures.
By leveraging data analytics and implementing necessary actions based on insights, unplanned machine failures can be reduced by 10%, maintenance costs can be lowered, and at least $1 million in cost savings can be achieved. This approach will optimize machine efficiency, ensuring that the pump manufacturing process runs smoothly with minimal disruptions.

![image](https://evocon.com/wp-content/uploads/2024/09/How-to-create-Downtime-Report-2149x1250.jpg)

## Buainess understanding
Business Problem: Unplanned machine downtime that is leading to loss of productivity

Business Objective: Minimize unplanned machine downtime

Business Constraint:
Minimize maintenance cost , Maximize equipment efficiency

Success criteria:
Reduce the unplanned downtime by at least 10% and Achieve a cost savings of at least $1M.


## Data Preprocessing :
- Data Loading :
We load the dataset using Pandas and inspect its structure.
- Missing Value Treatment :
Identified missing values in several numerical columns.
Replaced missing values with the mean and median for continuous variables
After filling missing values, the dataset was checked again to ensure completeness. 
- Outliers:
Used boxplots  to detect outliers


## Insights
Statistical Insights :
- Identified Mean , median , Min & Max value, Range , variance, standard deviation , Skewness and Kurtosis for numerical columns.
- Spindle Speed, Voltage & Hydraulic Pressure shows highest STD
- Makino-L1-Unit1-2013 Has 454-No-Failure and 420-Failure Count  ,  Makino-L2-Unit1-2015 Has 396-No-Failure and 412-Failure Count  , Makino-L3-Unit1-2015 Has 415-No-Failure and 404-Failure Count


Business Insights :
- Low Coolant Pressure leads to machine overheating, increased spindle vibration, and eventual breakdown, causing unplanned downtime and production loss.
- High Vibration impacts machine performance, reduces tool life and increases downtime as well as repair & maintenance costs.
- High Coolant Temperature , Hydraulic Oil Temperature , and Spindle Bearing Temperature indicate overheating problems and lead to breakdown.
- machines may operate at suboptimal torque , spindle speed , or cutting force , leading to increased stress and potential failures.

## Recommendation 

- Set alerts for coolant pressure drop and Optimize coolant circulation to prevent overheating.
- Implement vibration monitoring to detect abnormal trends early & Use shock-absorbing mounts to reduce excessive vibration. Controlling vibration can enhance tool life, improve product quality, and minimize unplanned downtime .
- Ensure stable power supply using voltage stabilizers.
- Regularly check coolant systems and apply temperature threshold-based shutdowns before failure occurs.
- Set up alerts for hydraulic pressure deviations beyond safe limits. and schedule servicing before it breaks down.
- Maintain optimal torque levels, keep speed within the recommended range, and balance cutting parameters ,so that reduce wear and tear.
- by Predicting failures early and scheduling maintenance reduces Expensive Emergency Repair costs

## Result 
By leveraging data analytics and implementing necessary actions based on insights, unplanned machine failures can be reduced by 10%, maintenance costs can be lowered, and at least $1 million in cost savings can be achieved. This approach will optimize machine efficiency, ensuring that the pump manufacturing process runs smoothly with minimal disruptions.
