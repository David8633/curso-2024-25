package alumno.com.model;

import java.util.ArrayList;
import java.util.List;

import alumno.exception.alumnoException;

public class Equipo {

	private List<Alumno> jugadores;
	
	public Equipo() {
		this.jugadores = new ArrayList<>();
	}
	
	public void addAlumno(Alumno alumno) throws alumnoException {
		if(jugadores.contains(alumno.getDni())) {
			throw new alumnoException("EL alumno ya esta añadido en el equipo");
		}
		
		jugadores.add(alumno);
	}
	
	public void eliminarAlumno(Alumno alumno) throws alumnoException {
		if(!jugadores.contains(alumno.getDni())) {
			throw new alumnoException("El alumno ya ha sido eliminado,porque no se encuentra en la lista");
		}
		
		jugadores.remove(alumno);
	}
	
	public void ordenarEdadSexoH () {
		jugadores.stream()
			.filter(alumno -> alumno.getSexo()=='H' && alumno.getEdad()>18)
			.sorted((alumno1, alumno2) -> alumno1.getEdad()-alumno2.getEdad())
			.toList()
			.forEach(System.out::println);
	}
	
	public boolean esTotalmenteFemenino() {
		return jugadores.stream().allMatch(alumno -> alumno.getSexo()=='M');
	}
	
	public int jugadorasQueTieneEquipo() {
		return (int) jugadores.stream()
				.filter(alumno -> alumno.getSexo()=='M')
				.count();
	}

}
