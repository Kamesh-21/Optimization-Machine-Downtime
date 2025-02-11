SELECT * FROM machine;

-- NUMBERS OF ROWS IN OUR DATASET
SELECT COUNT(*) AS NUM_ROW
FROM machine;

-- NUMBEER OF COLUMNS IN OUR DATASET
SELECT COUNT(*) AS NUM_COL
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'machine';

-- Count the number of machine
select Machine_ID ,count(Machine_ID) as No_of_Machine
from machine
group by Machine_ID;

-- Count the number of Assembly line number
select Assembly_Line_No ,count(Assembly_Line_No) as No_of_Assembly_Line
from machine
group by Assembly_Line_No;

-- Count of number of Machine downtime
select Downtime , count(Downtime) as Number_of_Downtime
from machine
group by Downtime;

-- Cheaking for Null values
SELECT * FROM machine
WHERE Month_Name IS NULL or
		Machine_ID IS NULL or 
		Assembly_Line_No IS NULL or 
		Hydraulic_Pressure_bar IS NULL or 
		Coolant_Pressure_bar IS NULL or 
		Air_System_Pressure_bar IS NULL or 
		Coolant_Temperature IS NULL or 
		Hydraulic_Oil_Temperature_C IS NULL or 
		Spindle_Bearing_Temperature_C IS NULL or 
		Spindle_Vibration_µm IS NULL or 
		Tool_Vibration_µm IS NULL or 
		Spindle_Speed_RPM IS NULL or 
		Voltage_volts IS NULL or 
		Torque_Nm IS NULL or 
		Cutting_kN IS NULL or 
		Downtime IS NULL  ;

/* EDA OPERATION */

/* 1st Business Moment: Measure Of Central Tendency  */

/* Mean */

## Get Mean Value of All Numerical Columns
SELECT * FROM Mean_value;

# QUERY
CREATE VIEW Mean_value
as
SELECT 
AVG(Hydraulic_Pressure_bar) AS Hydraaulic_pressure,
AVG(Coolant_Pressure_bar) AS Coolant_Pressure,
AVG(Air_System_Pressure_bar) AS Air_System_Pressure,
AVG(Coolant_Temperature) AS Coolant_Temperature,
AVG(Hydraulic_Oil_Temperature_C) AS Hydraulic_Oil_Temperature,
AVG(Spindle_Bearing_Temperature_C) AS Spindle_Bearing_Temperature,
AVG(Spindle_Vibration_µm) AS Spindle_Vibration,
AVG(Tool_Vibration_µm) AS Tool_Vibration,
AVG(Spindle_Speed_RPM) AS Spindle_Speed,
AVG(Voltage_volts) AS Voltage,
AVG(Torque_Nm) AS Torque,
AVG(Cutting_kN) AS Cutting
FROM machine;

/* Median */

# Median of Hydraulic_Pressure(bar)
SELECT * FROM  Median_Hydraulic_Pressure;

# Median of Coolant_Pressure(bar)
SELECT * FROM Median_Coolant_Pressure;

# Median of Air_System_Pressure(bar)
SELECT * FROM Median_Air_System_Pressur;

# Median of Coolant_Temperature(°C)
SELECT * FROM Median_Coolant_Temperature;

# Median of Hydraulic_Oil_Temperature(°C)
SELECT * FROM Median_Hydraulic_Oil_Temperature;

# Median of Spindle_Bearing_Temperature(°C)
SELECT * FROM Median_Spindle_Bearing_Temperature;

# Median of Spindle_Vibration(µm)
SELECT * FROM Median_Spindle_Vibration;

# Median of Tool_Vibration_(µm)
SELECT * FROM Median_Tool_Vibration;

# Median of Spindle_Speed_RPM
SELECT * FROM Median_Spindle_Speed_RPM;

# Median of Voltage_volts
SELECT * FROM Median_Voltage_volts;

# Median of Torque_Nm
SELECT * FROM Median_Torque_Nm;

