package chap05;

import java.util.Scanner;

public class programming04 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String s, ch1, ch2;
		int i;
		while (true) {
			System.out.print("URL�� �Է��ϼ��� :");
			s = sc.nextLine();

			if (s.contains("java"))
				System.out.println("www.java.com�� \'java\'�� �����մϴ�.");
			if (s.endsWith("com"))
				System.out.println("www.java.com�� \'com\'���� �����ϴ�.");
			if (s.equals("bye"))
				break;

		}

	}

}
