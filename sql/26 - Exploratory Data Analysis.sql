# Exploratory Data Analysis

-- 1 check the data first
SELECT *
FROM layoffs_staging2;

-- 2 explore the data and check the max total_laid_off and percentage_laid_off
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- 3 find out what company is it
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- 4 check the sum of total_laid_off
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- 5 check the date range
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

-- 6 check sum total_laid_off by industry
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- 7 check sum total_laid_off by country
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

-- 8 check sum total_laid_off by year
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

-- 9 check stage total_laid_off by year
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

-- 10 create rolling total of total_laid_off by month
SELECT SUBSTRING(`date`, 1, 7) `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

-- 11 creat rolling total per month
WITH rolling_total as
(
SELECT SUBSTRING(`date`, 1, 7) `MONTH`, SUM(total_laid_off) AS total_laid_off_monthly
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_laid_off_monthly, SUM(total_laid_off_monthly) OVER(ORDER BY `MONTH`) as rolling_totals
FROM rolling_total;