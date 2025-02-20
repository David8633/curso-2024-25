package com.model;

public class Usuario {

		private String nombre;
		private String correo;
		private int clave;
		private boolean rango;
		
		public Usuario(String nombre, String correo, int clave, boolean rango) {
			super();
			this.nombre = nombre;
			this.correo = correo;
			this.clave = clave;
			this.rango = rango;
		}

	@Override
	public String toString() {
		return "usuario [nombre=" + nombre + ", correo=" + correo + ", clave=" + clave + ", rango=" + rango + "]";
	}


	
	
}
