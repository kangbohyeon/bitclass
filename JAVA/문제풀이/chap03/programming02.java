package chap03_practice;

import java.util.Scanner;

public class programming02 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();

		switch (n) {
		case 1:
			System.out.println("아주 잘했습니다.");
			break;
		case 2, 3:
			System.out.println("잘했습니다.");
			break;
		case 4, 5, 6:
			System.out.println("보통입니다.");
			break;
		default:
			System.out.println("노력해야겠습니다.");
		}

	}

}
