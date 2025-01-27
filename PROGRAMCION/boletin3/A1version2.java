package boletin3;

import java.util.Arrays;

public class A1version2 {
public static void main(String[] args) {
	
	int [][]matriz= {{1,2,3},{4,5,6},{7,8,9}};
	String resultado = Arrays.toString(sumaPorFilas(matriz));
	System.out.println(resultado);
}
	    
	    public static int[] sumaPorFilas(int[][] matriz) {
	    	int[][] matriz2= matriz;
	    	int []suma= new int [matriz[0].length];
	    	for ( int i=0; i<matriz.length;i++) {
	    		for ( int j=0;j<3;j++) {
	    			suma[i]+=matriz[i][j];
	    		}
	    	}
	        return suma;}
}


