package boletin2;

public class Act1 {

	public static void main(String[] args) {
		

	}
	public static String parImparImprime (String cadena, boolean bandera)
	{
		int comienzo=1;
		/*int comienzo=bandera?1:0;   para librarnos de tres lineas*/
		if (bandera) {comienzo =0;}
		String subcadena="";
		for (int i=comienzo;i<cadena.length();i+=2) {
			subcadena+=cadena.charAt(i);
		}
		return subcadena;
	}
}
