/*Escribe un procedimiento que muestre el número de empleados y el salario
mínimo, máximo y medio del departamento de FINANZAS. Debe hacerse
uso de cursores implícitos, es decir utilizar SELECT ... INTO.*/

CREATE OR REPLACE PROCEDURE mostrar_estadisticas_finanzas IS
	v_num_empleado NUMBER;
	v_salario_minimo NUMBER;
	v_salario_maximo NUMBER;
 	v_salario_promedio NUMBER;
BEGIN
	SELECT COUNT(*) , MIN(e.SALAR), MAX(e.SALAR) , AVG(e.SALAR)
	INTO v_num_empleado , v_salario_minimo, v_salario_maximo, v_salario_promedio
	FROM EMPLEADOS e 
	JOIN DEPARTAMENTOS d ON e.NUMDE = d.NUMDE 
	WHERE d.NOMDE LIKE 'FINANZAS';
	DBMS_OUTPUT.PUT_LINE('Numero de empleados = ' || v_num_empleado);
	DBMS_OUTPUT.PUT_LINE('Salario minimo = ' || v_salario_minimo || '€');
	DBMS_OUTPUT.PUT_LINE('Salario maximo = ' || v_salario_maximo|| '€');
	DBMS_OUTPUT.PUT_LINE('Salario promedio = ' || v_salario_promedio || '€');
	
END;


BEGIN
	 mostrar_estadisticas_finanzas;
END;

/*
CREATE OR REPLACE PROCEDURE muestraEmpleados2
AS 
	TYPE v_empleados IS RECORD
	(
	num_empleados NUMBER,
	maximo_salario NUMBER,
	minimo_salario NUMBER,
	medio_salario NUMBER
	);
	v_resultado v_empleados;
BEGIN 
	SELECT COUNT(*), MAX(e.SALAR), MIN(e.SALAR), AVG(e.SALAR) INTO v_resultado
	FROM EMPLEADOS e, DEPARTAMENTOS d 
	WHERE e.NUMDE = d.NUMDE
	AND UPPER(d.NOMDE) = 'FINANZAS';
	
	DBMS_OUTPUT.PUT_LINE (v_resultado.num_empleados);
	DBMS_OUTPUT.PUT_LINE (v_resultado.maximo_salario);
*/


/*2. Escribe un procedimiento que suba un 10% el salario a los EMPLEADOS
con más de 2 hijos y que ganen menos de 2000 €. Para cada empleado se
mostrar por pantalla el código de empleado, nombre, salario anterior y final.
Utiliza un cursor explícito. La transacción no puede quedarse a medias. Si
por cualquier razón no es posible actualizar todos estos salarios, debe
deshacerse el trabajo a la situación inicial.*/

CREATE OR REPLACE 
PROCEDURE  ACTIVIDAD1_PLSQL.SUBIRSALARIO
IS
	CURSOR C_EMPLEADOS IS 
	SELECT E.NUMEM,E.NOMEM,E.SALAR AS SALARIO_ANTERIOR,E.SALAR + E.SALAR*0,10 AS SALARIO_ACTUALIZADO FROM EMPLEADOS E 
    WHERE E.SALAR < 2000 AND E.NUMHI > 2;
BEGIN
	FOR REGISTRO IN V_EMP 
	LOOP
	DBMS_OUTPUT.PUT_LINE();		
	END LOOP
END

/*3. Escribe un procedimiento que reciba dos parámetros (número de
departamento, hijos). Deber. crearse un cursor explícito al que se le pasarán
estos parámetros y que mostrar. los datos de los empleados que pertenezcan
al departamento y con el número de hijos indicados. Al final se indicar. el
número de empleados obtenidos.*/
/*4. Escribe un procedimiento con un parámetro para el nombre de empleado,
que nos muestre la edad de dicho empleado en años, meses y días.*/