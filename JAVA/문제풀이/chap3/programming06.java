package chap03_practice;

import java.util.Scanner;

public class programming06 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String s1, s2;
		System.out.print("Ã¶¼ö : ");
		s1 = sc.next();
		System.out.print("¿µÈñ : ");
		s2 = sc.next();

		if (s1.equals("r")) {
			if (s2.equals("s"))
				System.out.println("Ã¶¼ö, ½Â!");
			else if (s2.equals("p"))
				System.out.println("¿µÈñ, ½Â!");
			else
				System.out.println("¹«½ÂºÎ");
		} else if (s1.equals("s")) {
			if (s2.equals("p"))
				System.out.println("Ã¶¼ö, ½Â!");
			else if (s2 == "r")
				System.out.println("¿µÈñ, ½Â!");
			else
				System.out.println("¹«½ÂºÎ");
		} else if (s1.equals("p")) {
			if (s2.equals("r"))
				System.out.println("Ã¶¼ö, ½Â!");
			else if (s2.equals("s"))
				System.out.println("¿µÈñ, ½Â!");
			else
				System.out.println("¹«½ÂºÎ");
		}
	}

}
