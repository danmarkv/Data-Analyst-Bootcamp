# DATA CLEANING

SELECT *
FROM layoffs;

# Steps to Data Cleaning
--   1. Remove Duplicates
--   2. Standardize the Data
--   3. Null values or blank values
--   4. Remove any irrelevant columns



# 1 Remove Duplicates

-- 1 create a table with columns like the raw data source
CREATE TABLE layoffs_staging
LIKE layoffs;

-- 2 check if it worked
SELECT *
FROM layoffs_staging;

-- 3 insert the data from the raw data to new staging table
INSERT layoffs_staging
SELECT *
FROM layoffs;

-- 4 find duplicates by using ROW_NUMBER() OVER(PARTITION BY...)
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;

-- 5 use CTE to filter row_num
-- 7 add 'location' and 'funds_raised_millions'
WITH duplicate_CTE AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, 
location, 
industry, 
total_laid_off, 
percentage_laid_off, 
`date`,
country,
funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_CTE
WHERE row_num > 1;

-- 6 verify the duplicates. 'Oda' is not a duplicate so add 'location' and 'funds_raised_millions' to step 5
SELECT *
FROM layoffs_staging
WHERE company = 'Casper';

-- 8 we can't delete rows/columns with CTE so we need to create another table and delete the duplicates there
WITH duplicate_CTE AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, 
location, 
industry, 
total_laid_off, 
percentage_laid_off, 
`date`,
country,
funds_raised_millions) AS row_num
FROM layoffs_staging
)
DELETE
FROM duplicate_CTE
WHERE row_num > 1;

-- 9 copy layoffs_staging Create Statement. rename it to layoffs_staging2 and add row_num INT
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 10 view if the empty tables are reflected
SELECT *
FROM layoffs_staging2;

-- 11 insert layoffs_staging data to layoffs_staging2 table
INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, 
location, 
industry, 
total_laid_off, 
percentage_laid_off, 
`date`,
country,
funds_raised_millions) AS row_num
FROM layoffs_staging;

-- 12 check the row_num data that are more than 1
SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

-- 13 delete row_num > 1
DELETE
FROM layoffs_staging2
WHERE row_num > 1;

-- 14 check if they're deleted
SELECT *
FROM layoffs_staging2;



# Standardizing Data

-- 15 trim data to remove white spaces before and after the company names
SELECT DISTINCT(TRIM(company))
FROM layoffs_staging2;

-- 16 compare company with no trim and trimmed
SELECT company, TRIM(company)
FROM layoffs_staging2;

-- 17 replace the trimmed company to the no trim one
UPDATE layoffs_staging2
SET company = TRIM(company);

-- 18 check if it worked, then check industry, then order it alphabetically
-- 21 check industry again
SELECT DISTINCT(industry)
FROM layoffs_staging2
ORDER BY 1;

-- 19 industry has the same Crypto values
SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

-- 20 update Crpyto-like values to Crypto
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- 22 company and industry looks good. now look at location
-- 23 and look at country
# SELECT DISTINCT location
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

-- 24 United States has the another column with 'United States.'
SELECT *
FROM layoffs_staging2
WHERE country LIKE 'United States%';

-- 25 trim the United States. column
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;

-- 26 change United States. to United States
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- 27 date column is in text data type
SELECT `date`
FROM layoffs_staging2
ORDER BY 1;

-- 28 update `date` column to date format
UPDATE layoffs_staging2
SET `date` = str_to_date(`date`, '%m/%d/%Y');

-- 29 change the data type of `date` column to date
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

-- 30 verify if table is good
SELECT *
FROM layoffs_staging2;



# Working with Null and Blank Values

-- 31 filter the null values from total_laid_off and percentage_laid_off
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- 32 filter industry for null or blank values
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

-- 33 check the company of the null/blank industry if the other values have an industry to them
SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';

-- 34 use JOIN to check industries with same company and locaton but one has industry and the other has null/blank values
SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

-- 35 update the blank industry value with ones that have a value
-- 37 redo the query but remove the t1.industry = '' because it's changed to null
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NUll;

-- 36 step 35 didn't work, new plan is set blank values to null and then do step 35
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

-- 38 check again for null or blank values. Bally's is still null
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

-- 39 check if Bally's has a same company with not null or blank values. ANSWER: it doesn't
SELECT *
FROM layoffs_staging2
WHERE company LIKE 'Bally%';

-- 40 go back to dealing with total_laid_off and percentage_laid_off
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- 41 delete rows with null or blank total_laid_off and percentage_laid_off because data is unusable. should you delete these rows? not sure but data is unusable
DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- 42 check table again
SELECT *
FROM layoffs_staging2;

-- 43 remove row_num column




