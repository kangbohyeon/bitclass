package chap03_practice;

import java.util.Scanner;

public class programming03 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n, hap = 0;

		do {
			System.out.print("양의 정수를 입력하세요 : ");
			n = sc.nextInt();
			if (n < 0)
				break;
			if (n % 2 == 0)
				hap += n;

		} while (true);
		System.out.println("입력한 양의 정수 중에서 짝수의 합은 " + hap);
	}

}
