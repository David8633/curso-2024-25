package actividad.com.model;

public class lineaç {

	private Persona p1;
	private Persona p2;
	public lineaç(Persona p1, Persona p2) {
		super();
		this.p1 = p1;
		this.p2 = p2;
	}
	
	public lineaç(double x1,double y1,double x2, double y2) {
		this(new Persona(x1,y1) , new Persona(x2,y2));
	}
	
	@Override
	public String toString() {
		return "linea p1=" + this.p1 + ", p2=" + this.p2 ;
	}
	
	
	
}
