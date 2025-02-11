
/*1. Mostrar el nombre de los clientes junto al nombre de su pueblo.*/
SELECT C.CODPUE,p.NOMBRE  FROM CLIENTES c JOIN PUEBLOS p ON C.CODPUE = P.CODPUE;
SELECT C.CODPUE,p.NOMBRE  FROM CLIENTES c,PUEBLOS p WHERE C.CODPUE=P.CODPUE; 
/*2. Mostrar el nombre de los pueblos junto con el nombre de la provincia correspondiente. */
SELECT CODPUE FROM PUEBLOS P, PROVINCIAS p2 WHERE P.CODPRO = P2.CODPRO ;
SELECT CODPUE FROM PUEBLOS p JOIN PROVINCIAS p2  ON P.CODPRO = P2.CODPRO;
/*3. Mostrar el nombre de los clientes junto al nombre de su pueblo y el de su provincia.*/
SELECT C.NOMBRE,P2.CODPRO ,P.NOMBRE FROM CLIENTES C,PUEBLOS p,PROVINCIAS p2 WHERE C.CODPUE=P.CODPUE  AND P.CODPRO=P2.CODPRO;
SELECT C.NOMBRE,P2.CODPRO, P.NOMBRE FROM CLIENTES c JOIN PUEBLOS p ON C.CODPUE = P.CODPUE JOIN PROVINCIAS p2 ON P.CODPRO = P2.CODPRO ;
/*4. Nombre de las provincias donde residen clientes sin que salgan valores repetidos.*/
SELECT DISTINCT P2.NOMBRE FROM PROVINCIAS P2,PUEBLOS p,CLIENTES C WHERE P2.CODPRO = P.CODPRO AND P.CODPUE = C.CODPUE;
SELECT DISTINCT P2.NOMBRE FROM PROVINCIAS p2 JOIN PUEBLOS P ON P2.CODPRO = P.CODPRO JOIN CLIENTES C ON P.CODPUE =C.CODPUE ;
/*5. Mostrar la descripción de los artículos que se han vendido en una cantidad superior
    a 10 unidades. Si un artículo se ha vendido más de una vez en una cantidad superior a 10 sólo debe salir una vez.*/
SELECT DISTINCT A.DESCRIP FROM ARTICULOS a,LINEAS_FAC lf WHERE A.CODART = LF.CODART AND LF.CANT >10;
SELECT DISTINCT A.DESCRIP FROM ARTICULOS a JOIN LINEAS_FAC lf ON A.CODART = LF.CODART AND LF.CANT >10;
/*6. Mostrar la fecha de factura junto con el código del artículo y la cantidad vendida por cada artículo vendido en alguna factura.
 *  Los datos deben salir ordenado por fecha, primero las más reciente, luego por el código del artículos, y si el mismo artículo 
 * se ha vendido varias veces en la misma fecha los más vendidos  primero.*/
SELECT F.FECHA , A.CODART, LF.CANT 
FROM ARTICULOS a 
INNER JOIN LINEAS_FAC lf 
ON A.CODART = LF.CODART 
INNER JOIN FACTURAS f 
ON LF.CODFAC = F.CODFAC 
ORDER BY F.FECHA ASC, LF.CODART ASC, LF.CANT ASC;

SELECT F.FECHA,A.CODART,LF.CANT 
FROM ARTICULOS a ,LINEAS_FAC lf ,FACTURAS f 
WHERE A.CODART = LF.CODART 
AND LF.CODFAC = F.CODFAC 
ORDER BY F.FECHA ASC, LF.CODART ASC, LF.CANT ASC;
/*7. Mostrar el código de factura y la fecha de las mismas de las facturas que se han facturado a un cliente que tenga en su código postal un 7.*/
SELECT F.CODFAC, F.FECHA  
FROM FACTURAS f  
INNER JOIN CLIENTES c
ON F.CODCLI =C.CODCLI
AND C.CODPOSTAL LIKE '%7%';

SELECT F.CODFAC, f.fecha
FROM FACTURAS f, CLIENTES C
WHERE F.CODCLI = C.CODCLI
AND C.CODPOSTAL LIKE '%7%';

/*Mostrar el código de factura, la fecha y el nombre del cliente de todas las facturas existentes en la base de datos.*/
SELECT F.CODFAC,F.FECHA , C.NOMBRE 
FROM FACTURAS f
INNER JOIN CLIENTES c 
ON C.CODCLI = F.CODCLI ;

