package chap03_practice;

import java.util.Scanner;

public class programming06 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String s1, s2;
		System.out.print("ö�� : ");
		s1 = sc.next();
		System.out.print("���� : ");
		s2 = sc.next();

		if (s1.equals("r")) {
			if (s2.equals("s"))
				System.out.println("ö��, ��!");
			else if (s2.equals("p"))
				System.out.println("����, ��!");
			else
				System.out.println("���º�");
		} else if (s1.equals("s")) {
			if (s2.equals("p"))
				System.out.println("ö��, ��!");
			else if (s2 == "r")
				System.out.println("����, ��!");
			else
				System.out.println("���º�");
		} else if (s1.equals("p")) {
			if (s2.equals("r"))
				System.out.println("ö��, ��!");
			else if (s2.equals("s"))
				System.out.println("����, ��!");
			else
				System.out.println("���º�");
		}
	}

}
