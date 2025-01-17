package main.java;
import main.java.model.Persona;
public class Principal {
	
	public static void main(String[] args) {
		
		Persona ismael = new Persona("David",2.9,58,874.5,"adasd",true);

		
/*		ismael.nombre = "Ismael";
		ismael.altura = 1.89;
		ismael.edad = 21;
		ismael.peso = 67.00;
		ismael.etnia = "español";
		ismael.feliz = true;
		
		carlos.nombre = "Carlos";
		carlos.altura = 2.00;
		carlos.edad = 21;
		carlos.peso = 67.00;
		carlos.etnia = "español";
		carlos.feliz = true;
		
		esto es lo que hace el construcctor por dentro
	*/	
		
		System.out.println(ismael.getAltura());
		
	}
	
}
