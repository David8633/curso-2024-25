/*      1.Número de clientes que tienen alguna factura con IVA 16%.*/
		
		SELECT COUNT(C.CODCLI) FROM CLIENTES c WHERE C.CODCLI IN 
		(SELECT F.CODCLI  FROM FACTURAS F WHERE F.IVA=16);
		
		

/*        2. Número de clientes que no tienen ninguna factura con un 16% de IVA.*/
		
	    SELECT COUNT(C.CODCLI) FROM CLIENTES c WHERE C.CODCLI NOT IN 
		(SELECT F.CODCLI  FROM FACTURAS F WHERE F.IVA=16);
	    
	    
 /*       3. Número de clientes que en todas sus facturas tienen un 16% de IVA*/
		SELECT COUNT(F.CODCLI) 
	    FROM FACTURAS f 
	    WHERE F.CODCLI
	    NOT IN ( SELECT F.CODCLI FROM FACTURAS F WHERE NVL(F.IVA,0) <> 16); 
	    
 /*       4. Fecha de la factura con mayor importe (sin tener en cuenta descuentos ni impuestos).*/
 
        SELECT F.FECHA FROM FACTURAS f, LINEAS_FAC lf 
	    WHERE F.CODFAC = LF.CODFAC 
	    AND LF.PRECIO*LF.CANT =
	   		 (SELECT MAX(LF.PRECIO*LF.CANT) 
        		FROM LINEAS_FAC lf );
	    
	    
	    /*      5. Número de pueblos en los que no tenemos clientes.*/
		SELECT COUNT(P.CODPUE) 
		FROM PUEBLOS p
		WHERE P.CODPUE  IN (SELECT C.CODPUE FROM CLIENTES c WHERE c.CODPUE IS NULL);
 		
	    
	    
  /*      6. Número de artículos cuyo stock supera las 20 unidades, con precio superior a 15 euros y de los que no hay ninguna
   *  factura en el último trimestre del año pasado.*/
	    SELECT COUNT(A.CODART)
	    FROM ARTICULOS a
	    WHERE A.STOCK > 20
	    AND A.PRECIO > 15  
	    AND A.CODART IN (SELECT LF.CODART FROM LINEAS_FAC lf 
  						INNER JOIN FACTURAS F 
  						ON LF.CODFAC = F.CODFAC 
  						WHERE EXTRACT(MONTH FROM F.FECHA) NOT IN (10,11,12)
  						AND EXTRACT(YEAR FROM F.FECHA)=(EXTRACT(YEAR FROM SYSDATE)-1));
 
  /*      7. Obtene-r el número de clientes que en todas las facturas del año pasado han pagado IVA (no se ha pagado IVA si es cero o nulo).*/
         	SELECT COUNT(C.CODCLI) 
  			FROM CLIENTES c,FACTURAS F 
  			WHERE C.CODCLI = F.CODCLI
  			AND  EXTRACT(YEAR FROM F.FECHA)=EXTRACT(YEAR FROM SYSDATE)-1
  			AND F.CODCLI NOT IN(
  							SELECT F.CODCLI FROM FACTURAS f
							WHERE NVL(F.IVA,0)=0 AND EXTRACT(YEAR FROM F.FECHA)=EXTRACT(YEAR FROM SYSDATE)-1);
  
  	
  /*      8. Clientes (código y nombre) que fueron preferentes durante el mes de noviembre del año pasado y que en diciembre de ese mismo año no tienen ninguna factura. 
   * 		Son clientes preferentes de un mes aquellos que han solicitado más de 60,50 euros en facturas durante ese mes, sin tener en cuenta descuentos ni impuestos.*/
  			SELECT C.CODCLI,C.NOMBRE FROM CLIENTES C
			WHERE C.CODCLI NOT IN (SELECT F.CODCLI FROM FACTURAS F
							 WHERE EXTRACT(MONTH FROM F.FECHA)=12)
  			AND C.CODCLI IN 
  			(SELECT CL.CODCLI FROM CLIENTES CL, FACTURAS FA,LINEAS_FAC lf 
  			WHERE CL.CODCLI = FA.CODCLI AND FA.CODFAC = LF.CODFAC 
  			AND LF.PRECIO > 60.50 AND EXTRACT(YEAR FROM FA.FECHA)=EXTRACT(YEAR FROM SYSDATE)-1
  			AND EXTRACT(MONTH FROM FA.FECHA)=11);
  
 /*      9. Código, descripción y precio de los diez artículos más caros.*/
			SELECT CODART, DESCRIP, PRECIO 
			FROM ARTICULOS a 
			ORDER BY PRECIO DESC 
			FETCH FIRST 10 ROW ONLY;
  
  /*      10. Nombre de la provincia con mayor número de clientes.*/
  			 				
  				
				SELECT p.NOMBRE
				FROM PROVINCIAS p 
				JOIN PUEBLOS p2 ON p.CODPRO = P2.CODPRO
				JOIN CLIENTES c ON P2.CODPUE = C.CODPUE 
				GROUP BY p.NOMBRE 
				ORDER BY COUNT(C.CODCLI) DESC 
				FETCH FIRST 1 ROW ONLY
  				
  /*      11. Código y descripción de los artículos cuyo precio es mayor de 90,15 euros y se han vendido menos de 10 unidades (o ninguna) durante el año pasado.*/
  				SELECT a.codart, a.descrip FROM articulos a 
				LEFT JOIN lineas_fac lf ON a.codart = lf.codart 
				LEFT JOIN facturas f ON lf.codfac = f.codfac 
				AND EXTRACT(YEAR FROM f.fecha) = EXTRACT(YEAR FROM SYSDATE) - 1 
				GROUP BY a.codart, a.descrip, a.precio 
				HAVING a.precio > 90.15 
				AND (SUM(lf.cant) IS NULL OR SUM(lf.cant) < 10);
				  
  /*      12. Código y descripción de los artículos cuyo precio es más de tres mil veces mayor que el precio mínimo de cualquier artículo.*/
  						
  						SELECT A.CODART, A.DESCRIP 
						FROM ARTICULOS a 
						WHERE A.PRECIO > 3000 * (SELECT MIN(a2.precio) 
						FROM ARTICULOS a2);
  				
  /*      13. Nombre del cliente con mayor facturación.*/
  		
  			SELECT c.NOMBRE
			FROM CLIENTES c 
			JOIN FACTURAS f ON c.CODCLI = f.CODCLI 
			JOIN LINEAS_FAC lf ON f.CODFAC = lf.CODFAC 
			GROUP BY c.NOMBRE 
			ORDER BY SUM(lf.CANT*lf.PRECIO) DESC 
			FETCH FIRST 1 ROW ONLY;
  			
  			

  /*      14. Código y descripción de aquellos artículos con un precio superior a la media y que hayan sido comprados por más de 5 clientes.*/
  			SELECT a.codart, a.descrip 
			FROM articulos a JOIN lineas_fac lf ON a.codart = lf.codart 
			JOIN facturas f ON lf.codfac = f.codfac 
			GROUP BY a.codart, a.descrip, a.precio 
			HAVING a.precio > (SELECT AVG(precio) FROM articulos) AND COUNT(DISTINCT f.codcli) > 5;
