/* 1.	Descuento medio aplicado en las facturas.*/

SELECT AVG(F.DTO) "DESCUENTO MEDIO"
FROM FACTURAS f;

/* 2.	Descuento medio aplicado en las facturas sin considerar los valores nulos.*/

SELECT AVG(f.DTO) "DESCUENTO MEDIO"
FROM FACTURAS f;
/*AL METER EL CAMPO DENTRO DE LOS PARENTESIS NO NULO*/

/*3.	Descuento medio aplicado en las facturas considerando los valores nulos como cero.*/

SELECT AVG(NVL(f.DTO,0)) "DESCUENTO MEDIO"
FROM FACTURAS f ;

/* 4.	Número de facturas.*/

SELECT COUNT(*)
FROM FACTURAS f ;

/*5.	Número de pueblos de la Comunidad de Valencia.*/

SELECT COUNT(*) AS NUMEROPUEBLOS
FROM PUEBLOS p 
INNER JOIN PROVINCIAS p2 
ON P.CODPRO = P2.CODPRO 
WHERE P2.NOMBRE IN ('VALENCIA','CASTELLON','ALICANTE');

SELECT COUNT(*) AS NUMEROPUEBLOS
FROM PUEBLOS p, PROVINCIAS p2 
WHERE P.CODPRO = P2.CODPRO 
AND P2.NOMBRE IN ('VALENCIA','CASTELLON','ALICANTE');

/*6. Importe total de los artículos que tenemos en el almacén. 
Este importe se calcula sumando el producto 
de las unidades en stock por el precio de cada unidad*/

SELECT SUM(A.STOCK*A.PRECIO) AS IMPORTE
FROM ARTICULOS a;

/*7. Número de pueblos en los que
 *  residen clientes cuyo código postal empieza por ‘12’.*/

SELECT COUNT(P.CODPUE)
FROM PUEBLOS p , CLIENTES C
WHERE P.CODPUE = C.CODPUE
AND C.CODPOSTAL LIKE '12%';

SELECT COUNT(P.CODPUE)
FROM PUEBLOS p 
INNER JOIN CLIENTES C
ON P.CODPUE = C.CODPUE
AND C.CODPOSTAL LIKE '12%';

/*8. Valores máximo y mínimo del stock de los artículos
 *  cuyo precio oscila entre 9 y 12 € y diferencia entre ambos valores*/

SELECT MAX(A.STOCK), MIN(A.STOCK),
MAX(A.STOCK)-MIN(A.STOCK) "DIFERENCIA MAX Y MIN"
FROM ARTICULOS a
WHERE A.PRECIO BETWEEN 9 AND 12;

/*9. Precio medio de los artículos cuyo stock supera las 10 unidades.*/

SELECT AVG(A.PRECIO)
FROM ARTICULOS a
WHERE A.STOCK > 10; 

/*10. Fecha de la primera y la última factura del cliente con código 210.*/

SELECT MAX(F.FECHA), MIN(F.FECHA)
FROM FACTURAS f
WHERE  f.CODCLI = 210;

/*11. Número de artículos cuyo stock es nulo.*/

SELECT COUNT(*)
FROM ARTICULOS a 
WHERE A.STOCK IS NULL;

/*12. Número de líneas cuyo descuento es nulo (con un decimal)*/

SELECT COUNT(*) 
FROM LINEAS_FAC lf 
WHERE LF.DTO IS NULl;

SELECT TO_CHAR(COUNT(NOMBRE DE LA COLUMNA),'999.9') FROM DUAL;

/*13. Obtener cuántas facturas tiene cada cliente.*/

SELECT COUNT(F.CODFAC)
FROM FACTURAS f 
GROUP BY CODCLI;


/*14. Obtener cuántas facturas 
 * tiene cada cliente, pero sólo si 
 * tiene dos o más  facturas.*/

SELECT C.NOMBRE,COUNT(F.CODCLI)
FROM FACTURAS f 
GROUP BY CODCLI
HAVING COUNT(F.CODCLI)>=2;

/*15. Importe de la facturación 
 * (suma del producto de la cantidad por el precio de las 
 * líneas de factura) de los  artículos*/

SELECT SUM(LF.CANT * LF.PRECIO) "IMPORTE DE FACTURACION"
FROM LINEAS_FAC lf;

/*16. Importe de la facturación 
 * (suma del producto de la cantidad por el precio de las líneas de factura) 
 * de aquellos artículos cuyo código contiene la letra “A” 
 * (bien mayúscula o minúscula).*/