# Median of Cutting_kN
SELECT * FROM Median_Cutting_kN;



# QUERY

# Hydraulic_Pressure
CREATE VIEW Median_Hydraulic_Pressure AS 
SELECT Hydraulic_Pressure_bar AS Median_Hydraulic_Pressure 
FROM
(SELECT Hydraulic_Pressure_bar ,ROW_NUMBER() OVER(ORDER BY Hydraulic_Pressure_bar) AS ROW_NUM,
COUNT(*) OVER() AS Total_row
FROM machine) AS Subquery
WHERE ROW_NUM = (Total_row + 1)/2 OR ROW_NUM = (Total_row + 2)/2 ;

# Coolant_Pressure_bar
CREATE VIEW Median_Coolant_Pressure AS 
SELECT Coolant_Pressure_bar AS Median_Coolant_Pressure FROM
(SELECT Coolant_Pressure_bar , ROW_NUMBER() OVER(ORDER BY Coolant_Pressure_bar) AS ROW_NUM,
COUNT(*) OVER() AS Total_count
FROM machine ) AS Subquery 
WHERE ROW_NUM = (Total_count + 1)/2 or ROW_NUM = (Total_count + 2)/2 ;

# Air_System_Pressure_bar
CREATE VIEW Median_Air_System_Pressur AS 
SELECT Air_System_Pressure_bar AS Median_Air_system_pressure FROM
(SELECT Air_System_Pressure_bar , ROW_NUMBER() OVER(ORDER BY Air_System_Pressure_bar) AS ROW_NUM,
COUNT(*) OVER() AS Total_count
FROM machine ) AS Subquery 
WHERE ROW_NUM = (Total_count + 1)/2 or ROW_NUM = (Total_count + 2)/2 ;

# Coolant_Temperature
CREATE VIEW Median_Coolant_Temperature AS 
SELECT Coolant_Temperature AS Median_Coolant_Temperature FROM
(SELECT Coolant_Temperature , ROW_NUMBER() OVER(ORDER BY Coolant_Temperature) AS ROW_NUM,
COUNT(*) OVER() AS Total_count
FROM machine ) AS Subquery 
WHERE ROW_NUM = (Total_count + 1)/2 or ROW_NUM = (Total_count + 2)/2 ;

# Hydraulic_Oil_Temperature
CREATE VIEW Median_Hydraulic_Oil_Temperature AS 
SELECT Hydraulic_Oil_Temperature_C AS Median_Hydraulic_Oil_Temperature FROM
(SELECT Hydraulic_Oil_Temperature_C , ROW_NUMBER() OVER(ORDER BY Hydraulic_Oil_Temperature_C) AS ROW_NUM,
COUNT(*) OVER() AS Total_count
FROM machine ) AS Subquery 
WHERE ROW_NUM = (Total_count + 1)/2 or ROW_NUM = (Total_count + 2)/2 ;

# Spindle_Bearing_Temperature
CREATE VIEW Median_Spindle_Bearing_Temperature AS 
SELECT Spindle_Bearing_Temperature_C AS Median_Spindle_Bearing_Temperature FROM
(SELECT Spindle_Bearing_Temperature_C , ROW_NUMBER() OVER(ORDER BY Spindle_Bearing_Temperature_C) AS ROW_NUM,
COUNT(*) OVER() AS Total_count
FROM machine ) AS Subquery 
WHERE ROW_NUM = (Total_count + 1)/2 or ROW_NUM = (Total_count + 2)/2 ;

# Spindle_Vibration_µm
CREATE VIEW Median_Spindle_Vibration AS 
SELECT Spindle_Vibration_µm AS Median_Spindle_Vibration FROM
(SELECT Spindle_Vibration_µm , ROW_NUMBER() OVER(ORDER BY Spindle_Vibration_µm) AS ROW_NUM,
COUNT(*) OVER() AS Total_count
FROM machine ) AS Subquery 
WHERE ROW_NUM = (Total_count + 1)/2 or ROW_NUM = (Total_count + 2)/2 ;

