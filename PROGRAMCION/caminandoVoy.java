package com.caminando;

public class caminandoVoy {

	public static void main(String[] args) {
		
		
		String cotas = "0 0 0 0 0 0 0 0 0 0 1300";
		String cotas2 = "1200 1250 1350 1400 1300 1600 1600 1600 1700 1500 1300";
		int numero=300;
		
		System.out.println(esPistaValida(cotas2, numero));
	}
	
	public static int[] convertirArray ( String cotas) {
		 String[] cotasString = cotas.split(" ");
		 int [] cotasInt = new int[cotasString.length];
		 for ( int i=0; i<cotasString.length;i++) {
			 cotasInt[i]=Integer.valueOf(cotasString[i]); 
		 }
	return cotasInt;
	}
	 
	public static boolean esPistaValida ( String cotas, int numero) {
		int[] cotasInt = convertirArray(cotas);
		boolean salida=true;
		int acu=0;
		for(int i=0; i<cotasInt.length-1 && salida==false &&acu>numero; i++ ) {
			
			if(cotasInt[i+1]>cotasInt[i]) {
				acu+=cotasInt[i+1]-cotasInt[i];
			}else {
				acu=0;
			}
			
			if(acu>numero) {
				salida=true;
			}
			/*distancia+= (puntos[i]<puntos[i+1])?Ç(puntos[i+1]-puntos[i]: -distancia;*/
		}
		
		return !salida;
	}
	

}
