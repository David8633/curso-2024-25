package com.model;

import java.time.LocalDate;

public class Estudiante extends Persona {

	private String codigoMatricula;
	private int curso;
	private String estudios;
	
	public Estudiante(String nombre, String apellidos, String dni, LocalDate fechaNacimiento) {
		super(nombre, apellidos, dni, fechaNacimiento);
		
		
		
	}

	public Estudiante(String nombre, String apellidos, String dni, LocalDate fechaNacimiento, String codigoMatricula,
			int curso, String estudios) {
		this (nombre, apellidos, dni, fechaNacimiento);
		this.codigoMatricula = codigoMatricula;
		this.curso = curso;
		this.estudios = estudios;
	}

}