SELECT F.CODFAC, F.FECHA , C.NOMBRE
FROM FACTURAS f, CLIENTES C
WHERE F.CODCLI = C.CODCLI ;

/* Mostrar un listado con el código de la factura, la fecha, el iva, el dto y el nombre del cliente para aquellas facturas 
 * que o bien no se le ha cobrado iva (no se ha cobrado iva si el iva es nulo o cero), o bien el descuento es nulo.*/
SELECT  F.CODFAC , F.FECHA , F.IVA , F.DTO , C.CODCLI 
FROM FACTURAS F
INNER JOIN CLIENTES c 
ON F.CODCLI = C.CODCLI 
AND NVL(IVA,0) = 0
OR F.DTO IS NULL;

SELECT  F.CODFAC , F.FECHA , F.IVA , F.DTO , C.CODCLI 
FROM FACTURAS F ,CLIENTES c 
WHERE F.CODCLI = C.CODCLI 
AND NVL(F.IVA,0) = 0
OR F.DTO IS NULL;

/* Se quiere saber que artículos se han vendido más baratos que el precio que actualmente tenemos almacenados en la tabla 
 * de artículos, para ello se necesita mostrar la descripción de los artículos junto con el precio actual. Además deberá 
 * aparecer el precio en que se vendió si este precio es inferior al precio original.*/
SELECT LF.PRECIO, A.DESCRIP, A.PRECIO 
FROM ARTICULOS a 
INNER JOIN LINEAS_FAC lf 
ON A.CODART = LF.CODART 
WHERE LF.PRECIO < A.PRECIO ;

SELECT LF.PRECIO, A.DESCRIP, A.PRECIO 
FROM ARTICULOS a ,LINEAS_FAC lf 
WHERE A.CODART = LF.CODART 
AND LF.PRECIO < A.PRECIO ;

/*Mostrar el código de las facturas, junto a la fecha, iva y descuento. También debe aparecer la descripción de los
 *  artículos vendido junto al precio de venta, la cantidad y el descuento de ese artículo, para todos los artículos que 
 * se han vendido.*/
SELECT F.CODFAC,F.FECHA,F.IVA,F.DTO,LF.CODART,LF.CANT,LF.DTO  
FROM LINEAS_FAC lf 
INNER JOIN FACTURAS f   
ON F.CODFAC = LF.CODFAC 
INNER JOIN ARTICULOS a 
ON LF.CODART = A.CODART ;

SELECT F.CODFAC,F.FECHA,F.IVA,F.DTO,LF.CODART,LF.CANT,LF.DTO  
FROM LINEAS_FAC lf, FACTURAS f, ARTICULOS a 
WHERE F.CODFAC = LF.CODFAC 
AND LF.CODART = A.CODART ;

/*Igual que el anterior, pero mostrando también el nombre del cliente al que se le ha vendido el artículo.*/
SELECT F.CODFAC,F.FECHA,F.IVA,F.DTO,LF.CODART,LF.CANT,LF.DTO  
FROM LINEAS_FAC lf 
INNER JOIN FACTURAS f   
ON F.CODFAC = LF.CODFAC 
INNER JOIN ARTICULOS a 
ON LF.CODART = A.CODART 
INNER JOIN CLIENTES C
ON F.CODCLI  = C.CODCLI ;

SELECT F.CODFAC,F.FECHA,F.IVA,F.DTO,LF.CODART,LF.CANT,LF.DTO  
FROM LINEAS_FAC lf , FACTURAS f, ARTICULOS a ,CLIENTES C 
WHERE F.CODFAC = LF.CODFAC 
AND LF.CODART = A.CODART 
AND F.CODCLI  = C.CODCLI ;

/*Mostrar los nombres de los clientes que viven en una provincia que contenga la letra ma.*/
SELECT C.NOMBRE 
FROM CLIENTES C
INNER JOIN PUEBLOS p 
ON C.CODPUE = P.CODPUE 
INNER JOIN PROVINCIAS p2 
ON P.CODPRO = P2.CODPRO ;

SELECT C.NOMBRE 
FROM CLIENTES C, PUEBLOS p , PROVINCIAS p2
WHERE C.CODPUE = P.CODPUE 
AND P.CODPRO = P2.CODPRO ;

