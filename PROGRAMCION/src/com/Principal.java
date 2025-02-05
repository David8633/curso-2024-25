package com;

import java.time.LocalDate;

import com.model.Estudiante;
import com.model.Persona;

public class Principal {

	
	public static void main(String[] args) {
		
		Persona persona = new Persona("Juan","Gomez","11111111L",LocalDate.of(2020,3,1));
		
		Estudiante dm = new Estudiante("David","MArtinez","12122112L",LocalDate.of(2021, 5, 10));
		
		
		Estudiante manuel = new Estudiante ("Manuel","Muñoz","1221122112L",LocalDate.of(2025, 4,8),"c032",1,"daw");

		
		
		System.out.println();
	}

}

