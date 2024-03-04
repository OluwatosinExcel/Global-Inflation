--View the dataset
SELECT 
	*
FROM 
	global_inflation

--Check for the number of rows
SELECT 
	COUNT(*) AS row_num
FROM 
	global_inflation

--Number of Columns
SELECT 
	COUNT(*) AS num_columns
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'global_inflation';

--Replace null values in the dataset with 0
UPDATE 
	global_inflation
SET 
	[1980] = COALESCE([1980], 0), [1981] = COALESCE([1981], 0), [1982] = COALESCE([1982], 0), [1983] = COALESCE([1983], 0),
	[1984] = COALESCE([1984], 0), [1985] = COALESCE([1985], 0), [1986] = COALESCE([1986], 0), [1987] = COALESCE([1987], 0),
	[1988] = COALESCE([1988], 0), [1989] = COALESCE([1989], 0), [1990] = COALESCE([1990], 0), [1991] = COALESCE([1991], 0),
	[1992] = COALESCE([1992], 0), [1993] = COALESCE([1993], 0), [1994] = COALESCE([1994], 0), [1995] = COALESCE([1995], 0),
	[1996] = COALESCE([1996], 0), [1997] = COALESCE([1997], 0), [1998] = COALESCE([1998], 0), [1999] = COALESCE([1999], 0),
	[2000] = COALESCE([2000], 0), [2001] = COALESCE([2001], 0), [2002] = COALESCE([2002], 0), [2003] = COALESCE([2003], 0),
	[2004] = COALESCE([2004], 0), [2005] = COALESCE([2005], 0), [2006] = COALESCE([2006], 0), [2007] = COALESCE([2007], 0),
	[2008] = COALESCE([2008], 0), [2009] = COALESCE([2009], 0), [2010] = COALESCE([2010], 0), [2011] = COALESCE([2011], 0),
	[2012] = COALESCE([2012], 0), [2013] = COALESCE([2013], 0), [2014] = COALESCE([2014], 0), [2015] = COALESCE([2015], 0),
	[2016] = COALESCE([2016], 0), [2017] = COALESCE([2017], 0), [2018] = COALESCE([2018], 0), [2019] = COALESCE([2019], 0),
	[2020] = COALESCE([2020], 0), [2021] = COALESCE([2021], 0), [2022] = COALESCE([2022], 0), [2023] = COALESCE([2023], 0),
	[2024] = COALESCE([2024], 0)

WHERE 
	[1980] IS NULL OR [1981] IS NULL OR [1982] IS NULL OR [1983] IS NULL OR [1984] IS NULL OR [1985] IS NULL OR [1986] IS NULL
	OR [1987] IS NULL OR [1988] IS NULL OR [1989] IS NULL OR [1990] IS NULL OR [1991] IS NULL OR [1992] IS NULL OR [1993] IS NULL
	OR [1994] IS NULL OR [1995] IS NULL OR [1996] IS NULL OR [1997] IS NULL OR [1998] IS NULL OR [1999] IS NULL OR [2000] IS NULL
	OR [2001] IS NULL OR [2002] IS NULL OR [2003] IS NULL OR [2004] IS NULL OR [2005] IS NULL OR [2006] IS NULL OR [2007] IS NULL
	OR [2008] IS NULL OR [2009] IS NULL OR [2010] IS NULL OR [2011] IS NULL OR [2012] IS NULL OR [2013] IS NULL OR [2014] IS NULL
	OR [2015] IS NULL OR [2016] IS NULL OR [2017] IS NULL OR [2018] IS NULL OR [2019] IS NULL OR [2020] IS NULL OR [2021] IS NULL
	OR [2022] IS NULL OR [2023] IS NULL OR [2024] IS NULL;

--unpivoting the columns from 1980 to 2024 into rows under a single column called "Year".(This table is used for tableau visualization)
SELECT country_name, indicator_name, [Year], inflation_rate
FROM (
    SELECT country_name, indicator_name, [1980], [1981], [1982], [1983], [1984], [1985], [1986], [1987], [1988], [1989], [1990], [1991], [1992], [1993], [1994], [1995], [1996], [1997], [1998], [1999], [2000], [2001], [2002], [2003], [2004], [2005], [2006], [2007], [2008], [2009], [2010], [2011], [2012], [2013], [2014], [2015], [2016], [2017], [2018], [2019], [2020], [2021], [2022], [2023], [2024]
    FROM global_inflation
) AS SourceTable
UNPIVOT (
    inflation_rate FOR [Year] IN ([1980], [1981], [1982], [1983], [1984], [1985], [1986], [1987], [1988], [1989], [1990], [1991], [1992], [1993], [1994], [1995], [1996], [1997], [1998], [1999], [2000], [2001], [2002], [2003], [2004], [2005], [2006], [2007], [2008], [2009], [2010], [2011], [2012], [2013], [2014], [2015], [2016], [2017], [2018], [2019], [2020], [2021], [2022], [2023], [2024])
) AS UnpivotedTable;
