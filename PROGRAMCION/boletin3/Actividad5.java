package boletin3;

public class Actividad5 {

	public static void main(String[] args) {
int[][] matriz = {
		{4,9,2},
		{3,5,7},
		{8,1,6}
};
System.out.println(esCuadradoÇMagico(matriz));
	}
public static boolean esCuadradoÇMagico(int[][]matriz) {
int suma= 0;

boolean resultado= true;

	for (int i=0;i<matriz.length&&suma<=15 ;i++) {
		suma=0;
		for (int j=0;j<matriz.length;j++) {
		suma+= matriz[i][j];
		
		}
	}
	
	
	for (int j=0;j<matriz.length&&suma<=15 ;j++) {
		suma=0;
		for (int i=0;i<matriz.length;i++) {
			suma += matriz[j][i];
			
			}
			
		}

	for (int i=0;i<matriz.length;i++) {
		suma=0;
		suma+=matriz[i][i];
	
	}
	for (int i=0;i<matriz.length;i++) {
		suma=0;
		suma+=matriz[i][matriz.length-1-i];
	
	}

	if(suma>15) {resultado=false;}

return resultado;}
}

