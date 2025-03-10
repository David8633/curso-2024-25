package b1;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Actv2 {
	
	public static void main(String[] args) {
	        List<Integer> conj = new ArrayList<>();
	        conj.add(200000000);
	        conj.add(20);
	        conj.add(700);
	        conj.add(-9);
	        conj.add(-800);

	        System.out.println(ordenarSetAsc(conj));
	        System.out.println(ordenarSetDesc(conj));
	          
	
	}
	
	
	public static List<Integer> ordenarSetAsc(List<Integer> conj) {
		Collections.sort(conj);
		return conj;
	}
	
	public static List<Integer> ordenarSetDesc(List<Integer> conj) {
		Collections.reverse(conj);
		return conj;
	}
}
