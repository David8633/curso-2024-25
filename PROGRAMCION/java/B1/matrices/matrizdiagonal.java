package matrices;

import java.util.Arrays;
import java.util.Scanner;

public class matrizdiagonal {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("Introduce un numero que quieras que sean de anchura tu matriz: ");
		int numero = scan.nextInt();
		
		for (int[] fila:creaMatriz(numero)) {
		System.out.println(Arrays.toString(fila));
		}
	}
	public static int[][] creaMatriz(int dimension) {
		int [][]matriz = new int [dimension][dimension];
		for (int i=0; i<matriz.length; i++) {
		matriz[i][i]=1;	
		}
		return matriz;
	}
}
