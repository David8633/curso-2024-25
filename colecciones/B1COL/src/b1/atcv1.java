package b1;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class atcv1 {
	public static void main(String[] args) {
		System.out.println(rellenarConj());
	
}
	
	public static Set<Integer> rellenarConj() {
		List<Integer> conj = new ArrayList<>();
		
		Random r1 = new Random();
		
		for(int i = 0; i<30; i++) {
			conj.add(r1.nextInt(100));
		}
		
	return conj;}
}