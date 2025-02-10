package Boletin1.actvidad1.com.model;

public class Puntos {
	private double coordenadasx ;
	private double coordenadasy ;
	
	public Puntos(double coordenadasx, double coordenadasy) {
		super();
		this.coordenadasx = coordenadasx;
		this.coordenadasy = coordenadasy;
	}
		
	public String distancia(Puntos otro) {
	
		double restacoodenadax = otro.coordenadasx-this.coordenadasx;
		double restacoordenadasy= otro.coordenadasy - this.coordenadasy;
		return "La distancia entre puntos es: "+Math.sqrt((restacoodenadax*restacoodenadax)+(restacoordenadasy*restacoordenadasy));
	}
	
	public String desplazarPuntoVerticalIzq() {
		this.coordenadasx--;
		return "se ha desplazado a " + coordenadasx +":"+ coordenadasy;
	}
	
	public String desplazarPuntoVerticalDer() {
		this.coordenadasx++;
		return "se ha desplazado a " + coordenadasx +":"+ coordenadasy;
	}
	
	public String desplazarPuntoHorizontalAbajo() {
		this.coordenadasy--;
		return "se ha desplazado a " + coordenadasx +":"+ coordenadasy;
	}
	
	public String desplazarPuntoHorizontalArriba() {
		this.coordenadasx++;
		return "se ha desplazado a " + coordenadasx +":"+ coordenadasy;
	}

	@Override
	public String toString() {
		return "Puntos coordenadasx=" + coordenadasx + ", coordenadasy=" + coordenadasy ;
	}
	/*
	@Override
	public boolean .() {}
	*/
	
}
