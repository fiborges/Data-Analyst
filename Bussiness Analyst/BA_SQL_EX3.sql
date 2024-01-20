/*
Compare the average salary of female versus male employees in the entire 
company until year 2002, and add a filter allowing you to see that per each 
department.
*/

SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS salary,
    YEAR(s.from_date) AS calendar_year
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
        JOIN
    dept_emp de ON de.emp_no = e.emp_no
        JOIN
    departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no , e.gender , calendar_year
HAVING calendar_year <= 2002
ORDER BY d.dept_no;

/*
(SELECT 
    YEAR(hire_date) AS calendar_year
FROM
    t_employees
GROUP BY calendar_year) e
subconsulta que seleciona os anos de contratação únicos a partir da tabela t_employees 
e nomea a coluna resultante como calendar_year.

e CROSS JOIN t_dept_manager dm
junção cruzada entre a subconsulta e (contendo os anos de contratação) e a tabela 
t_dept_manager (contendo informações sobre os gerentes de departamento

JOIN t_departments d ON dm.dept_no = d.dept_no
JOIN t_employees ee ON dm.emp_no = ee.emp_no
Estas são junções adicionais que ligam as tabelas t_dept_manager com departments e employees para 
obter informações adicionais sobre os departamentos e os gerentes.

CASE
        WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
    
selecionando as colunas desejadas e criando uma coluna calculada chamada active. 
Esta coluna será 1 se o ano atual estiver dentro do intervalo de datas (from_date e to_date) 
do gerente do departamento e 0 caso contrário.

ORDER BY dm.emp_no, calendar_year;

Finalmente, você está ordenando os resultados pelo número do empregado (emp_no) 
e pelo ano do calendário (calendar_year).

Este código SQL retorna informações sobre os gerentes de departamento, 
incluindo detalhes sobre os departamentos, os gerentes, seus gêneros, e se estavam 
ativos em um determinado ano, com base nas datas de início e término de seu período 
como gerente.

*/

