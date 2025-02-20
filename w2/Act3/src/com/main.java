package com;

import java.time.LocalDate;

import com.model.ListaReproducciones;
import com.model.Usuario;
import com.model.cancion;

public class main {

	public static void main(String[] args) {
		
		cancion c1 = new cancion("Pepito", "David", 1.2, "David el vaquilla", 2025, 80);
		cancion c2 = new cancion("Juan", "ttt", 3, "Burro", 2025, 0);
		cancion c3 =new  cancion("Bendecido", "Eladio Carrion", 3, "Sol Maria", 2024, 30000000);
		cancion c4 = new cancion("Manolin", "David", 1.2, "David el vaquilla", 2025, 80);
		cancion c5 = new cancion("Rios verdes", "David", 1.2, "David el vaquilla", 2025, 80);
		cancion c6 = new cancion("El monte", "David", 1.2, "David el vaquilla", 2025, 80);
		Usuario u7 = new Usuario("Javier", "Javierroldan@gmail.com", 20, true);
		Usuario u1 = new Usuario("Javier", "javier@gmail.com", 0, false);
		ListaReproducciones ls1 = new ListaReproducciones("Lista 1", u1, 2, LocalDate.now(), LocalDate.now());
		ls1.agregarCancion(c1);
		ls1.agregarCancion(c2);
		ls1.agregarCancion(c4);
		ls1.agregarCancion(c5);
		ls1.agregarCancion(c6);
		Usuario u9 = new Usuario("Javier", "Javierroldan@gmail.com", 20, true);
		Usuario u11= new Usuario("Javier", "javier@gmail.com", 0, false);
		ListaReproducciones ls2 = new ListaReproducciones("Lista 1", u1, 2, LocalDate.now(), LocalDate.now());
		ls1.agregarCancion(c1);
		ls1.agregarCancion(c2);
		ls1.agregarCancion(c4);
		ls1.agregarCancion(c5);
		ls1.agregarCancion(c6);
		System.out.println(ls1.mostrarLista());
		ls1.cancionActual();
		ls1.siguienteCancion();
		ls1.siguienteCancion();
		ls1.siguienteCancion();
		ls1.mostrarArtista("David");
		
		ls1.ordenReproduccion("NºReproducciones");
		
		System.out.println(ls1.mostrarArtista("David"));
	}

}
