/*      1.Número de clientes que tienen alguna factura con IVA 16%.*/
		
		SELECT COUNT(C.CODCLI) FROM CLIENTES c WHERE C.CODCLI IN 
		(SELECT F.CODCLI  FROM FACTURAS F WHERE F.IVA=16);
		

/*        2. Número de clientes que no tienen ninguna factura con un 16% de IVA.*/
		
	    SELECT COUNT(C.CODCLI) FROM CLIENTES c WHERE C.CODCLI IN 
		(SELECT F.CODCLI  FROM FACTURAS F WHERE F.IVA<>16);
 /*       3. Número de clientes que en todas sus facturas tienen un 16% de IVA*/
		SELECT COUNT(F.CODCLI) 
	    FROM FACTURAS f 
	    WHERE F.IVA 
	    IN ( SELECT F.IVA FROM FACTURAS F WHERE F.IVA = 16); 
	    
 /*       4. Fecha de la factura con mayor importe (sin tener en cuenta descuentos ni impuestos).*/
        SELECT F.FECHA FROM FACTURAS f, LINEAS_FAC lf 
	    WHERE F.CODFAC = LF.CODFAC 
	    AND LF.PRECIO =(SELECT MAX(LF.PRECIO) FROM LINEAS_FAC lf );
	    
	    
	    /*      5. Número de pueblos en los que no tenemos clientes.*/
		SELECT COUNT(P.CODPUE) 
		FROM PUEBLOS p,CLIENTES C 
		WHERE P.CODPUE = C.CODPUE 
		AND C.CODCLI  IN (SELECT C.CODCLI  FROM CLIENTES c WHERE c.CODPUE IS NULL);
 		
  /*      6. Número de artículos cuyo stock supera las 20 unidades, con precio superior a 15 euros y de los que no hay ninguna
   *  factura en el último trimestre del año pasado.*/
	    SELECT COUNT(A.CODART)
	    FROM ARTICULOS a, LINEAS_FAC lf  
	    WHERE A.STOCK > 2O 
	    AND A.PRECIO > 15 
	    AND A.CODART = LF.CODART 
  		AND LF.CODFAC IN (SELECT LF.CODFAC FROM LINEAS_FAC lf, FACTURAS F WHERE LF.CODFAC = F.CODFAC AND EXTRACT(MONTH FROM F.FECHA) NOT IN (10,11,12));
 
  /*      7. Obtene-r el número de clientes que en todas las facturas del año pasado han pagado IVA (no se ha pagado IVA si es cero o nulo).*/
         	SELECT COUNT(C.CODCLI) FROM CLIENTES c,FACTURAS F WHERE C.CODCLI = F.CODCLI AND F.CODFAC IN(SELECT F.CODFAC FROM FACTURAS f WHERE NVL(F.IVA,0)<>0 AND EXTRACT(YEAR FROM F.FECHA)=EXTRACT(YEAR FROM SYSDATE)-1);
  
  	
  /*      8. Clientes (código y nombre) que fueron preferentes durante el mes de noviembre del año pasado y que en diciembre de ese mismo año no tienen ninguna factura. 
   * 		Son clientes preferentes de un mes aquellos que han solicitado más de 60,50 euros en facturas durante ese mes, sin tener en cuenta descuentos ni impuestos.*/
  			SELECT  C.CODCLI , C.NOMBRE FROM CLIENTES C
  			WHERE C.CODCLI IN 
  			(SELECT C.CODCLI FROM CLIENTES C, FACTURAS F,LINEAS_FAC lf 
  			WHERE C.CODCLI = F.CODCLI AND F.CODFAC = LF.CODFAC 
  			AND LF.PRECIO > 60.50 AND F.FECHA = TO_DATE('11-11-2024','DD-MM-YYYY'));
  
 /*      9. Código, descripción y precio de los diez artículos más caros.*/

  /*      10. Nombre de la provincia con mayor número de clientes.*/
  					
  				SELECT P.NOMBRE 
  				FROM PROVINCIAS p
  				WHERE P.CODPRO =(
  				SELECT MAX(P.CODPRO) FROM PROVINCIAS p, PUEBLOS P2 
  				WHERE P.CODPRO = P2.CODPRO);
  				
  				
  				
  /*      11. Código y descripción de los artículos cuyo precio es mayor de 90,15 euros y se han vendido menos de 10 unidades (o ninguna) durante el año pasado.*/
  				SELECT A.CODART, A.DESCRIP 
  				FROM ARTICULOS a 
  				WHERE A.CODART IN 
  				(SELECT A.CODART FROM ARTICULOS a,LINEAS_FAC lf,FACTURAS f   
  				WHERE A.CODART = LF.CODART  
  				AND EXTRACT(YEAR FROM F.FECHA)= (EXTRACT(YEAR FROM SYSDATE)-1)
  				AND LF.PRECIO > 90.15
  				GROUP BY A.CODART
  				HAVING COUNT(A.CODART)<10) ;

  
  /*      12. Código y descripción de los artículos cuyo precio es más de tres mil veces mayor que el precio mínimo de cualquier artículo.*/
  						SELECT A.CODART,A.DESCRIP,MIN(A.PRECIO)*3000 FROM ARTICULOS A 
  						GROUP BY A.CODART,A.DESCRIP
  						HAVING A.PRECIO > MIN(A.PRECIO)*3000;
  				
  /*      13. Nombre del cliente con mayor facturación.*/
  		
  			SELECT C.CODCLI FROM FACTURAS f,CLIENTES c 
  			WHERE F.CODCLI = C.CODCLI
  		
  			GROUP BY C.CODCLI ;
  /*      14. Código y descripción de aquellos artículos con un precio superior a la media y que hayan sido comprados por más de 5 clientes.*/