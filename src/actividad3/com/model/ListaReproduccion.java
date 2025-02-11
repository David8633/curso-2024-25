package actividad3.com.model;

import java.time.LocalDate;

public class ListaReproduccion {
	private String nombre;
	private String usuarioAsociado;
	private int n_reproducciones;
	private LocalDate fechaCreaccion;
	private LocalDate ultimaReproduccion;
	private  canciones = new ArrayList<cancion>();
	

		

	
	public ListaReproduccion(String nombre, String usuarioAsociado, int n_reproducciones, Date fechaCreaccion,
			LocalDate ultimaReproduccion, ArrayList<cancion> canciones,String cancion) {
		super();
		this.nombre = nombre;
		this.usuarioAsociado = usuarioAsociado;
		this.n_reproducciones = n_reproducciones;
		this.fechaCreaccion = fechaCreaccion;
		this.ultimaReproduccion = ultimaReproduccion;
		this.canciones.add(cancion);
	}

	
	
	public void eliminarCanciones(cancion otra) {
		this.canciones.remove(otra);
	}
	
	public ArrayList<cancion> mostrarCacniones(){
		return this.canciones;
	}
	
}
