package chap03_practice;

import java.util.Scanner;

public class programming10 {

	public static void main(String[] args) {
		System.out.print("양의 정수를 입력하세요 :");
		int num = new Scanner(System.in).nextInt();
		if (isPrime(num))
			System.out.println(num + "는 소수입니다");
		else
			System.out.println(num + "는 소수가 아닙니다.");
	}

	private static boolean isPrime(int num) {
		int i, f = 0;

		for (i = 2; i < num; i++) {
			if (num % i == 0) {
				f = 1;
				break;
			}
			if (f == 0)
				return true;

		}
		return false;

	}

}
