package chap02_practice;

import java.util.Scanner;

public class programming07 {

	public static void main(String[] args) {
		int n;

		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		if (n % 4 == 0 && n % 5 == 0)
			System.out.print("4 and 5 is true");
		else if (n % 4 == 0) {
			System.out.print("only 4 is true");
		} else if (n % 5 == 0) {
			System.out.print("only 5 is true");
		} else if (n % 4 == 0 || n % 5 == 0) {
			System.out.print("4 or 5 is true");
		} else
			System.out.print("4 or 5 is false");

	}

}