# Tool_Vibration_µm
CREATE VIEW Median_Tool_Vibration AS 
SELECT Tool_Vibration_µm AS Median_Tool_Vibration_µm FROM
(SELECT Tool_Vibration_µm , ROW_NUMBER() OVER(ORDER BY Tool_Vibration_µm) AS ROW_NUM,
COUNT(*) OVER() AS Total_count
FROM machine ) AS Subquery 
WHERE ROW_NUM = (Total_count + 1)/2 or ROW_NUM = (Total_count + 2)/2 ;

# Spindle_Speed_RPM
CREATE VIEW Median_Spindle_Speed_RPM AS 
SELECT Spindle_Speed_RPM AS Median_Spindle_Speed_RPM FROM
(SELECT Spindle_Speed_RPM , ROW_NUMBER() OVER(ORDER BY Spindle_Speed_RPM) AS ROW_NUM,
COUNT(*) OVER() AS Total_count
FROM machine ) AS Subquery 
WHERE ROW_NUM = (Total_count + 1)/2 or ROW_NUM = (Total_count + 2)/2 ;

# Voltage_volts
CREATE VIEW Median_Voltage_volts AS 
SELECT Voltage_volts AS Median_Voltage_volts FROM
(SELECT Voltage_volts , ROW_NUMBER() OVER(ORDER BY Voltage_volts) AS ROW_NUM,
COUNT(*) OVER() AS Total_count
FROM machine ) AS Subquery 
WHERE ROW_NUM = (Total_count + 1)/2 or ROW_NUM = (Total_count + 2)/2 ;

# Torque_Nm
CREATE VIEW Median_Torque_Nm AS 
SELECT Torque_Nm AS Median_Torque_Nm FROM
(SELECT Torque_Nm , ROW_NUMBER() OVER(ORDER BY Torque_Nm ) AS ROW_NUM,
COUNT(*) OVER() AS Total_count
FROM machine ) AS Subquery 
WHERE ROW_NUM = (Total_count + 1)/2 or ROW_NUM = (Total_count + 2)/2 ;

# Cutting_kN
CREATE VIEW Median_Cutting_kN AS 
SELECT Cutting_kN AS Median_Cutting_kN FROM
(SELECT Cutting_kN , ROW_NUMBER() OVER(ORDER BY Cutting_kN) AS ROW_NUM,
COUNT(*) OVER() AS Total_count
FROM machine ) AS Subquery 
WHERE ROW_NUM = (Total_count + 1)/2 or ROW_NUM = (Total_count + 2)/2 ;


/* Mode */