/*Mostrar el código del cliente al que se le ha vendido un artículo que tienen un stock menor al stock mínimo.*/
SELECT C.CODCLI
FROM CLIENTES C
INNER JOIN FACTURAS f 
ON C.CODCLI = F.CODCLI
INNER JOIN LINEAS_FAC lf 
ON F.CODFAC = LF.CODFAC 
INNER JOIN ARTICULOS A 
ON LF.CODART = A.CODART;

SELECT C.CODCLI
FROM CLIENTES C, FACTURAS f,LINEAS_FAC lf ,ARTICULOS A 
WHERE C.CODCLI = F.CODCLI
AND F.CODFAC = LF.CODFAC
AND LF.CODART = A.CODART;
/*Mostrar el nombre de todos los artículos que se han vendido alguna vez. (no deben salir valores repetidos)*/
SELECT DISTINCT A.DESCRIP 
FROM ARTICULOS a 
INNER JOIN LINEAS_FAC lf 
ON A.CODART = LF.CODART 
WHERE LF.CANT >0;

SELECT DISTINCT A.DESCRIP
FROM ARTICULOS A , LINEAS_FAC lf 
WHERE A.CODART = LF.CODART 
AND LF.CANT>0;

/*Se quiere saber el precio real al que se ha vendido cada vez los artículos. Para ello es necesario mostrar 
 * el nombre del artículo, junto con el precio de venta (no el que está almacenado en la tabla de artículos) 
 * menos el descuento aplicado en la línea de descuento.*/

SELECT LF.PRECIO-LF.DTO, A.DESCRIP 
FROM LINEAS_FAC lf 
INNER JOIN ARTICULOS A
ON A.CODART= LF.CODART ;

SELECT LF.PRECIO-LF.DTO, A.DESCRIP
FROM LINEAS_FAC lf , ARTICULOS a 
WHERE A.CODART = LF.CODART ;

/*Mostrar el nombre de los artículos que se han vendido a clientes que vivan en una provincia cuyo nombre termina  por a.*/
SELECT A.DESCRIP  FROM ARTICULOS a 
INNER JOIN LINEAS_FAC lf 
ON A.CODART = LF.CODART 
INNER JOIN FACTURAS f 
ON LF.CODFAC = F.CODFAC 
INNER JOIN CLIENTES c 
ON F.CODCLI = F.CODCLI 
WHERE C.CODPOSTAL LIKE '%A';

SELECT A.DESCRIP 
FROM ARTICULOS a , LINEAS_FAC lf ,FACTURAS f ,CLIENTES C
WHERE A.CODART = LF.CODART
AND LF.CODFAC = F.CODFAC
AND C.CODCLI = F.CODCLI 
AND C.CODPOSTAL LIKE '%A';

/*Mostrar el nombre de los clientes sin que salgan repetidos a los que se les ha hecho un descuento superior al 10% en alguna de sus facturas.*/
SELECT DISTINCT C.NOMBRE 
FROM CLIENTES C
INNER JOIN FACTURAS f 
ON C.CODCLI = F.CODCLI 
AND F.DTO > 10;

SELECT DISTINCT C.NOMBRE 
FROM CLIENTES C,FACTURAS f 
WHERE C.CODCLI = F.CODCLI 
AND F.DTO > 10;

/*Mostrar el nombre de los clientes sin que salgan repetidos a los que se les ha hecho un descuento superior al 10% en alguna de sus facturas
 *  o en alguna de las líneas que componen la factura o en ambas.*/
SELECT DISTINCT C.NOMBRE 
FROM CLIENTES C
INNER JOIN FACTURAS f 
ON C.CODCLI = F.CODCLI 
AND F.DTO > 10 
INNER JOIN LINEAS_FAC lf 
;

SELECT DISTINCT C.NOMBRE 
FROM CLIENTES C,FACTURAS f 
WHERE C.CODCLI = F.CODCLI 
AND F.DTO > 10;

/*Mostrar la descripción, la cantidad y el precio de venta de los artículos vendidos al cliente con nombre MARIA MERCEDES*/
SELECT A.DESCRIOP , LF.CANT, F.PRECIO , C.NOMBRE 
FROM CLIENTES c,ARTICULOS,
