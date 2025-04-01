

    --1. Mostrar el identificador de los alumnos matriculados en cualquier asignatura excepto la '150212' y la '130113'.
	SELECT aa.IDALUMNO  FROM ALUMNO_ASIGNATURA aa
WHERE aa.IDASIGNATURA !='150212'
AND aa.IDASIGNATURA !='130113';
    
    SELECT A.IDALUMNO  FROM ALUMNO a
    INNER JOIN ALUMNO_ASIGNATURA aa 
	ON AA.IDALUMNO = A.IDALUMNO
	AND AA.NUMEROMATRICULA IS NOT NULL;
    
--    2. Mostrar el nombre de las asignaturas que tienen más créditos que "Seguridad Vial". 
		SELECT A.NOMBRE FROM ASIGNATURA a
		WHERE A.CREDITOS > (SELECT A1.CREDITOS FROM ASIGNATURA a1 
							WHERE A1.NOMBRE LIKE 'Seguridad Vial');


   -- 3. Obtener el Id de los alumnos matriculados en las asignaturas "150212" y "130113" a la vez. 
			SELECT AA.IDALUMNO FROM ALUMNO_ASIGNATURA aa 
			WHERE AA.IDALUMNO IN (SELECT AA1.IDALUMNO FROM ALUMNO_ASIGNATURA aa1 
									WHERE AA.IDASIGNATURA = '150212') 
   		      AND AA.IDALUMNO IN
   									(SELECT AA2.IDALUMNO FROM ALUMNO_ASIGNATURA aa2
									WHERE AA2.IDASIGNATURA = '130113');

   SELECT AA1.IDALUMNO 
   FROM ALUMNO_ASIGNATURA aa1 
   WHERE AA1.IDASIGNATURA = '150212'
   INTERSECT 
   SELECT AA2.IDALUMNO
   FROM ALUMNO_ASIGNATURA aa2
   WHERE AA2.IDASIGNATURA = '130113';
   
   
   
   	SELECT * FROM ALUMNO_ASIGNATURA aa 
    --4. Mostrar el Id de los alumnos matriculados en las asignatura "150212" ó "130113", en una o en otra pero no en ambas a la vez. 
	
	SELECT a.IDALUMNO
	FROM ALUMNO a, ALUMNO_ASIGNATURA aa3 
	WHERE a.IDALUMNO NOT IN (SELECT aa.IDALUMNO
						FROM ALUMNO_ASIGNATURA aa, ALUMNO_ASIGNATURA aa2
						WHERE aa.IDALUMNO = aa2.IDALUMNO
						AND aa.IDASIGNATURA != aa2.IDASIGNATURA
						AND aa.IDASIGNATURA = '150212'
						AND aa2.IDASIGNATURA = '130113')
	AND aa3.IDALUMNO = a.IDALUMNO 
	AND aa3.IDASIGNATURA IN ('150212', '130113');

			
    --5. Mostrar el nombre de las asignaturas de la titulación "130110" cuyos costes básicos sobrepasen el coste básico promedio por asignatura en esa titulación.
			SELECT A.NOMBRE
			FROM ASIGNATURA a
			WHERE A.IDTITULACION = '130110'
			AND A.COSTEBASICO >= ( SELECT AVG(A1.COSTEBASICO) 
								  FROM ASIGNATURA a1
   								  WHERE A1.IDTITULACION = '130110');

    SELECT * FROM ASIGNATURA a ;
    
   
   				
    --6. Mostrar el identificador de los alumnos matriculados en cualquier asignatura excepto la "150212" y la "130113”
    
    SELECT AA.IDALUMNO ,AA.IDASIGNATURA 
    FROM ALUMNO_ASIGNATURA aa
    WHERE AA.IDALUMNO NOT IN(SELECT AA2.IDALUMNO 
    						 FROM ALUMNO_ASIGNATURA aa2
    						 WHERE AA2.IDASIGNATURA  IN ('150212','130113'));

    --7. Mostrar el Id de los alumnos matriculados en la asignatura "150212" pero no en la "130113". 
	SELECT aa.IDALUMNO 
	FROM ALUMNO_ASIGNATURA aa 
	WHERE AA.IDALUMNO NOT IN(SELECT AA2.IDALUMNO 
							 FROM ALUMNO_ASIGNATURA aa2
							 WHERE AA2.IDASIGNATURA = '130113' )
    AND AA.IDALUMNO IN(SELECT AA2.IDALUMNO 
							 FROM ALUMNO_ASIGNATURA aa2
							 WHERE AA2.IDASIGNATURA = '150212' );
    	
    
    --8. Mostrar el nombre de las asignaturas que tienen más créditos que "Seguridad Vial". 

    SELECT A.NOMBRE
    FROM ASIGNATURA a 
    WHERE A.CREDITOS > (SELECT A2.CREDITOS
    					FROM ASIGNATURA a2
    					WHERE A2.NOMBRE LIKE 'Seguridad Vial');
    
    --9. Mostrar las personas que no son ni profesores ni alumnos.

    SELECT P.NOMBRE,P.APELLIDO 
    FROM PERSONA p 
    WHERE P.DNI NOT IN (SELECT PR.DNI
    					FROM PROFESOR PR)
    AND P.DNI NOT IN(SELECT AL.DNI
    				 FROM ALUMNO AL);
    
    --10. Mostrar el nombre de las asignaturas que tengan más créditos. 

    SELECT A.NOMBRE
    FROM ASIGNATURA a
    WHERE A.CREDITOS > (SELECT MIN(A2.CREDITOS)
    					FROM ASIGNATURA A2);
   
    
    --11. Lista de asignaturas en las que no se ha matriculado nadie.
    
    SELECT A.NOMBRE
    FROM ASIGNATURA a
    WHERE A.IDASIGNATURA NOT IN (SELECT AA.IDASIGNATURA 
    							FROM ALUMNO_ASIGNATURA aa );

    --12. Ciudades en las que vive algún profesor y también algún alumno. 
    SELECT PR.DNI 
    FROM PERSONA p , PROFESOR PR
    WHERE P.DNI=PR.DNI
   	AND P.CIUDAD IN(SELECT P.CIUDAD
   					FROM ALUMNO AL,PERSONA P
   					WHERE AL.DNI = P.DNI);
