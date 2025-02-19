package main.java.model;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Persona {
	
	private String nombre;
	private String apellidos;
	private String dni;
	private LocalDate fechaNacimiento;
	
	public Persona(String nombre, String apellidos, String dni, LocalDate fechaNacimiento) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.dni = dni;
		this.fechaNacimiento = fechaNacimiento;
	}
	
	public boolean equals(Object o) {
		return this==o || o!=null && o instanceof Persona && this.dni.equals(((Persona)o).dni);				
	}

	@Override
	public String toString() {
		return "Persona [nombre=" + nombre + ", apellidos=" + apellidos + ", dni=" + dni + "y edad=" +ChronoUnit.YEARS.between(fechaNacimiento,LocalDate.now());
				
	}
	
	
}
