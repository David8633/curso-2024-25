package actividad1.com.model;

public class Puntos implements Desplazable {
	private double coordenadasx ;
	private double coordenadasy ;
	
	/*para que pueda haber un punto vacío*/
	public Puntos() {
		super();
	}
	
	public Puntos(double coordenadasx, double coordenadasy) {
		super();
		this.coordenadasx = coordenadasx;
		this.coordenadasy = coordenadasy;
	}
	
	/*pasamos otro punto porque un punto solo no se puede calcular la distancia*/
	public String distancia(Puntos otro) {
	
		double restacoodenadax = otro.coordenadasx-this.coordenadasx;
		double restacoordenadasy= otro.coordenadasy - this.coordenadasy;
		return "La distancia entre puntos es: "+Math.sqrt((restacoodenadax*restacoodenadax)+(restacoordenadasy*restacoordenadasy));
		//return Math.sqrt(Math.pow((this.x-otroPunto.x),2)+Math.pow((this.y-otroPunto.y),2));
	}
		
	public String calcularDistanciaAlOrigen() {
		return distancia(new Puntos());
	}
	
	public void desplazarVertical(double unidadesY) {
		this.coordenadasy+=unidadesY;		
	}
		
	public void desplazarHorizontal(double unidadesX) {
		this.coordenadasx+=unidadesX;
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
