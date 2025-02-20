package main.java.exception;

import java.util.Scanner;
public class Principal {

	public static void main(String[] args) {
		int edad =0;
		Scanner sc = new Scanner(System.in);
		boolean bandera = false;
		do{
			
			try {
				System.out.println("Introduce tu edad: ");
				edad = Integer.valueOf(sc.nextLine());
				bandera = true;
		
		}catch(Exception e) {
			System.out.println("Invalido");
		}
		}while (bandera==false);
	
		if (edad>=18) {
			System.out.println("Eres mayor de edad");
			bandera = true;
			}else {
		System.out.println("Eres menor de edad");
	}
}}
