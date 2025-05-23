/*1. Descuento medio aplicado en las facturas.*/
	SELECT AVG(f.DTO ) FROM FACTURAS f ;
/*2. Descuento medio aplicado en las facturas sin considerar los valores nulos.*/

	SELECT AVG(F.DTO) FROM FACTURAS F ;--POR DEFECTO COGE LOS NO NULOS 
	
/*3.Descuento medio aplicado en las facturas considerando los valores nulos como cero.*/

	SELECT AVG(NVL(F.DTO,0)) FROM FACTURAS F ;
	
/*4. Número de facturas.*/
	
	SELECT COUNT(*) FROM FACTURAS f ;

/*5.Número de pueblos de la Comunidad de Valencia.*/
	
	SELECT COUNT(*)
	FROM PUEBLOS p
	INNER JOIN PROVINCIAS p2
	ON p.CODPRO = P2.CODPRO 
	WHERE P2.NOMBRE LIKE 'VALENCIA';
	
	
	SELECT COUNT(*)
	FROM PUEBLOS p,PROVINCIAS p2
	WHERE p.CODPRO = P2.CODPRO 
	AND P2.NOMBRE LIKE 'VALENCIA';
	
/*6. Importe total de los artículos que tenemos en el almacén. Este importe se calcula sumando el 
 * producto de las unidades en stock por el precio de cada unidad*/

	SELECT SUM(A.STOCK*A.PRECIO) AS IMPORTE FROM  ARTICULOS a ;
	
/* 7. Número de pueblos en los que residen clientes cuyo código postal empieza por ‘12’.*/
	
	SELECT COUNT(*) FROM CLIENTES c 
	WHERE c.CODPOSTAL LIKE '%12';
	
	/*8. Valores máximo y mínimo del stock de los artículos cuyo precio oscila entre 9 y 12 € y diferencia entre ambos valores*/
	
	SELECT MAX(A.STOCK),MIN(A.STOCK),(MAX(A.STOCK)-MIN(A.STOCK))
	AS DIFERENCIA FROM ARTICULOS A 
	WHERE A.PRECIO BETWEEN 9 AND 12;
	
	/*9.Precio medio de los artículos cuyo stock supera las 10 unidades.*/
	SELECT AVG(A.PRECIO) FROM ARTICULOS a  
	WHERE A.STOCK >10;.
	
	/*10.Fecha de la primera y la última factura del cliente con código 210.*/
	SELECT MAx(F.FECHA),MIN(F.FECHA)  
	FROM FACTURAS F,CLIENTES C 
	WHERE F.CODCLI=C.CODCLI 
	AND F.CODCLI LIKE 210; 
	
	SELECT MAx(F.FECHA),MIN(F.FECHA)  
	FROM FACTURAS F
	INNER JOIN CLIENTES C 
	ON F.CODCLI=C.CODCLI 
	AND F.CODCLI LIKE 210; 
	
	/*11. Número de artículos cuyo stock es nulo.*/
	SELECT COUNT(*) FROM ARTICULOS A 
	WHERE A.STOCK IS NULL;
	
	/*12. Número de líneas cuyo descuento es nulo (con un decimal)*/
	 SELECT COUNT(*) FROM LINEAS_FAC lf WHERE LF.DTO IS NULL;
	
	/*13. Obtener cuántas facturas tiene cada cliente.*/
	SELECT COUNT(*) FROM FACTURAS f, CLIENTES c WHERE F.CODCLI = C.CODCLI; 
	SELECT COUNT(*) FROM FACTURAS F INNER JOIN CLIENTES C ON  F.CODCLI = C.CODCLI; 
 	/*14. Obtener cuántas facturas tiene cada cliente, pero sólo si tiene dos o más  facturas.*/
SELECT COUNT(*) 
FROM FACTURAS f, CLIENTES c,LINEAS_FAC lf  
WHERE F.CODCLI = C.CODCLI 
AND F.CODFAC = LF.CODFAC 
AND LF.CANT >=2 ;


