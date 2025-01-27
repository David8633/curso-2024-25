package boletin3;

public class Actvidad1 {

	public static void main(String[] args) {
		int [][]ma = {
				{1,2,3},
				{1,2,3},
				{1,2,3}		
		};
		int [][]mb = {
				{1,2,3},
				{1,2,3},
				{1,2,3}		
		};
		System.out.println(sumar(ma,mb));
	}
	public static int[][] sumar(int[][] ma,int [][] mb){
		int [][]suma= null;
		if ( ma.length==mb.length&&ma[0].length==mb[0].length) {
			/*ma.lenght mide la fila y ma[0].lenght mide la columna*/
			suma= new int[ma.length][mb[0].length];
			for( int i=0;i<ma.length;i++) {
				for ( int j=0;j<ma[0].length;j++) {
					suma[i][j]= ma[i][j]+mb[i][j];
				}
			}
			
		}
	return suma;}
}