SELECT SUM(LF.CANT * LF.PRECIO) "IMPORTE DE FACTURACION"
FROM LINEAS_FAC lf
WHERE UPPER(LF.CODART) LIKE '%A%';

/*17. Número de facturas para cada fecha, 
 * junto con la fecha*/

SELECT F.FECHA ,COUNT(*)
FROM FACTURAS f 
GROUP BY F.FECHA;

/*18. Obtener el número de clientes del pueblo 
 * junto con el nombre del pueblo mostrando 
 * primero los pueblos que más clientes tengan.*/

SELECT COUNT(*), P.NOMBRE
FROM PUEBLOS p 
JOIN CLIENTES c 
ON C.CODPUE = P.CODPUE
GROUP BY P.NOMBRE
ORDER BY COUNT(*) DESC;

SELECT COUNT(*), P.NOMBRE
FROM PUEBLOS p, CLIENTES c 
WHERE C.CODPUE = P.CODPUE
GROUP BY P.NOMBRE
ORDER BY COUNT(*) DESC;

/*19. Obtener el número de clientes del pueblo
 *  junto con el nombre del pueblo mostrando primero
 *  los pueblos que más clientes tengan, siempre y cuando 
 * tengan más de dos clientes.*/

SELECT COUNT(*), P.NOMBRE
FROM PUEBLOS p 
JOIN CLIENTES c 
ON C.CODPUE = P.CODPUE
GROUP BY P.NOMBRE
HAVING COUNT(*)>2
ORDER BY COUNT(*) DESC;

SELECT COUNT(*), P.NOMBRE
FROM PUEBLOS p, CLIENTES c 
WHERE C.CODPUE = P.CODPUE
GROUP BY P.NOMBRE
HAVING COUNT(*)>2
ORDER BY COUNT(*) DESC;

/*20.	Cantidades totales vendidas para 
 * cada artículo cuyo código empieza por “P",
 *  mostrando también la descripción de dicho artículo.
 * 9.-	Precio máximo y precio mínimo de venta
 *  (en líneas de facturas) para cada artículo cuyo
 *  código empieza por “c”.*/

SELECT SUM(LF.CANT), a.DESCRIP 
FROM ARTICULOS a , LINEAS_FAC lf 
WHERE a.CODART LIKE 'P%' 
AND LF.CODART = A.CODART
GROUP BY a.DESCRIP 


SELECT SUM(LF.CANT), a.DESCRIP 
FROM ARTICULOS a 
INNER JOIN LINEAS_FAC lf 
ON a.CODART LIKE 'P%' 
AND LF.CODART = A.CODART
GROUP BY a.DESCRIP 

/*21.	Igual que el anterior pero mostrando 
 * también la diferencia entre el precio máximo y mínimo.*/

SELECT SUM(LF.CANT), a.DESCRIP, (MAX(LF.PRECIO)-MIN(LF.PRECIO))AS DIFERENCIA
FROM ARTICULOS a , LINEAS_FAC lf 
WHERE a.CODART LIKE 'P%' 
AND LF.CODART = A.CODART
GROUP BY a.DESCRIP ;

SELECT * FROM LINEAS_FAC lf ;

SELECT SUM(LF.CANT), a.DESCRIP 
FROM ARTICULOS a 
INNER JOIN LINEAS_FAC lf 
ON a.CODART LIKE 'P%' 
AND LF.CODART = A.CODART
GROUP BY a.DESCRIP 

/*22.	Nombre de aquellos artículos de los 
 * que se ha facturado más de 10000 euros.*/

SELECT A.DESCRIP FROM LINEAS_FAC lf 
JOIN ARTICULOS a ON A.CODART = LF.CODART
HAVING SUM(LF.PRECIO * LF.CANT) > 10000
GROUP BY A.DESCRIP;

/*23.	Número de facturas de cada uno de los
 *  clientes cuyo código está entre 150 y 300 
 * (se debe mostrar este código), 
 * con cada IVA distinto que se les ha aplicado.*/
SELECT DISTINCT f.CODCLI, f.IVA, COUNT(f.CODFAC) AS total_facturas FROM FACTURAS f
JOIN CLIENTES c ON f.CODCLI = c.CODCLI
WHERE f.CODCLI BETWEEN 150 AND 300
GROUP BY f.CODCLI, f.IVA;

/*24.	Media del importe de las facturas, sin tener en cuenta impuestos ni descuentos.*/

SELECT AVG(SUM(lf.PRECIO*LF.CANT))
FROM LINEAS_FAC lf
GROUP BY lf.CODFAC ;

