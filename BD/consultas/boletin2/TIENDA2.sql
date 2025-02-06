/*1. Mostrar el nombre de los clientes junto al nombre de su pueblo.*/
SELECT C.CODPUE FROM CLIENTES c JOIN PUEBLOS p ON C.CODPUE = P.CODPUE;
SELECT C.CODPUE FROM CLIENTES c,PUEBLOS p WHERE C.CODPUE=P.CODPUE; 
/*2. Mostrar el nombre de los pueblos junto con el nombre de la provincia correspondiente. */
SELECT CODPUE FROM PUEBLOS P, PROVINCIAS p2 WHERE P.CODPRO = P2.CODPRO ;
SELECT CODPUE FROM PUEBLOS p JOIN PROVINCIAS p2  ON P.CODPRO = P2.CODPRO;
/*3. Mostrar el nombre de los clientes junto al nombre de su pueblo y el de su provincia.*/
SELECT C.NOMBRE,P2.CODPRO ,P.NOMBRE FROM CLIENTES C,PUEBLOS p,PROVINCIAS p2 WHERE C.CODPUE=P.CODPRO AND P.CODPRO=P2.CODPRO;
SELECT C.NOMBRE,P2.CODPRO, P.NOMBRE FROM CLIENTES c JOIN PUEBLOS p ON C.CODPUE = P.CODPUE JOIN PROVINCIAS p2 ON P.CODPRO = P2.CODPRO ;
/*4. Nombre de las provincias donde residen clientes sin que salgan valores repetidos.*/
SELECT DISTINCT P2.NOMBRE FROM PROVINCIAS P2,PUEBLOS p,CLIENTES C WHERE P2.CODPRO = P.CODPRO AND P.CODPUE = C.CODPUE;
SELECT DISTINCT P2.NOMBRE FROM PROVINCIAS p2 JOIN PUEBLOS P ON P2.CODPRO = P.CODPRO JOIN CLIENTES C ON P.CODPUE =C.CODPUE ;
/*5. Mostrar la descripción de los artículos que se han vendido en una cantidad superior
    a 10 unidades. Si un artículo se ha vendido más de una vez en una cantidad superior a 10 sólo debe salir una vez.*/
SELECT DISTINCT A.DESCRIP FROM ARTICULOS a,LINEAS_FAC lf WHERE A.CODART = LF.CODART AND LF.CANT >10;
SELECT DISTINCT A.DESCRIP FROM ARTICULOS a JOIN LINEAS_FAC lf ON A.CODART = LF.CODART AND LF.CANT >10;