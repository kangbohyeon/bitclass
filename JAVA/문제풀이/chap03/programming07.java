package chap03_practice;

import java.util.Scanner;

public class programming07 {

	public static void main(String[] args) {

		String c = input("Ã¶¼ö");
		String y = input("¿µÈñ");

		whoWin(c, y);
	}

	public static String input(String s) {
		Scanner sc = new Scanner(System.in);
		System.out.print(s + ":");
		s = sc.next();
		return s;
	}

	public static void whoWin(String c, String r) {

		if (c.equals("r") && r.equals("s"))
			System.out.print("Ã¶¼ö, ½Â!");
		else if (c.equals("s") && r.equals("p"))
			System.out.print("Ã¶¼ö, ½Â!");
		else if (c.equals("p") && r.equals("r"))
			System.out.print("Ã¶¼ö, ½Â!");
		else if (r.equals("r") && c.equals("s"))
			System.out.print("¿µÈñ, ½Â!");
		else if (r.equals("s") && c.equals("p"))
			System.out.print("¿µÈñ, ½Â!");
		else if (r.equals("p") && c.equals("r"))
			System.out.print("¿µÈñ, ½Â!");
		else
			System.out.print("¹«½ÂºÎ");

	}

}
