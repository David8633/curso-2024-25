 --1. Cuantos costes básicos hay.
	SELECT COUNT(A.COSTEBASICO) FROM ASIGNATURA a ;
  /*  2. Para cada titulación mostrar el número de asignaturas que hay junto con el nombre de la titulación.*/
 
	SELECT T.IDTITULACION , T.NOMBRE,COUNT(A.IDASIGNATURA) AS CANTIDAD_ASIGNATURA
	FROM TITULACION T, ASIGNATURA A
	WHERE T.IDTITULACION = A.IDTITULACION
	GROUP BY T.IDTITULACION, T.NOMBRE;
	
	SELECT T.IDTITULACION , T.NOMBRE,COUNT(A.IDASIGNATURA) AS CANTIDAD_ASIGNATURA
	FROM TITULACION T
	INNER JOIN ASIGNATURA A
	ON T.IDTITULACION = A.IDTITULACION
	GROUP BY T.IDTITULACION, T.NOMBRE;
    /*3. Para cada titulación mostrar el nombre de la titulación junto con el precio total de todas sus asignaturas.*/
	SELECT T.IDTITULACION, T.NOMBRE, SUM(A.COSTEBASICO)
	FROM TITULACION T , ASIGNATURA A 
	WHERE T.IDTITULACION = A.IDTITULACION
	GROUP BY T.IDTITULACION, T.NOMBRE;
	
	SELECT T.IDTITULACION, T.NOMBRE, SUM(A.COSTEBASICO)
	FROM TITULACION T 
	INNER JOIN ASIGNATURA A 
	ON T.IDTITULACION = A.IDTITULACION
	GROUP BY T.IDTITULACION, T.NOMBRE;
    /*4. Cual sería el coste global de cursar la titulación de Matemáticas si el coste de cada asignatura fuera incrementado en un 7%. */
	SELECT T.NOMBRE,SUM(A.IDASIGNATURA*1.07)
	FROM TITULACION t , ASIGNATURA a 
	WHERE T.IDTITULACION = A.IDTITULACION 
	GROUP BY T.NOMBRE;
	
	SELECT T.NOMBRE,SUM(A.IDASIGNATURA*1.07)
	FROM TITULACION t 
	INNER JOIN ASIGNATURA a 
	ON T.IDTITULACION = A.IDTITULACION 
	GROUP BY T.NOMBRE;
    /*5. Cuantos alumnos hay matriculados en cada asignatura, junto al id de la asignatura. */
	SELECT A.IDASIGNATURA, COUNT(AA.IDALUMNO)
	FROM ASIGNATURA a, ALUMNO_ASIGNATURA aa
	WHERE a.IDASIGNATURA = AA.IDASIGNATURA 
	GROUP BY A.IDASIGNATURA;
	
	SELECT A.IDASIGNATURA, COUNT(AA.IDALUMNO)
	FROM ASIGNATURA a 
	INNER JOIN ALUMNO_ASIGNATURA aa 
	ON a.IDASIGNATURA = AA.IDASIGNATURA 
	GROUP BY A.IDASIGNATURA;
    /*6. Igual que el anterior pero mostrando el nombre de la asignatura.*/
	SELECT A.IDASIGNATURA,A.NOMBRE , COUNT(AA.IDALUMNO)
	FROM ASIGNATURA a, ALUMNO_ASIGNATURA aa
	WHERE a.IDASIGNATURA = AA.IDASIGNATURA 
	GROUP BY A.IDASIGNATURA,A.NOMBRE;
	
	SELECT A.IDASIGNATURA,A.NOMBRE, COUNT(AA.IDALUMNO)
	FROM ASIGNATURA a 
	INNER JOIN ALUMNO_ASIGNATURA aa 
	ON a.IDASIGNATURA = AA.IDASIGNATURA 
	GROUP BY A.IDASIGNATURA,A.NOMBRE ;
    /*7. Mostrar para cada alumno, el nombre del alumno junto con lo que tendría que pagar por el total de todas las asignaturas en las que está matriculada. 
     * Recuerda que el precio de la matrícula tiene un incremento de un 10% por cada año en el que esté matriculado.*/ 
	SELECT P.NOMBRE,SUM(A1.COSTEBASICO*POWER(1.1,AA.NUMEROMATRICULA)) AS PRECIO_DE_LA_MATRICULA
	FROM ALUMNO a ,ALUMNO_ASIGNATURA aa, PERSONA p,ASIGNATURA a1
	WHERE P.DNI = A.DNI
	AND A.IDALUMNO = AA.IDALUMNO 
	AND AA.IDASIGNATURA = A1.IDASIGNATURA
	GROUP BY P.NOMBRE;
	
	SELECT P.NOMBRE,SUM(A1.COSTEBASICO*POWER(1.1,AA.NUMEROMATRICULA)) AS PRECIO_DE_LA_MATRICULA
	FROM ALUMNO a  
	INNER JOIN PERSONA p
	ON P.DNI = A.DNI
	INNER JOIN ALUMNO_ASIGNATURA aa 
	ON A.IDALUMNO = AA.IDALUMNO 
	INNER JOIN ASIGNATURA a1
	ON AA.IDASIGNATURA = A1.IDASIGNATURA
	GROUP BY P.NOMBRE;	
    /*8. Coste medio de las asignaturas de cada titulación, para aquellas titulaciones en el que el coste total de la 1ª matrícula sea mayor que 60 euros. */
	SELECT T.IDTITULACION, AVG(A.IDASIGNATURA) 
	FROM ASIGNATURA a,TITULACION t  
	WHERE a.IDTITULACION = T.IDTITULACION
	GROUP BY T.IDTITULACION
	HAVING AVG(A.IDASIGNATURA)>60;
	
	SELECT T.IDTITULACION, AVG(A.IDASIGNATURA) 
	FROM ASIGNATURA a
	INNER JOIN TITULACION t  
	ON a.IDTITULACION = T.IDTITULACION
	GROUP BY T.IDTITULACION
	HAVING AVG(A.IDASIGNATURA)>60;
    /*9. Nombre de las titulaciones  que tengan más de tres alumnos.*/
	SELECT T.NOMBRE
	FROM TITULACION T,ASIGNATURA a ,ALUMNO_ASIGNATURA aa 
	WHERE T.IDTITULACION = A.IDTITULACION 
	AND A.IDASIGNATURA = AA.IDASIGNATURA
	GROUP BY T.NOMBRE
	HAVING COUNT(IDALUMNO)>3;
	
	SELECT T.NOMBRE
	FROM TITULACION T
	INNER JOIN  ASIGNATURA a  
	ON T.IDTITULACION = A.IDTITULACION 
	INNER JOIN ALUMNO_ASIGNATURA aa
	ON A.IDASIGNATURA = AA.IDASIGNATURA
	GROUP BY T.NOMBRE
	HAVING COUNT(IDALUMNO)>3;
    /*10. Nombre de cada ciudad junto con el número de personas que viven en ella.*/
	SELECT P.CIUDAD, COUNT(P.DNI )
	FROM PERSONA P
	GROUP BY P.CIUDAD;

    /*11. Nombre de cada profesor junto con el número de asignaturas que imparte.*/
	SELECT P.NOMBRE, COUNT(A.IDASIGNATURA)
	FROM PERSONA p , PROFESOR pR, ASIGNATURA a 
	WHERE P.DNI=PR.DNI 
	AND PR.IDPROFESOR = A.IDPROFESOR 
	GROUP BY P.NOMBRE;
    
    /*12. Nombre de cada profesor junto con el número de alumnos que tiene, para aquellos profesores que tengan dos o más de 2 alumnos.*/
	SELECT P.NOMBRE,COUNT(A.IDALUMNO)
	FROM PERSONA p, ALUMNO A , ALUMNO_ASIGNATURA aa , ASIGNATURA a1,PROFESOR P1
	WHERE P.DNI = P1.DNI 
	AND P1.IDPROFESOR =A1.IDPROFESOR 
	AND A1.IDASIGNATURA = AA.IDASIGNATURA
	AND AA.IDALUMNO = A.IDALUMNO
    GROUP BY P.NOMBRE
    HAVING COUNT(A.IDALUMNO)>2;
    
    SELECT P.NOMBRE,COUNT(A.IDALUMNO)
	FROM PERSONA p
	INNER JOIN PROFESOR P1
	ON P.DNI = P1.DNI 
	INNER JOIN ASIGNATURA a1
	ON P1.IDPROFESOR =A1.IDPROFESOR
	INNER JOIN ALUMNO_ASIGNATURA aa 
	ON A1.IDASIGNATURA = AA.IDASIGNATURA
	INNER JOIN ALUMNO A
	ON AA.IDALUMNO = A.IDALUMNO
    GROUP BY P.NOMBRE
    HAVING COUNT(A.IDALUMNO)>2;
    
    /*13. Obtener el máximo de las sumas de los costesbásicos de cada cuatrimestre*/
  	SELECT A.CUATRIMESTRE, SUM(A.COSTEBASICO) AS SUMA_COSTE
  	FROM ASIGNATURA A
  	GROUP BY A.CUATRIMESTRE
  	ORDER BY SUMA_COSTE DESC;
    
    /*14. Suma del coste de las asignaturas*/
    SELECT SUM(A.COSTEBASICO )
    FROM ASIGNATURA A ;
    
    /*15. ¿Cuántas asignaturas hay?*/
    SELECT COUNT(A.IDASIGNATURA)
    FROM ASIGNATURA a ;
    
    /*16. Coste de la asignatura más cara y de la más barata*/
    SELECT MAX(A.COSTEBASICO),MIN(A.COSTEBASICO)
    FROM ASIGNATURA a ;
    
    /*17. ¿Cuántas posibilidade de créditos de asignatura hay?*/
    SELECT COUNT(A.CREDITOS)
    FROM  ASIGNATURA a ;
    
    /*18. ¿Cuántos cursos hay?*/
    SELECT COUNT(A.CURSO)
    FROM ASIGNATURA a ;
    
    /*19. ¿Cuántas ciudades hau?*/
    SELECT COUNT(P.CIUDAD)
	FROM PERSONA P;
    
    /*20. Nombre y número de horas de todas las asignaturas.*/
    SELECT A.NOMBRE, SUM((A.CREDITOS*10)) AS HORAS
    FROM ASIGNATURA a 
    GROUP BY A.NOMBRE;
    
    /*21. Mostrar las asignaturas que no pertenecen a ninguna titulación.*/
    SELECT A.NOMBRE 
    FROM ASIGNATURA A 
    WHERE A.IDTITULACION IS NULL;
    /*22. Listado del nombre completo de las personas, sus teléfonos y sus direcciones, llamando a la columna 
     * del nombre "NombreCompleto" y a la de direcciones "Direccion".*/
    SELECT P.NOMBRE || ' ' || P.APELLIDO AS NOMBRE_COMPLETO,
    P.TELEFONO, 
    P.DIRECCIONCALLE || ' ' || P.DIRECCIONNUM  AS DIRECCION
    FROM PERSONA P;
    
    /*23. Cual es el día siguiente al día en que nacieron las personas de la B.D.*/
	
    /*24. Años de las personas de la Base de Datos, esta consulta tiene que valor para cualquier momento*/
    
    
    /*25. Listado de personas mayores de 25 años ordenadas por apellidos y nombre, esta consulta tiene que valor  para cualquier momento/*
    */
    SELECT P.NOMBRE, P.APELLIDO, (SYSDATE-P.FECHA_NACIMIENTO) AS EDAD
    FROM PERSONA P
    WHERE EDAD>25
    ORDER BY P.APELLIDO, P.NOMBRE;
    /*26. Nombres completos de los profesores que además son alumnos*/
    SELECT P.NOMBRE, P.APELLIDO
    FROM PERSONA P, PROFESOR p1, ALUMNO a 
    WHERE P.DNI = P1.DNI AND P.DNI=A.DNI;
    
    SELECT P.NOMBRE,P.APELLIDO
    FROM PERSONA P
    INNER JOIN PROFESOR p1
    ON P.DNI=P1.DNI
    INNER JOIN ALUMNO a 
    ON a.DNI = P.DN1;
 
     /*27. Suma de los créditos de las asignaturas de la titulación de Matemáticas*/
    SELECT SUM(A.CREDITOS)
    FROM ASIGNATURA a,TITULACION T
    WHERE A.IDTITULACION=T.IDTITULACION 
    AND T.NOMBRE  LIKE 'Matematicas';
     
    SELECT * FROM TITULACION t ; 
    
    SELECT SUM(A.CREDITOS)
    FROM ASIGNATURA a 
    INNER JOIN TITULACION t 
    ON A.IDTITULACION = T.IDTITULACION
    AND T.IDTITULACION LIKE 'MATEMATICAS';
    
    /*28. Número de asignaturas de la titulación de MaTemáticas*/
    SELECT COUNT(A.CREDITOS)
    FROM ASIGNATURA a,TITULACION T
    WHERE A.IDTITULACION=T.IDTITULACION 
    AND T.NOMBRE  LIKE 'Matematicas';
    
    SELECT COUNT(A.CREDITOS)
    FROM ASIGNATURA a
    INNER JOIN TITULACION T
    ON A.IDTITULACION=T.IDTITULACION 
    AND T.NOMBRE  LIKE 'Matematicas';
     
    /*29. ¿Cuánto paga cada alumno por su matrícula?*/

    
    /*30. ¿Cuántos alumnos hay matriculados en cada asignatura?*/
    SELECT A.IDASIGNATURA, COUNT(AA.IDALUMNO)
    FROM ALUMNO_ASIGNATURA aa , ASIGNATURA a 
    WHERE A.IDASIGNATURA = AA.IDASIGNATURA
    GROUP BY A.IDASIGNATURA;