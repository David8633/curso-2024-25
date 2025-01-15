package boletin2;

public class Actividad10 {

	public static void main(String[] args) {


	}
	public static boolean comprobarContrasenia(String contrasena) {
		boolean correcta=false;
		while (correcta==false) {
		String	caracterEspecial = "~`! @#$%^&*()_-+={[}]|\\:;\"'<,>.?/";
		
		for (int i=0; i<contrasena.length()&&correcta==false;i++) {
			for (int j=0;j<caracterEspecial.length();j++) {
			correcta=false;
			if(contrasena.charAt(i)==caracterEspecial.charAt(j)) {
				correcta=true;}
			}
}
			if(contrasena.contains("")) {correcta=false;}
			
		}
		
	    	
		
		return;
	}
}
