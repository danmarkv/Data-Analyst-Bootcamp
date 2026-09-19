# DATA CLEANING

SELECT *
FROM layoffs;

# Steps to Data Cleaning
--   1. Remove Duplicates
--   2. Standardize the Data
--   3. Null values or blank values
--   4. Remove any irrelevant columns

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

SELECT *
FROM layoffs_staging2;