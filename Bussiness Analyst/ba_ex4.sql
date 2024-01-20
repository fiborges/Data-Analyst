/*
Create an SQL stored procedure that will allow you to obtain the average 
male and female salary per department within a certain salary range. Let this 
range be defined by two values the user can insert when calling the procedure.
*/

DROP PROCEDURE IF EXISTS filter_salary;

DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
SELECT 
    e.gender, d.dept_name, AVG(s.salary) as avg_salary
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
        JOIN
    dept_emp de ON de.emp_no = e.emp_no
        JOIN
    departments d ON d.dept_no = de.dept_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY d.dept_no, e.gender;
END$$

DELIMITER ;

CALL filter_salary(50000, 90000);

/*
DROP PROCEDURE IF EXISTS filter_salary;
DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
verificação e eliminação do procedimento se ele já existir. Em seguida, define o delimitador como $$ e 
inicia a criação do procedimento filter_salary com dois parâmetros de entrada, 
p_min_salary e p_max_salary.

No corpo do procedimento, você está executando uma consulta que retorna o gênero, o nome do departamento 
e a média salarial (AVG(s.salary)) para salários dentro do intervalo especificado pelos parâmetros p_min_salary 
e p_max_salary. Os resultados são agrupados por número do departamento e gênero.

CALL filter_salary(50000, 90000);
Este comando chama o procedimento filter_salary com valores específicos (50000 e 90000) 
para os parâmetros p_min_salary e p_max_salary.




*/