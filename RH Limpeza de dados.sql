CREATE DATABASE ProjectHR;
USE ProjectHR;
SELECT * FROM hr; 

ALTER TABLE hr
 CHANGE COLUMN ï»¿id emp_ID VARCHAR (20) NULL; 

-- Visualizar estrutura da tabela ou metadados
DESCRIBE hr; 
SELECT birthdate FROM hr; 

-- Desablita o modo de atualizaçãom, evitando erro 1175
SET sql_safe_updates = 0; 

-- Modificar dados existentes na tabela 
UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
		ELSE NULL 
	END;
	
ALTER TABLE hr
MODIFY COLUMN birthdate DATE; 
-- Datas com ano superior ao ano atual são subtraidos por um intervalo de 100 anos 
UPDATE hr
SET birthdate = DATE_SUB(birthdate, INTERVAL 100 YEAR)
WHERE birthdate > CURDATE(); 

-- padroniza o formato de data de contratação com '-'
UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
		ELSE NULL 
	END;

-- modifica a coluna de texto para tipo DATA
ALTER TABLE hr
MODIFY COLUMN hire_date DATE; 

-- Para todas as datas que estiverem vazias, ele determina como NULL
UPDATE hr
SET termdate = NULL
WHERE termdate = '';

UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NULL;

ALTER TABLE hr     
MODIFY COLUMN termdate DATE;

ALTER TABLE hr ADD COLUMN age INT; 

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT 
	min(age) AS youngest,
    max(age) AS oldest 
FROM hr; 

SELECT count(*) FROM hr WHERE age < 24;