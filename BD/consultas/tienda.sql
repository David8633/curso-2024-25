/*Código, fecha y doble del descuento de las facturas con iva cero.*/
SELECT F.CODFAC,F.DTO *2   FROM FACTURAS F WHERE F.IVA=0;
/*Código de las facturas con iva nulo.*/
SELECT * FROM FACTURAS F WHERE F.IVA IS NULL;
/*Código y fecha de las facturas sin iva (iva cero o nulo).*/
SELECT F.CODFAC, F.FECHA  FROM FACTURAS F WHERE F.IVA IS NULL OR F.IVA  IS NULL;
/*Código de factura y de artículo de las líneas de factura en las que la cantidad solicitada 
 *es menor de 5 unidades y además se ha aplicado un descuento del 25% o mayor.*/
SELECT LF.CODART, LF.CODFAC FROM LINEAS_FAC lf  WHERE CANT<5 AND lf.DTO >=25;
/*Obtener la descripción de los artículos cuyo stock está por debajo del stock mínimo
 *  dado también la cantidad en unidades necesaria para alcanzar dicho mínimo.*/
SELECT A.DESCRIP,A.STOCK,A.STOCK_MIN FROM ARTICULOS a  WHERE A.STOCK_MIN > A.STOCK;
/*Ivas distintos aplicados a las facturas.*/
SELECT DISTINCT F.IVA FROM FACTURAS f WHERE f.IVA IS NOT NULL; 
/*Código, descripción y stock mínimo de los artículos de los que se desconoce la cantidad de stock. 
 *Cuando se desconoce la cantidad de stock de un artículo, el stock es nulo.*/
SELECT A.CODART,A.DESCRIP,A.STOCK FROM ARTICULOS a WHERE A.STOCK IS NULL;
/*Obtener la descripción de los artículos cuyo stock es más de tres veces su stock mínimo
 *  y cuyo precio supera los 6 euros.*/
SELECT * FROM ARTICULOS a WHERE A.STOCK > A.STOCK_MIN *3 AND A.PRECIO>6;
/*Código de los artículos (sin que salgan repetidos) comprados en aquellas 
 facturas cuyo código está entre 8 y 10.*/
SELECT DISTINCT lf.CODART FROM LINEAS_FAC lf WHERE lF.CODFAC BETWEEN 8 AND 10;
/*Mostrar el nombre y la dirección de todos los clientes.*/
SELECT C.NOMBRE,C.DIRECCION FROM CLIENTES c; 
