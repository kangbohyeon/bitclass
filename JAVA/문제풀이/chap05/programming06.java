package chap05;
import java.util.*;
public class programming06 {

	public static void main(String[] args) {
		List a = new ArrayList();
		a.add(2);
		System.out.println(a);
		a.add(1);
		System.out.println(a);
		a.add(1);
		System.out.println(a);
		a.add(1,3);
		System.out.println(a);
		a.remove(1);
		System.out.println(a);
		System.out.println(a.get(2));
		System.out.println(a.size());
		
	}

}
