package alumno.com.model;

import java.time.LocalDate;
import java.util.Objects;

public class Alumno {

	private String nombre;
	private String dni;
	private char Sexo;
	private int edad;
	
	public Alumno(String nombre,String dni, char sexo, int edad) {
		this.nombre= nombre;
		this.dni = dni;
		this.Sexo = sexo;
		this.edad = edad;
	}

	@Override
	public int hashCode() {
		return Objects.hash(dni);
	}

	@Override
	public boolean equals(Object obj) {
		return this==obj || obj != null && obj instanceof Alumno && this.hashCode()==obj.hashCode();
	}

	@Override
	public String toString() {
		return "Alumno nombre=" + nombre + ", dni=" + dni;
	}

	public String getDni() {
		return dni;
	}

	public char getSexo() {
		return Sexo;
	}

	public int getEdad() {
		return edad;
	}
	
	
	
	
	
	
}
