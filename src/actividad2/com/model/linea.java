package actividad2.com.model;

import actividad1.com.model.Desplazable;
import actividad1.com.model.Puntos;

public class linea implements Desplazable{
	Puntos punto1;
	Puntos punto2;
	
	/*se crea este vavcio para que se puede poner un punto vacio*/

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

	
	
	@Override
	public boolean equals( Object otro) {
		return otro!=null && otro instanceof linea && (((linea)otro).punto2.equals(this.punto2))
				|| (((linea)otro).punto2.equals(this.punto1));
	}


	@Override
	public void desplazarHorizontal(double desplazamiento) {
		this.punto1.desplazarHorizontal(desplazamiento);
		this.punto2.desplazarHorizontal(desplazamiento);
	}


	@Override
	public void desplazarVertical(double desplazamiento) {
		this.punto1.desplazarVertical(desplazamiento);
		this.punto2.desplazarVertical(desplazamiento);
	}



}
