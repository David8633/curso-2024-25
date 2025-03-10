import static org.junit.jupiter.api.Assertions.assertFalse;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class test1 {

	private static List<Integer> lista1;
	
	@BeforeAll
	public static void crearLista() {
		lista1 = new ArrayList<>();
		
	}
	
	@Test
	void test() {
		assertFalse();
	}

}
