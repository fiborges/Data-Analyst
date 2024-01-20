/*
o número de empregados por ano e gênero, mas apenas para anos a partir de 1990. 
Isso fornece uma visão agregada do número de empregados para cada ano e gênero, 
considerando as informações nas tabelas employees e dept_emp
*/

USE employees;
/*
SELECT emp_no, from_date, to_date
FROM dept_emp;
*/

/*
selecionando todas as combinações distintas de emp_no, from_date e to_date da 
tabela dept_emp. A cláusula DISTINCT garante que apenas entradas únicas 
sejam retornadas.
*/
SELECT DISTINCT emp_no, from_date, to_date
FROM dept_emp;

-- problem 1: soluction sql
SELECT 
	YEAR(d.from_date) as calendar_year,
    e.gender,
    COUNT(e.emp_no) as num_of_employees
FROM
	employees e
    JOIN
    dept_emp d ON d.emp_no = e.emp_no
GROUP BY calendar_year, e.gender
HAVING calendar_year >= 1990;

/*
JOIN: Aqui você está combinando as tabelas employees e dept_emp usando a condição ON d.emp_no = e.emp_no.
YEAR(d.from_date) as calendar_year: Você está extraindo o ano da coluna from_date e chamando-o de calendar_year.
COUNT(e.emp_no) as num_of_employees: Você está contando o número de empregados para cada combinação de calendar_year e gender.
GROUP BY calendar_year, e.gender: Agrupa os resultados pela combinação de ano e gênero.
HAVING calendar_year >= 1990: Filtra os grupos para incluir apenas aqueles a partir de 1990.
*/
