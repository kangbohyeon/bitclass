package chap03_practice;

import java.util.Scanner;

public class programming01 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		if (n >= 19)
			System.out.println("성년");
		else
			System.out.println("미성년");

	}

}