SELECT COUNT(*) 
FROM FACTURAS F 
INNER JOIN CLIENTES C 
ON  F.CODCLI = C.CODCLI 
INNER JOIN LINEAS_FAC lf 
ON F.CODFAC = LF.CODFAC
AND LF.CANT >=2; 
	
	/*15. Importe de la facturación (suma del producto de la cantidad por el precio de las líneas de factura) de los  artículos*/
	SELECT SUM(LF.CANT * LF.PRECIO) AS IMPORTE 
	FROM LINEAS_FAC lf, ARTICULOS A
	WHERE LF.CODART = A.CODART;
	
	SELECT SUM(LF.CANT * LF.PRECIO) FROM LINEAS_FAC lf 
	INNER JOIN ARTICULOS A 
	ON LF.CODART=A.CODART;
	
	/*16. Importe de la facturación (suma del producto de la cantidad por el precio de las líneas de factura) de aquellos artículos 
	 *    cuyo código contiene la letra “A” (bien mayúscula o minúscula).*/
	SELECT SUM(LF.CANT*LF.PRECIO) AS IMPORTE FROM LINEAS_FAC lf , ARTICULOS A
	WHERE LF.CODART = A.CODART 
	AND A.DESCRIP LIKE '%A%';
	
	SELECT SUM(LF.CANT * LF.PRECIO) AS IMPORT FROM LINEAS_FAC lf 
	INNER JOIN ARTICULOS A 
	ON LF.CODART = A.CODART
	AND A.DESCRIP LIKE '%A%';
	/*17. Número de facturas para cada fecha, junto con la fecha*/
	SELECT FECHA, COUNT(CODFAC) AS CANTIDAD_FACTURAS
	FROM FACTURAS 
	GROUP BY FECHA
	ORDER BY FECHA;
		
	/*18. Obtener el número de clientes del pueblo junto con el nombre del pueblo mostrando primero los pueblos que más clientes tengan.*/
	SELECT P.NOMBRE ,COUNT(C.CODCLI) AS NUMEROCLIENTES
	FROM PUEBLOS P,CLIENTES C
	WHERE P.CODPUE = C.CODPUE
	GROUP BY P.NOMBRE
	ORDER BY NUMEROCLIENTES  DESC;
	
	SELECT P.NOMBRE ,COUNT(C.CODCLI) AS NUMEROCLIENTES
	FROM PUEBLOS P
	INNER JOIN CLIENTES C
	ON P.CODPUE = C.CODPUE
	GROUP BY P.NOMBRE
	ORDER BY NUMEROCLIENTES  DESC;
	
	/*19. Obtener el número de clientes del pueblo junto con el nombre del pueblo mostrando primero los pueblos que más clientes tengan, 
	 *    siempre y cuando tengan más de dos clientes.*/
	SELECT COUNT(C.CODCLI) AS NUMEROCLIENTES, P.NOMBRE 
	FROM CLIENTES C, PUEBLOS p 
	WHERE C.CODPUE = P.CODPUE
	GROUP BY P.NOMBRE
	HAVING COUNT(C.CODCLI) >2
	ORDER BY NUMEROCLIENTES DESC;
	
	SELECT COUNT(C.CODCLI) AS NUMEROCLIENTES, P.NOMBRE 
	FROM CLIENTES C
	INNER JOIN PUEBLOS p 
	ON C.CODPUE = P.CODPUE
	GROUP BY P.NOMBRE
	HAVING COUNT(C.CODCLI) >2
	ORDER BY NUMEROCLIENTES DESC;
	
	/*20. Cantidades totales vendidas para cada artículo cuyo código empieza por “P", mostrando también la descripción de dicho artículo.
	 * 9.-	Preco máximo y precio mínimo de venta (en líneas de facturas) para cada artículo cuyo código empieza por “c”.*/
	SELECT COUNT(A.CODART),A.DESCRIP  FROM ARTICULOS A , LINEAS_FAC lf 
	WHERE A.CODART = LF.CODART AND A.CODART LIKE '%P'
	GROUP BY A.DESCRIP;
	
	SELECT COUNT(A.CODART),A.DESCRIP  
	FROM ARTICULOS A
	INNER JOIN   LINEAS_FAC lf 
	ON A.CODART = LF.CODART 
	WHERE A.CODART LIKE '%P'
	GROUP BY A.DESCRIP;
	
	/*21.Igual que el anterior pero mostrando también la diferencia entre el precio máximo y mínimo.*/
	
	
	
	/*22. Nombre de aquellos artículos de los que se ha facturado más de 10000 euros.*/
	
	
	/*23. Número de facturas de cada uno de los clientes cuyo código está entre 150 y 300 (se debe mostrar este código), con cada IVA 
	 *    distinto que se les ha aplicado.*/
	
	
	/*24. Media del importe de las facturas, sin tener en cuenta impuestos ni descuentos.*/
	
	
	