package actividad.com.model;

public class Persona {

	private double coodenadaX;
	private double coordenadaY;
	
	public Persona(double coodenadaX, double coordenadaY) {
		super();
		this.coodenadaX = coodenadaX;
		this.coordenadaY = coordenadaY;
	}	
public String toString() {
	return "x: " + this.coodenadaX + " ,y: " + this.coordenadaY;
}
	
public boolean equals(Object otro) {
    boolean esPunto = otro!=null && otro instanceof  Persona;
    /**/
	Persona elOtroPunto = esPunto? (Persona)otro :null;
    return esPunto && this.coodenadaX==elOtroPunto.coodenadaX && this.coordenadaY==elOtroPunto.coordenadaY;
    
    /*compara los puntos*/
}
}
