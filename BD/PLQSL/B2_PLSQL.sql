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
PROCEDURE ASCENSO_SALARIO
IS
	CURSOR C_EMP IS
	SELECT e.NUMEM, e.NOMEM, e.SALAR
    FROM EMPLEADOS e 
    WHERE e.NUMHI > 2
    AND e.SALAR < 2000;
	
BEGIN 

	FOR EMP IN C_EMP
		LOOP
			DBMS_OUTPUT.PUT_LINE('NUMERO EMPLEADO :'  || EMP.NUMEM)
			DBMS_OUTPUT.PUT_LINE('NOMBRE EMPLEADO :' || EMP.NOMEM)
			DBMS_OUTPUT.PUT_LINE('SALARIO EMPLEADO :'|| EMP.SALAR)
			
			UPDATE EMPLEADOS
			SET SALAR = EMP.SALAR * 1.10
			WHERE NUMEM = EMP.NUMEM;
			
			 COMMIT;

			EXCEPTION
	    		WHEN OTHERS THEN
	        	ROLLBACK;
	        	DBMS_OUTPUT.PUT_LINE('Error: '  SQLERRM);
			END subida_salario;
				
		END LOOP;
		
END;

BEGIN
    ASCENSO_SALARIO;
END



/*3. Escribe un procedimiento que reciba dos parámetros (número de
departamento, hijos). Deber. crearse un cursor explícito al que se le pasarán
estos parámetros y que mostrar. los datos de los empleados que pertenezcan
al departamento y con el número de hijos indicados. Al final se indicar. el
-número de empleados obtenidos.*/
CREATE OR REPLACE 
PROCEDURE calcular_cantidad(NUMDEPT NUMBER,NUMHIJOS NUMBER)
IS
	v_cantidad number := 0;

	CURSOR C_EMPLEADOS IS
	SELECT e.numem,e.noemp FROM EMPLEADOS e
	WHERE e.numde = numdept AND e.numhij = numhijos;
BEGIN

	FOR emp IN c_empleados
	loop
		v_cantidad := v_cantidad +1;
	end loop
	
	dbms_output.put_line('cantidad de empleados con dichas caracteristicas : ' || v_cantidad )
	
END;


CREATE OR REPLACE 
PROCEDURE(NUMDEPT NUMBER,NUMHIJOS NUMBER)
IS
	v_cantidad number;
BEGIN
	CURSOR C_EMPLEADOS IS
	SELECT count(e.numem)
	INTO v_cantidad
	FROM EMPLEADOS e
	WHERE e.numde = numdept AND e.numhij = numhijos;
	dbms_output.put_line('cantidad de empleados con dichas caracteristicas : ' || v_cantidad )
END


/*4. Escribe un procedimiento con un parámetro para el nombre de empleado,
que nos muestre la edad de dicho empleado en años, meses y días.*/

CREATE OR replace 
PROCEDURE MOSTRAR_EDAD(NOEMP VARCHAR2)
IS
		
	TYPE V_EMPLEADOS IS RECORD(
		V_AÑOS NUMBER;
		V_MESE NUMBER;
		V_DIAS NUMBER;

	);
	
BEGIN
	SELECT E. 
	INSERT INTO V_EMPLEADOS  
	FROM EMPLEADOS E;

	DBMS_OUTPUT.PTU_LINE('MI EDAD EN AÑOS SERIAN: '|| V_EMPLEADOS.V.AÑOS);
	DBMS_OUTPUT.PTU_LINE('MI EDAD EN MESES SERIAN: '|| V_EMPLEADOS.V.MESE);
	DBMS_OUTPUT.PTU_LINE('MI EDAD EN DIAS SERIAN: '|| V_EMPLEADOS.V.DIAS);
	
END


