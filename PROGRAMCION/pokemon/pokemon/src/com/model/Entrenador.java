package com.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import sun.jvm.hotspot.tools.SysPropsDumper;

public class Entrenador {

	private String nombre;
	private int batallasGanadas;
	private Set<Pokemon> pokedex;
	
	public Entrenador(String nombre) {
		super();
		this.nombre = nombre;
		this.batallasGanadas = 0;
		this.pokedex = new HashSet<>();
	}
		
	public void competir(Entrenador visitante) {
		Pokemon ganador = this.obtenerMasFuerte().luchar(visitante.obtenerMasFuerte());
		 if(this.obtenerMasFuerte().equals(ganador)){
			 this.pokedex.add(ganador);
			 this.batallasGanadas++;
			 visitante.batallasGanadas--;
			 visitante.eliminarPokemon(ganador);
		 }else {
			 this.batallasGanadas--;
			 visitante.batallasGanadas++;
			 visitante.pokedex.add(ganador);
			 this.eliminarPokemon(ganador);
		 }
				 	}
	
	public boolean addPokemon(Pokemon p1) {
		return pokedex.add(p1);
	}
	
	public boolean eliminarPokemon(Pokemon p1) {
		return pokedex.remove(p1);
	}
	
	public boolean eliminarPokemon(String nombre, Elemento elemento) {
		
		boolean eliminado = false;
		Iterator<Pokemon> it = pokedex.iterator();
		for(;it.hasNext();) {
			Pokemon p = it.next();
			if(p.getNombre().equals(nombre) && p.getElemento().equals(elemento)) {
				 pokedex.remove(p);
				 eliminado=true;
			}
		}
	return eliminado;}
	
	public void vaciar() {
		pokedex.removeAll(pokedex);
	}
	
	protected Pokemon obtenerMasFuerte() {
		int mayorFuerza = 0;
		Pokemon masFuerte = null;
		for(Pokemon p : pokedex) {
			if(p.fuerza>mayorFuerza) {
				mayorFuerza = p.fuerza;
				masFuerte = p;
			}
		}
	return masFuerte;}


	public boolean donar(Entrenador e2) {
		
		boolean donado = false;
		if(!e2.pokedex.containsAll(this.pokedex)) {
			e2.pokedex.addAll(this.pokedex);
			this.pokedex.removeAll(pokedex);
			donado = true;
		}
		
	return donado;}
	
	public String mostrarPokemon() {
		return pokedex.toString();
	}

	@Override
	public int hashCode() {
		return Objects.hash(nombre);
	}

	
	public boolean equals(Entrenador obj) {
		return  obj!=null && obj instanceof Entrenador && this.nombre.equals(obj.nombre);
	}

	@Override
	public String toString() {
		return "Entrenador nombre=" + nombre + ", batallasGanadas=" + batallasGanadas + ", pokedex=" + pokedex.toString() ;
	}
	
	
	
	


}
