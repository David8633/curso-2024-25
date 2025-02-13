/*  1. Mostrar los nombres y los créditos de cada una de las asignaturas.*/
	SELECT A.NOMBRE, A.CREDITOS  FROM ASIGNATURA a ;
/*2. Obtener los posibles distintos créditos de las asignaturas que hay en la base de datos.*/
	SELECT DISTINCT A.CREDITOS FROM ASIGNATURA a ;
/*    3. Mostrar todos los datos de todas de las personas*/
	SELECT * FROM PERSONA p ;
/*    4. Mostrar el nombre y créditos de las asignaturas del primer cuatrimestre.*/
	SELECT A.NOMBRE, A.CREDITOS FROM ASIGNATURA a 
	WHERE A.CUATRIMESTRE = 1;
/*  5. Mostrar el nombre y el apellido de las personas nacidas antes del 1 de enero de 1975.*/
	SELECT P.NOMBRE, P.APELLIDO FROM PERSONA p 
	WHERE P.FECHA_NACIMIENTO < TO_DATE('1-01-1075','DD-MM-YYYY');
/*    6. Mostrar el nombre y el coste básico de las asignaturas de más de 4,5 créditos.*/
	SELECT A.NOMBRE, A.COSTEBASICO  FROM ASIGNATURA a
    WHERE A.CREDITOS > 4;
/*    7. Mostrar el nombre de las asignaturas cuyo coste básico está entre 25 y 35 euros.*/
	SELECT A.NOMBRE, A.COSTEBASICO FROM ASIGNATURA A WHERE A.COSTEBASICO BETWEEN 25 AND 35;
/*   8. Mostrar el identificador de los alumnos matriculados en la asignatura '150212' o en la '130113' o en ambas.*/
	SELECT AA.IDALUMNO  FROM ALUMNO_ASIGNATURA aa 
	WHERE AA.IDASIGNATURA 
	IN('150212','130113')
	OR AA.IDASIGNATURA = '130113' 
	OR AA.IDASIGNATURA = '150212' ;

/*    9. Obtener el nombre de las asignaturas del 2º cuatrimestre que no sean de 6 créditos.*/
	SELECT A.NOMBRE FROM ASIGNATURA a WHERE A.CUATRIMESTRE=2 AND A.CREDITOS !=6;
/*    10. Mostrar el nombre y el apellido de las personas cuyo apellido comience por 'G'.*/
	SELECT P.NOMBRE,P.APELLIDO FROM PERSONA p WHERE P.APELLIDO LIKE 'G%';
/*    11. Obtener el nombre de las asignaturas que no tienen dato para el IdTitulacion. */
	SELECT A.NOMBRE FROM ASIGNATURA A WHERE A.IDTITULACION IS NULL;
/*    12. Obtener el nombre de las asignaturas que tienen dato para el IdTitulacion.*/
	SELECT A.NOMBRE FROM ASIGNATURA a WHERE A.IDTITULACION IS NOT NULL;
/*    13. Mostrar el nombre de las asignaturas cuyo coste por cada crédito sea mayor de 8 euros. */
	SELECT A.NOMBRE FROM ASIGNATURA A WHERE A.CREDITOS > 8;
/*    14. Mostrar el nombre y el número de horas de las asignaturas de la base de datos. (1cred.=10 horas).*/
	SELECT A.NOMBRE,A.CREDITOS *10 AS NUMERODEHORAS  FROM ASIGNATURA a ;
/*    15. Mostrar todos los datos de las asignaturas del 2º cuatrimestre ordenados por el identificador de asignatura.*/
	SELECT * FROM ASIGNATURA A WHERE A.CUATRIMESTRE = 2 ORDER BY A.IDASIGNATURA DESC;
/*    16. Mostrar el nombre de todas las mujeres que viven en “Madrid”.*/
	SELECT P.NOMBRE  FROM PERSONA p WHERE P.VARON = 0 AND P.CIUDAD  = 'MADRID';
	
/*    17. Mostrar el nombre y los teléfonos de aquellas personas cuyo teléfono empieza por 91*/
	SELECT P.NOMBRE, P.TELEFONO FROM PERSONA P WHERE P.TELEFONO LIKE '91%'	;
/*    18. Mostrar el nombre de las asignaturas que contengan la sílaba “pro”*/
	SELECT A.NOMBRE FROM ASIGNATURA A WHERE A.NOMBRE LIKE '%PRO%'
	OR A.NOMBRE LIKE 'PRO%'
	OR A.NOMBRE LIKE'%PRO'
/*    19. Mostrar el nombre de la asignatura de primero y que lo imparta el profesor que tiene código P101*/
	
	SELECT A.NOMBRE, P2.NOMBRE
	FROM ASIGNATURA A, PROFESOR P, PERSONA P2 
	WHERE A.IDPROFESOR = P.IDPROFESOR
	AND P.DNI=P2.DNI;

/*    20. Mostrar el código de alumno que se ha matriculado tres o más veces de una asignatura, mostrando también el código de la asignatura correspondiente.*/

	