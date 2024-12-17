package boletin;
import java.util.Scanner;
public class Actividad4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		System.out.println("Introduce tu nota parte teorica: ");
		int teorica = Integer.valueOf(scanner.nextInt());
		System.out.println("Introduce tu parte practica: ");
		int practiva = Integer.valueOf(scanner.nextInt());
		System.out.println("Introduce tu nota la parte de problemas: ");
		int problemas = Integer.valueOf(scanner.nextInt());
		
	}
 public static int porcentajeNotaFinal(int a,int b, int c) {

	 return a*(10/100) + b*(50/100) + c*(40/100);

 }
public static boolean notaBoletin (double a ) {
	if (a<5) {return ;}
 }
 }

