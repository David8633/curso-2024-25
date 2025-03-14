package com;

import com.model.Elemento;
import com.model.Entrenador;
import com.model.Pokemon;

public class main {

	public static void main(String[] args) {

		Entrenador e1 = new Entrenador("Pepe");
		Entrenador e2 = new Entrenador("Luis");
		
		Pokemon picachu = new Pokemon("Pikachu",Elemento.ELECTRICO);
		
		e1.addPokemon(picachu);
		System.out.println(e1.mostrarPokemon());
		e1.donar(e2);
		System.out.println(e1.mostrarPokemon());
		System.out.println(e2.mostrarPokemon());
		Pokemon charizar = new Pokemon("Charizar",Elemento.FUEGO);
		
		e1.addPokemon(picachu);
		
	}

}
