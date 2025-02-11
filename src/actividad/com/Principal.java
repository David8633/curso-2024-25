package actividad.com;

import actividad.com.model.Persona;
import actividad.com.model.lineaç;

public class Principal {

	public static void main(String[] args) {

		 Persona p1 = new Persona(3,8);
		 Persona p2 = new Persona(0,5);
		 Object p3 = new Persona(3,8);
		 
		 System.out.println(p1 instanceof Persona);
		 System.out.println(p1 instanceof Object);
		 /*para saber si es de tipo punto, y el punto es 
		  * un objeto porque hereda de el*/
		 
		 lineaç ln = new lineaç(1,5,4,8);
		 lineaç ln2 = new lineaç(2,3,2,3);
		 lineaç ln3 = new lineaç(3,4,2,1);
		 
		 System.out.println(p1.equals(ln3));
		 /*tanto .equals o == va a dar false si dos puntos 
		  * son iguales, porque mira el id*/	}

}
