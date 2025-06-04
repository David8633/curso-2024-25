/*1. Crea un procedimiento llamado ESCRIBE para mostrar por pantalla el
mensaje HOLA MUNDO.*/
CREATE OR REPLACE
PROCEDURE ACTIVIDAD1_PLSQ.ESCRIBE()
IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('HOLA MUNDO');
END;

/*2. Crea un procedimiento llamado ESCRIBE_MENSAJE que tenga un
parámetro de tipo VARCHAR2 que recibe un texto y lo muestre por pantalla.
La forma del procedimiento ser. la siguiente:
ESCRIBE_MENSAJE (mensaje VARCHAR2)*/
CREATE OR REPLACE PROCEDURE ACTIVIDAD1_PLSQL.ESCRIBE_MENSAJE (MENS VARCHAR2)
IS
BEGIN 
	DBMS_OUTPUT.PUT_LINE(MENS);
END;
	

/*3. Crea un procedimiento llamado SERIE que muestre por pantalla una serie de
números desde un mínimo hasta un máximo con un determinado paso. La
forma del procedimiento ser. la siguiente:
SERIE (minimo NUMBER, maximo NUMBER, paso NUMBER)*/

CREATE OR REPLACE
PROCEDURE SERIE(minimo NUMBER, maximo NUMBER, paso NUMBER)
IS
	maximo NUMBER;
	minimo NUMBER;
	paso NUMBER;
BEGIN
	DMBS
END


/*4. Crea una función AZAR que reciba dos parámetros y genere un número al
azar entre un mínimo y máximo indicado. La forma de la función será la
siguiente:
AZAR (minimo NUMBER, maximo NUMBER) RETURN NUMBER*/
CREATE OR REPLACE FUNCTION DUMMY.azar(minimo NUMBER, maximo number)
RETURN NUMBER
AS
	v_numero NUMBER;
BEGIN
	RETURN FLOOR(DBMS_RANDOM.VALUE(minimo, maximo + 1)); 
END;


/*5. Crea una función NOTA que reciba un parámetro que será una nota numérica
entre 0 y 10 y devuelva una cadena de texto con la calificación (Suficiente,
Bien, Notable, ...). La forma de la función será la siguiente:
NOTA (nota NUMBER) RETURN VARCHAR2*/

CREATE OR REPLACE
FUNCTION ACTIVIDAD1_PLSQL.NOTA(NOTA NUMBER )
RETURN VARCHAR
AS
BEGIN 
	CASE NOTA
		WHEN NOTA BETWEEN 0 AND 4 THEN 'INSUFICIENTE';
		WHEN NOTA=5 THEN 'SUFICIENTE';
		WHEN NOTA BETWEEN 6 AND 8 THEN 'NOTABLE';
		WHEN NTA BETWEEN 9 AND 10 THE 'SOBRESALIENTE';
END;
