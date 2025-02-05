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
SELECT A.DESCRIP  FROM ARTICULOS a WHERE A.STOCK <0 AND A.