## Mode of Hydraulic_Pressure_bar
SELECT Hydraulic_Pressure_bar AS mode_Hydraulic_Pressure
FROM (
    SELECT  Hydraulic_Pressure_bar, COUNT(*) AS frequency
    FROM machine
    GROUP BY  Hydraulic_Pressure_bar
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

## Mode of Coolant_Pressure_bar
SELECT  Coolant_Pressure_bar AS mode_Coolant_Pressure_bar
FROM (
    SELECT  Coolant_Pressure_bar, COUNT(*) AS frequency
    FROM machine
    GROUP BY  Coolant_Pressure_bar
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

## Mode of Air_System_Pressure_bar
SELECT Air_System_Pressure_bar AS mode_Air_System_Pressure_bar
FROM (
    SELECT Air_System_Pressure_bar, COUNT(*) AS frequency
    FROM machine
    GROUP BY  Air_System_Pressure_bar
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

## Mode of Coolant_Temperature
SELECT Coolant_Temperature AS mode_Coolant_Temperature
FROM (
    SELECT  Coolant_Temperature, COUNT(*) AS frequency
    FROM machine
    GROUP BY Coolant_Temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

## Mode of Hydraulic_Oil_Temperature_C
SELECT Hydraulic_Oil_Temperature_C AS mode_Hydraulic_Oil_Temperature_C
FROM (
    SELECT  Hydraulic_Oil_Temperature_C, COUNT(*) AS frequency
    FROM machine
    GROUP BY  Hydraulic_Oil_Temperature_C
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

## Mode of Spindle_Bearing_Temperature_C
SELECT Spindle_Bearing_Temperature_C AS mode_Spindle_Bearing_Temperature_C
FROM (
    SELECT  Spindle_Bearing_Temperature_C, COUNT(*) AS frequency
    FROM machine
    GROUP BY  Spindle_Bearing_Temperature_C
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

## Mode of Spindle_Vibration_µm
SELECT Spindle_Vibration_µm AS mode_Spindle_Vibration_µm
FROM (
    SELECT  Spindle_Vibration_µm, COUNT(*) AS frequency
    FROM machine
    GROUP BY Spindle_Vibration_µm
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

## Mode of Tool_Vibration_µm
SELECT Tool_Vibration_µm AS mode_Tool_Vibration_µm
FROM (
    SELECT Tool_Vibration_µm, COUNT(*) AS frequency
    FROM machine
    GROUP BY Tool_Vibration_µm
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

## Mode of Spindle_Speed_RPM
SELECT Spindle_Speed_RPM AS mode_Spindle_Speed_RPM
FROM (
    SELECT Spindle_Speed_RPM, COUNT(*) AS frequency
    FROM machine
    GROUP BY  Spindle_Speed_RPM
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

## Mode of Voltage_volts
SELECT Voltage_volts AS mode_Voltage_volts
FROM (
    SELECT  Voltage_volts, COUNT(*) AS frequency
    FROM machine
    GROUP BY  Voltage_volts
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

## Mode of Torque_Nm
SELECT Torque_Nm AS mode_Torque_Nm
FROM (
    SELECT  Torque_Nm, COUNT(*) AS frequency
    FROM machine
    GROUP BY Torque_Nm
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

## Mode of Cutting_kN
SELECT Cutting_kN AS mode_Cutting_kN
FROM (
    SELECT Cutting_kN, COUNT(*) AS frequency
    FROM machine
    GROUP BY  Cutting_kN
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;


/* 2nd Business Moment: Measure Of Dispersion */

 ---  Variance
 # See Variance of all numerical columns
SELECT * FROM Variance_of_numericalColumns ;


CREATE VIEW Variance_of_numericalColumns AS
SELECT 
VARIANCE(Hydraulic_Pressure_bar) AS Hydraulic_Pressure,
VARIANCE(Coolant_Pressure_bar) AS Coolant_Pressure,
VARIANCE(Air_System_Pressure_bar) AS Air_System_Pressure ,
VARIANCE(Coolant_Temperature) AS Coolant_Temperature ,
VARIANCE(Hydraulic_Oil_Temperature_C) AS Hydraulic_Oil_Temperature,
VARIANCE(Spindle_Bearing_Temperature_C) AS Spindle_Bearing_Temperature ,
VARIANCE(Spindle_Vibration_µm) AS Spindle_Vibration ,
VARIANCE(Tool_Vibration_µm) AS Tool_Vibration ,
VARIANCE(Spindle_Speed_RPM) AS Spindle_Speed,
VARIANCE(Voltage_volts) AS Voltage,
VARIANCE(Torque_Nm) AS Torque,
VARIANCE(Cutting_kN) AS Cutting 
FROM machine;

--   Standard Deviation

# See STDDEV of all numerical columns
SELECT * FROM STDDEV_of_numericalColumns ;


CREATE VIEW STDDEV_of_numericalColumns AS
SELECT 
STDDEV(Hydraulic_Pressure_bar) AS Hydraulic_Pressure,
STDDEV(Coolant_Pressure_bar) AS Coolant_Pressure,
STDDEV(Air_System_Pressure_bar) AS Air_System_Pressure ,
STDDEV(Coolant_Temperature) AS Coolant_Temperature ,
STDDEV(Hydraulic_Oil_Temperature_C) AS Hydraulic_Oil_Temperature,
STDDEV(Spindle_Bearing_Temperature_C) AS Spindle_Bearing_Temperature ,
STDDEV(Spindle_Vibration_µm) AS Spindle_Vibration ,
STDDEV(Tool_Vibration_µm) AS Tool_Vibration ,
STDDEV(Spindle_Speed_RPM) AS Spindle_Speed,
STDDEV(Voltage_volts) AS Voltage,
STDDEV(Torque_Nm) AS Torque,
STDDEV(Cutting_kN) AS Cutting 
FROM machine;



--- RANGE

## Range of Hydraulic_Pressure_bar
SELECT MAX(Hydraulic_Pressure_bar) - MIN(Hydraulic_Pressure_bar) AS Hydraulic_Pressure_range
FROM machine;

## Range of Coolant_Pressure_bar
SELECT MAX(Coolant_Pressure_bar) - MIN(Coolant_Pressure_bar) AS Coolant_Pressure_range
FROM machine;

## Range of Air_System_Pressure_bar
SELECT MAX(Air_System_Pressure_bar) - MIN(Air_System_Pressure_bar) AS Air_System_Pressure_range
FROM machine;

## Range of Coolant_Temperature 
SELECT MAX(Coolant_Temperature) - MIN(Coolant_Temperature) AS Coolant_Temperature_range
FROM machine;

## Range of Hydraulic_Oil_Temperature_C 
SELECT MAX(Hydraulic_Oil_Temperature_C) - MIN(Hydraulic_Oil_Temperature_C) AS Hydraulic_Oil_Temperature_range
FROM machine;

## Range of Spindle_Bearing_Temperature_C  
SELECT MAX(Spindle_Bearing_Temperature_C) - MIN(Spindle_Bearing_Temperature_C) AS Spindle_Bearing_Temperature_range
FROM machine;

## Range of Spindle_Vibration_µm 
SELECT MAX(Spindle_Vibration_µm) - MIN(Spindle_Vibration_µm) AS Spindle_Vibration_range
FROM machine;

## Range of Tool_Vibration_µm 
SELECT MAX(Tool_Vibration_µm) - MIN(Tool_Vibration_µm) AS Tool_Vibration_range
FROM machine;

## Range of Spindle_Speed_RPM  
SELECT MAX(Spindle_Speed_RPM) - MIN(Spindle_Speed_RPM) AS Spindle_Speed_range
FROM machine;

## Range of Voltage_volts 
SELECT MAX(Voltage_volts) - MIN(Voltage_volts) AS Voltage_range
FROM machine;

## Range of Torque_Nm
SELECT MAX(Torque_Nm) - MIN(Torque_Nm) AS Torque_Nm_range
FROM machine;

## Range of Cutting_kN 
SELECT MAX(Cutting_kN) - MIN(Cutting_kN) AS Cutting_range
FROM machine;


/* Third and Fourth Moment Business Decision */
--- skewness and kurkosis 


# Hydraulic_Pressure
SELECT
    (
        SUM(POWER(Hydraulic_Pressure_bar - (SELECT AVG(Hydraulic_Pressure_bar) FROM machine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Hydraulic_Pressure_bar) FROM machine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Hydraulic_Pressure_bar - (SELECT AVG(Hydraulic_Pressure_bar) FROM machine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Hydraulic_Pressure_bar) FROM machine), 4))) - 3
    ) AS kurtosis
FROM machine;

# Coolant_Pressure_bar
SELECT
    (
        SUM(POWER(Coolant_Pressure_bar - (SELECT AVG(Coolant_Pressure_bar) FROM machine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Coolant_Pressure_bar) FROM machine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Coolant_Pressure_bar - (SELECT AVG(Coolant_Pressure_bar) FROM machine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Coolant_Pressure_bar) FROM machine), 4))) - 3
    ) AS kurtosis
FROM machine;


# Air_System_Pressure_bar
SELECT
    (
        SUM(POWER(Air_System_Pressure_bar - (SELECT AVG(Air_System_Pressure_bar) FROM machine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Air_System_Pressure_bar) FROM machine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Air_System_Pressure_bar - (SELECT AVG(Air_System_Pressure_bar) FROM machine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Air_System_Pressure_bar) FROM machine), 4))) - 3
    ) AS kurtosis
FROM machine;

# Coolant_Temperature
SELECT
    (
        SUM(POWER(Coolant_Temperature - (SELECT AVG(Coolant_Temperature) FROM machine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Coolant_Temperature) FROM machine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Coolant_Temperature - (SELECT AVG(Coolant_Temperature) FROM machine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Coolant_Temperature) FROM machine), 4))) - 3
    ) AS kurtosis
FROM machine;

# Hydraulic_Oil_Temperature_C
SELECT
    (
        SUM(POWER(Hydraulic_Oil_Temperature_C - (SELECT AVG(Hydraulic_Oil_Temperature_C) FROM machine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Hydraulic_Oil_Temperature_C) FROM machine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Hydraulic_Oil_Temperature_C - (SELECT AVG(Hydraulic_Oil_Temperature_C) FROM machine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Hydraulic_Oil_Temperature_C) FROM machine), 4))) - 3
    ) AS kurtosis
FROM machine;

# Spindle_Bearing_Temperature_C
SELECT
    (
        SUM(POWER(Spindle_Bearing_Temperature_C - (SELECT AVG(Spindle_Bearing_Temperature_C) FROM machine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Bearing_Temperature_C) FROM machine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Spindle_Bearing_Temperature_C - (SELECT AVG(Spindle_Bearing_Temperature_C) FROM machine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Bearing_Temperature_C) FROM machine), 4))) - 3
    ) AS kurtosis
