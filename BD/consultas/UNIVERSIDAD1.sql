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
    WHERE A.CREDITOS > 4.5;
/*    7. Mostrar el nombre de las asignaturas cuyo coste básico está entre 25 y 35 euros.*/
	SELECT A.NOMBRE, A.COSTEBASICO FROM ASIGNATURA A WHERE A.COSTEBASICO BETWEEN 25 AND 35;
/*   8. Mostrar el identificador de los alumnos matriculados en la asignatura '150212' o en la '130113' o en ambas.*/
	SELECT AA.IDALUMNO  FROM ALUMNO_ASIGNATURA aa 
	WHERE AA.IDASIGNATURA 
	IN('150212','130113');
	
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

/*    20. Mostrar el código de alumno que se ha matriculado tres o más veces de una asignatura, mostrando 
 * también el código de la asignatura correspondiente.*/
	SELECT A.IDALUMNO, A2.IDASIGNATURA 
	FROM ALUMNO a, ASIGNATURA a2,ALUMNO_ASIGNATURA aa 
	WHERE A.IDALUMNO = AA.IDALUMNO 
	AND AA.IDASIGNATURA = A2.IDASIGNATURA ;

	SELECT A.IDALUMNO, A2.IDASIGNATURA 
	FROM ALUMNO a
	INNER JOIN ALUMNO_ASIGNATURA aa 
	ON A.IDALUMNO = AA.IDALUMNO 
	INNER JOIN ASIGNATURA a2 
	ON AA.IDASIGNATURA = A2.IDASIGNATURA ;
	
	/*    21. El coste de cada asignatura va subiendo a medida que se repite la asignatura. Para saber cuál 
	 * sería el precio de las distintas asignaturas en las repeticiones (y así animar a nuestros alumnos a que estudien)
	 *  se quiere mostrar un listado en donde esté el nombre de la asignatura, el precio básico, el precio de la primera repetición 
	 * (un 10 por ciento más que el coste básico),  el precio de la segunda repetición (un 30 por ciento más que el coste básico) y
	 *  el precio de la tercer repetición (un 60 por ciento más que el coste básico).*/
	
	SELECT A.NOMBRE ,A.COSTEBASICO,A.COSTEBASICO+ (A.COSTEBASICO * 10/100) AS PRECIOPRIMERAREPETICION,
	A.COSTEBASICO+(A.COSTEBASICO * 30/100) AS PRECI0SEGUNDAREPETICION,
	A.COSTEBASICO+(A.COSTEBASICO * 60/100) AS PRECIOPTERCERAREPETICION
	FROM ASIGNATURA a ;
	
	SELECT a.NOMBRE,a.COSTEBASICO,aa.NUMEROMATRICULA,
	decode(aa.NUMEROMATRICULA,--LO QUE HACE ES BUSCAR DONDE Nº MATRICULA SEA EL N INTRODUCIDO Y LO ASOCIA CON EL CALCULO
	1,a.COSTEBASICO +(a.costebasico*0.1),
	2,a.COSTEBASICO +(a.costebasico*0.3),
	3,a.COSTEBASICO +(a.costebasico*0.6)
	)AS PRECIOREPETICION
	FROM ASIGNATURA a 
	JOIN ALUMNO_ASIGNATURA aa ON a.IDASIGNATURA = aa.IDASIGNATURA;
 
    /*22. Mostrar todos los datos de las personas que tenemos en la base de datos que han nacido antes de la década de los 70.*/
	SELECT * FROM PERSONA P WHERE EXTRACT(YEAR FROM P.FECHA_NACIMIENTO )< 1970; 
    /*23. Mostrar el identificador de las personas que trabajan como profesor, sin que salgan valores repetidos.*/
	SELECT  P.DNI FROM PERSONA p , PROFESOR p2 
	WHERE P.DNI=P2.DNI;
    
    SELECT  P.DNI FROM PERSONA p
    INNER JOIN PROFESOR p2 
    ON P.DNI=P2.DNI;
    /*24. Mostrar el identificador de los alumnos que se encuentran matriculados en la asignatura con código 130122.*/
	SELECT A.IDALUMNO FROM ALUMNO A,ALUMNO_ASIGNATURA aa ,ASIGNATURA a2 
	WHERE A.IDALUMNO = AA.IDALUMNO 
    AND AA.IDASIGNATURA =130122;
    
    SELECT A.IDALUMNO FROM ALUMNO a 
    INNER JOIN ALUMNO_ASIGNATURA aa 
    ON A.IDALUMNO = AA.IDALUMNO 
    INNER JOIN ASIGNATURA a2 
    ON A2.IDASIGNATURA = 130122;
    
    
    /*25. Mostrar los códigos de las asignaturas en las que se encuentra matriculado algún alumno, sin que salgan códigos repetidos.*/
		SELECT DISTINCT AA.IDASIGNATURA 
		FROM ALUMNO_ASIGNATURA aa 
		INNER JOIN ASIGNATURA A ON AA.IDASIGNATURA = A.IDASIGNATURA;
    /*26. Mostrar el nombre de las asignaturas que tienen más de 4 créditos, y además, o se imparten en el primer cuatrimestre o son del primer curso.*/
		SELECT A.NOMBRE AS ASIGNATURA FROM ASIGNATURA a  
		WHERE A.CREDITOS> 4
		AND (A.CUATRIMESTRE = 1 OR A.CURSO = 1)
    /*27. Mostrar los distintos códigos de las titulaciones en las que hay alguna asignatura en nuestra base de datos.*/
		SELECT NVL(A.IDTITULACION, 0)AS CODTITULACION 
		FROM ASIGNATURA A;
    /*28. Mostrar el dni de las personas cuyo apellido contiene la letra g en mayúsculas o minúsculas.*/
		SELECT P.DNI 
		FROM PERSONA P
		WHERE UPPER(P.APELLIDOS) LIKE '%G'
    /*29. Mostrar las personas varones que tenemos en la base de datos que han nacido con posterioridad a 1970 y que vivan en una ciudad que empieza por M.*/

	SELECT P.NOMBRE 
	FROM PERSONA P 
	WHERE EXTRACT(  YEAR FROM P.FECHA_NACIMIENTO) >1970
	AND P.VARON ;

	
	
	
	
	
	
	
	
	
	
	
	
	
