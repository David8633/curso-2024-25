package actividad1.com.model;

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
	
	public String desplazarPuntoVerticalIzq(double unidadesY) {
		this.coordenadasy--;
		return "se ha desplazado a " + coordenadasx +":"+ coordenadasy;
	}
	
	public String desplazarPuntoVerticalDer(double unidadesY) {
		this.coordenadasy++;
		return "se ha desplazado a " + coordenadasx +":"+ coordenadasy;
	}
	
	public String desplazarPuntoHorizontalAbajo(double unidadesX) {
		this.coordenadasx--;
		return "se ha desplazado a " + coordenadasx +":"+ coordenadasy;
	}
	
	public String desplazarPuntoHorizontalArriba(double unidadesX) {
		this.coordenadasx++;
		return "se ha desplazado a " + coordenadasx +":"+ coordenadasy;
	}

	@Override
	public String toString() {
		return "Puntos coordenadasx=" + coordenadasx + ", coordenadasy=" + coordenadasy ;
	}
	
	@Override
	public boolean equals(Object otro) {
		boolean esPunto = otro!=null && otro instanceof Puntos;
		Puntos otroPunto = esPunto? (Puntos)otro : null;
		return esPunto && this.coordenadasx==otroPunto.coordenadasx &&this.coordenadasy==otroPunto.coordenadasy;
	}
}
