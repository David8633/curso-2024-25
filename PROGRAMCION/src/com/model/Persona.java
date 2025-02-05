package com.model;
import java.time.LocalDate;

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
		
}