FROM machine;

# Spindle_Vibration_µm
SELECT
    (
        SUM(POWER(Spindle_Vibration_µm - (SELECT AVG(Spindle_Vibration_µm) FROM machine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Vibration_µm) FROM machine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Spindle_Vibration_µm - (SELECT AVG(Spindle_Vibration_µm) FROM machine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Vibration_µm) FROM machine), 4))) - 3
    ) AS kurtosis
FROM machine;

# Tool_Vibration_µm
SELECT
    (
        SUM(POWER(Tool_Vibration_µm - (SELECT AVG(Tool_Vibration_µm) FROM machine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Tool_Vibration_µm) FROM machine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Tool_Vibration_µm - (SELECT AVG(Tool_Vibration_µm) FROM machine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Tool_Vibration_µm) FROM machine), 4))) - 3
    ) AS kurtosis
FROM machine;

# Spindle_Speed_RPM
SELECT
    (
        SUM(POWER(Spindle_Speed_RPM - (SELECT AVG(Spindle_Speed_RPM) FROM machine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Speed_RPM) FROM machine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Spindle_Speed_RPM - (SELECT AVG(Spindle_Speed_RPM) FROM machine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Speed_RPM) FROM machine), 4))) - 3
    ) AS kurtosis
FROM machine;

# Voltage_volts
SELECT
    (
        SUM(POWER(Voltage_volts - (SELECT AVG(Voltage_volts) FROM machine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Voltage_volts) FROM machine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Voltage_volts - (SELECT AVG(Voltage_volts) FROM machine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Voltage_volts) FROM machine), 4))) - 3
    ) AS kurtosis
FROM machine;

# Cutting_kN
SELECT
    (
        SUM(POWER(Cutting_kN - (SELECT AVG(Cutting_kN) FROM machine), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Cutting_kN) FROM machine), 3))
    ) AS skewness,
    (
        (SUM(POWER(Cutting_kN - (SELECT AVG(Cutting_kN) FROM machine), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Cutting_kN) FROM machine), 4))) - 3
    ) AS kurtosis
FROM machine;

