package ALumno.main;

import alumno.com.model.Alumno;
import alumno.com.model.Equipo;
import alumno.exception.alumnoException;

public class Main {

	public static void main(String[] args) {
		Alumno a1 = new Alumno("David", "11111111G", 'H', 24);
		Alumno a2 = new Alumno("Maria", "22222222h", 'M', 20);
		Alumno a3 = new Alumno("Lucia", "55555555F", 'H', 19);
		
		Equipo e1 = new Equipo();
		
		try {
			e1.addAlumno(a1);
			e1.addAlumno(a2);
			e1.addAlumno(a3);
		} catch (alumnoException e) {
			e.printStackTrace();
		}
		
		e1.ordenarEdadSexoH();
	}	
}
