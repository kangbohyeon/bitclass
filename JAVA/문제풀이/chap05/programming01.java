package chap05;
import java.util.Scanner;

public class programming01 {

	public static void main(String[] args) {
		String s;
		char c;
		int a;
		Scanner sc = new Scanner(System.in);
		s = sc.next();
		c = sc.next().charAt(0);
		
		a=countCar(s,c);
		System.out.println(a);
	}

	 static int countCar(String s, char c) {
		 int i,cnt=0;
		 for(i =0; i<s.length();i++) {
			 if ((s.charAt(i))==c)
				 cnt++;
		 }
		return cnt;
	}

}
