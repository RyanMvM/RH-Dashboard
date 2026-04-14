-- 1.Qual é a composição por gênero dos funcionários da empresa?

SELECT gender, count(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY gender; 

-- 2.Qual é a composição por raça/etnia dos funcionários da empresa?
SELECT race, count(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY race
ORDER BY count(*) DESC;

-- 3.Qual é a distribuição etária dos funcionários da empresa?

SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr
WHERE age >= 18 AND termdate IS NULL; 

SELECT 
  CASE
	 WHEN age >= 18 AND age <= 24 THEN '18-24'
     WHEN age >= 25 AND age <= 34 THEN '25-34'
     WHEN age >= 35 AND age <= 44 THEN '35-44'
     WHEN age >= 45 AND age <= 54 THEN '45-54'
     WHEN age >= 55 AND age <= 64 THEN '55-64'
    ELSE '65+'
  END AS age_group, gender, 
  count(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY age_group, gender
ORDER BY age_group, gender DESC;
    
-- 4. Quantos empregados presencialmente x localizações remotas?

SELECT location, count(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY location; 

-- 5. Qual é a duração média dos contratos de trabalho dos funcionários que foram demitidos? 

 SELECT 
	ROUND(avg(datediff(termdate, hire_date))/365,0) AS avg_lenght_employment
FROM hr
WHERE termdate IS NOT NULL AND termdate <= CURDATE() AND age >= 18; 

-- 6. Como varia a distribuição por gênero entre os departamentos e cargos?

SELECT department, gender, COUNT(*) AS count 
FROM hr 
WHERE age >= 18 AND termdate IS NULL
GROUP BY department, gender
ORDER BY department;

-- 7. Qual é a distribuição dos cargos na empresa?

SELECT jobtitle, COUNT(*) AS count 
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY jobtitle
ORDER BY jobtitle DESC;

-- 8. Qual departamento apresenta a maior taxa de rotatividade?

SELECT department,
	total_count,
    terminated_count,
    terminated_count/total_count AS termination_rate
FROM (
	SELECT department, 
		count(*) AS total_count, 
        SUM(CASE WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1 ELSE 0 END) AS terminated_count
        FROM hr
        WHERE age >= 18
        GROUP BY department
        ) AS subquery 
        ORDER BY termination_rate DESC; 

-- 9. Qual a distribuição por localidade, cidade e estado

SELECT location_state, COUNT(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY location_state
ORDER BY count DESC; 

-- 10. Como o número de funcionários da empresa tem variado ao longo do tempo, com base nas datas de contratação e de término de contrato? 

SELECT 
	year, 
    hires, 
    terminationS, 
    hires - terminations AS net_change,
    ROUND((hires - terminations)/HIRES * 100,2) AS net_change_percent
    FROM( 
		SELECT YEAR(hire_date) AS year, 
        count(*) AS hires, 
        SUM(CASE WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1 ELSE 0 END) AS terminations
        FROM hr
        WHERE age >= 18 
        GROUP BY YEAR (hire_date)
        ) AS subquery 
	ORDER BY year ASC;

-- 11. Qual é a distribuição de cargos efetivos em cada departamento? 

SELECT department, round(avg(datediff(termdate, hire_date)/365),0) AS avg_tenure
FROM hr
WHERE termdate <= curdate() AND termdate IS NOT NULL AND age >= 18
GROUP BY department; 
