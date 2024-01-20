/*
Compare the number of male managers to the number of female managers 
from different departments for each year, starting from 1990.
*/
SELECT
	d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
		WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
FROM
	(SELECT YEAR(hire_date) AS calendar_year 
    FROM
		employees
	GROUP BY calendar_year) e
		CROSS JOIN
	dept_manager dm
		JOIN
	departments d ON dm.dept_no = d.dept_no
		JOIN
	employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;

/*
(SELECT YEAR(hire_date) AS calendar_year FROM t_employees
GROUP BY calendar_year) e
subconsulta que seleciona os anos de contratação únicos a partir 
da tabela t_employees e nomeando a coluna resultante como calendar_year.

e CROSS JOIN t_dept_manager dm
Aqui, você está fazendo uma junção cruzada entre a subconsulta e 
(contendo os anos de contratação) e a tabela t_dept_manager (contendo informações 
sobre os gerentes de departamento).

JOIN t_departments d ON dm.dept_no = d.dept_no
JOIN t_employees ee ON dm.emp_no = ee.emp_no
Estas são junções adicionais que ligam as tabelas t_dept_manager com t_departments 
e t_employees para obter informações adicionais sobre os departamentos e os gerentes

 CASE
        WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
   
   selecionando as colunas desejadas e criando uma coluna calculada chamada active. 
   Esta coluna será 1 se o ano atual estiver dentro do intervalo de datas (from_date e to_date) 
   do gerente do departamento e 0 caso contrário.
   
   ORDER BY dm.emp_no, calendar_year;
Finalmente, você está ordenando os resultados pelo número do empregado (emp_no) e pelo ano do 
calendário (calendar_year).

Este código SQL retorna informações sobre os gerentes de departamento, incluindo detalhes 
sobre os departamentos, os gerentes, seus gêneros, e se estavam ativos em um determinado ano, 
com base nas datas de início e término de seu período como gerente.
   


*/
		