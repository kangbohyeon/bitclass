package chap05;

import java.util.Scanner;

public class programming04 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String s, ch1, ch2;
		int i;
		while (true) {
			System.out.print("URL을 입력하세요 :");
			s = sc.nextLine();

			if (s.contains("java"))
				System.out.println("www.java.com은 \'java\'를 포함합니다.");
			if (s.endsWith("com"))
				System.out.println("www.java.com은 \'com\'으로 끝납니다.");
			if (s.equals("bye"))
				break;

		}

	}

}
