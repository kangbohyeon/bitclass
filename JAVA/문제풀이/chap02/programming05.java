package chap02_practice;

import java.util.Scanner;

public class programming05 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		char ch = sc.next().charAt(0);
		int n = (int) 'A' - (int) 'a';
		System.out.printf("%c", ch + n);
	}
}
