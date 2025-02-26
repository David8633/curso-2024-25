--    1. Cuantos costes básicos hay.
	SELECT COUNT(A.COSTEBASICO) FROM ASIGNATURA a ;
  /*  2. Para cada titulación mostrar el número de asignaturas que hay junto con el nombre de la titulación.*/
	SELECT T.IDTITULACION,T.NOMBRE ,COUNT(A.IDASIGNATURA)
	FROM TITULACION T, ASIGNATURA A
	
	
    /*3. Para cada titulación mostrar el nombre de la titulación junto con el precio total de todas sus asignaturas.*/

    /*4. Cual sería el coste global de cursar la titulación de Matemáticas si el coste de cada asignatura fuera incrementado en un 7%. */

    /*5. Cuantos alumnos hay matriculados en cada asignatura, junto al id de la asignatura. */

    /*6. Igual que el anterior pero mostrando el nombre de la asignatura.*/

    /*7. Mostrar para cada alumno, el nombre del alumno junto con lo que tendría que pagar por el total de todas las asignaturas en las que está matriculada. Recuerda que el precio de la matrícula tiene un incremento de un 10% por cada año en el que esté matriculado.*/ 

    /*8. Coste medio de las asignaturas de cada titulación, para aquellas titulaciones en el que el coste total de la 1ª matrícula sea mayor que 60 euros. */

    /*9. Nombre de las titulaciones  que tengan más de tres alumnos.*/

    /*10. Nombre de cada ciudad junto con el número de personas que viven en ella.*/

    /*11. Nombre de cada profesor junto con el número de asignaturas que imparte.*/

    /*12. Nombre de cada profesor junto con el número de alumnos que tiene, para aquellos profesores que tengan dos o más de 2 alumnos.*/

    /*13. Obtener el máximo de las sumas de los costesbásicos de cada cuatrimestre*/

    /*14. Suma del coste de las asignaturas*/
    /*15. ¿Cuántas asignaturas hay?*/
    /*16. Coste de la asignatura más cara y de la más barata*/
    /*17. ¿Cuántas posibilidade de créditos de asignatura hay?*/
    /*18. ¿Cuántos cursos hay?*/
    /*19. ¿Cuántas ciudades hau?*/
    /*20. Nombre y número de horas de todas las asignaturas.*/
    /*21. Mostrar las asignaturas que no pertenecen a ninguna titulación.*/
    /*22. Listado del nombre completo de las personas, sus teléfonos y sus direcciones, llamando a la columna del nombre "NombreCompleto" y a la de direcciones "Direccion".*/
    /*23. Cual es el día siguiente al día en que nacieron las personas de la B.D.*/
    /*24. Años de las personas de la Base de Datos, esta consulta tiene que valor para cualquier momento*/
    /*25. Listado de personas mayores de 25 años ordenadas por apellidos y nombre, esta consulta tiene que valor para cualquier momento/*
    /*26. Nombres completos de los profesores que además son alumnos*/
    /*27. Suma de los créditos de las asignaturas de la titulación de Matemáticas*/
    /*28. Número de asignaturas de la titulación de MaTemáticas*/
    /*29. ¿Cuánto paga cada alumno por su matrícula?*/
    /*30. ¿Cuántos alumnos hay matriculados en cada asignatura?*/

