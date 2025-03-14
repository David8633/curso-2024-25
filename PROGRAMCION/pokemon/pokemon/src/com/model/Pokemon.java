package com.model;

import java.util.Objects;
import java.util.Random;

import com.model.Exception.PokemonException;

public  class Pokemon implements Comparable<Pokemon> {

	private String nombre;
	private Elemento elemento;
	protected int fuerza;
	private int nivel;
	
	public Pokemon(String nombre,Elemento elemento) {
		this.nombre = nombre;
		this.elemento= elemento;
		this.nivel = 3;
		this.fuerza = obtenerFuerzaInicial();
	}
	
	public Pokemon luchar(Pokemon visitante) {
		Pokemon ganador;
		if(this.fuerza>visitante.fuerza) {
			this.fuerza+=10;
			this.nivel++;
			visitante.fuerza-=5;
			visitante.nivel--;
			ganador= new Pokemon(this.nombre,this.elemento);
		}else {
			this.fuerza-=5;
			this.nivel--;
			visitante.fuerza-=10;
			visitante.nivel++;
			ganador = visitante;
		}
	return ganador;
	}
	
	public void evolucionarTrasBatalla(boolean estadoEvolucion) {
		
	}
	
	private int obtenerFuerzaInicial() {
		Random r1 = new Random();
		return this.fuerza=r1.nextInt(10000);
	}

	public String getNombre() {
		return nombre;
	}

	public Elemento getElemento() {
		return elemento;
	}
    /*
	public int compareTo(Pokemon o) {
    	int resultado=0;
    	if(this.nombre.equals(o.nombre)) {
    		resultado=0;
    	}else if(this.elemento.equals(o.elemento)){
    		
    	}
	}*/

	@Override
	public int hashCode() {
		return Objects.hash(elemento, fuerza, nivel, nombre);
	}

	
	public boolean equals(Pokemon  obj) {
		return obj!=null && obj instanceof Pokemon && obj.nombre.equals(this.nombre) && obj.elemento.equals(this.elemento);
	}

	

	@Override
	public String toString() {
		return "Pokemon nombre=" + nombre + ", elemento=" + elemento + ", fuerza=" + fuerza + ", nivel=" + nivel;
	}

	@Override
	public int compareTo(Pokemon o) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	

	
	
	
}
