package b1;
import java.util.Scanner;
public class Actividad11 {

	public static void main(String[] args) {
		Scanner scan = new Scanner (System.in);
		System.out.println("Introduce la cantidad de numeros que quieres introducir: ");
		int numeros = scan.nextInt();
		while (numeros<0) {
			System.out.println("Introduce la cantidad de numeros que quieres introducir: ");
			numeros = scan.nextInt();
		}
		
		int i=0;
		int suma=0;
		while(i<numeros) {
			System.out.println("Introduce el numero que quieres introducir: ");
			int nume = scan.nextInt();
				while (nume<0) {
					System.out.println("Introduce el nuevo numero positivo que quieres introducir: ");
					nume = scan.nextInt();
					i++;
			suma+=nume;
			i++;
			}
		}
		System.out.println("La suma total es" +suma);
	}

}
