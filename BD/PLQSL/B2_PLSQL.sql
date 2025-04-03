
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

CREATE OR REPLACE PROCEDURE ACTIVIDAD1_PLSQL.padre_hijo(v_dep NUMBER , v_hijos NUMBER) 
IS 
	CURSOR c_emp IS
	 SELECT  e.NUMHI, e.NUMDE
	 FROM EMPLEADOS e 
	 WHERE v_dep = e.NUMDE
	 AND v_hijos = e.NUMHI;
	v_cant NUMBER:=0;
BEGIN 
	FOR emp IN c_emp LOOP 
		DBMS_OUTPUT.PUT_LINE(emp.numde);
		DBMS_OUTPUT.PUT_LINE(emp.numhi);
		v_cant:= v_cant + 1;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(v_cant);
END padre_hijo;
	
	


BEGIN 
	padre_hijo(121,2);
END;

CREATE OR REPLACE PROCEDURE ACTIVIDAD1_PLSQL.calcular_cantidad_dept(NUMDEPT NUMBER,NUMHIJOS NUMBER)
IS
	v_cantidad number;
BEGIN
	SELECT count(e.numem)
	INTO v_cantidad
	FROM EMPLEADOS e
	WHERE e.numde = numdept AND e.numhi = numhijos;
	dbms_output.put_line('cantidad de empleados con dichas caracteristicas : ' || v_cantidad );
END;

BEGIN 
	calcular_cantidad(5,2);
END;


/*4. Escribe un procedimiento con un parámetro para el nombre de empleado,
que nos muestre la edad de dicho empleado en años, meses y días.*/

CREATE OR REPLACE PROCEDURE ACTIVIDAD1_PLSQL.MOSTRAR_EDAD(NOEMP VARCHAR2)
AS
	TYPE V_EMPLEADOS IS RECORD(
		V_ANOS NUMBER,
		V_MESE NUMBER,
		V_DIAS NUMBER
	);
	V_RESUL V_EMPLEADOS;
BEGIN
	SELECT EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM e.fecna),EXTRACT(month FROM SYSDATE)-EXTRACT(month FROM e.fecna), EXTRACT(day FROM SYSDATE)-EXTRACT(day FROM e.fecna)
	INTO V_RESUL
	FROM EMPLEADOS e
	WHERE E.NOMEM = NOEMP;
	DBMS_OUTPUT.PUT_LINE('MI AÑO ES: '|| V_RESUL.V_ANOS);
	DBMS_OUTPUT.PUT_LINE('MI MES ES: '|| V_RESUL.V_MESE);
	DBMS_OUTPUT.PUT_LINE('MI DIA ES: '|| V_RESUL.V_DIAS); 
END;

BEGIN
	MOSTRAR_EDAD('JULIANA');
END;

SELECT * FROM EMPLEADOS e ;



