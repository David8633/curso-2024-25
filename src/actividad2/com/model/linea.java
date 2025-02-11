package actividad2.com.model;

import actividad1.com.model.Puntos;

public class linea {
	Puntos punto1;
	Puntos punto2;
	
	

	public linea() {
		super();
	}


	public linea(Puntos punto1, Puntos punto2) {
		super();
		this.punto1 = punto1;
		this.punto2 = punto2;
	}
	
	public linea(double x1,double y1, double x2,double y2) {
		this(new Puntos(x1,y1),new Puntos(x2,y2));
	}
	
	public String obtenerLongitud() {
		return this.punto1.distancia(punto2);
	}	
	
	public String desplazarLineaVerticalDer(double unidadesY) {
		return this.punto1.desplazarPuntoVerticalDer(unidadesY);
	}
	public String desplazarLineaVerticalIzq(double unidadesY) {
		return this.punto1.desplazarPuntoVerticalIzq(unidadesY);
	}
	public String desplazarLineaHorizontalAbajo(double unidadesX) {
		return this.punto1.desplazarPuntoHorizontalAbajo(unidadesX);
	}
	public String desplazarLineaVerticalArriba(double unidadesX) {
		return this.punto1.desplazarPuntoHorizontalArriba(unidadesX);
	}
}
