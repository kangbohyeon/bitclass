package chap02_practice;

import java.util.Scanner;

public class programming02 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n;
		System.out.print("정수를 입력하세요 : ");
		n = sc.nextInt();
		System.out.printf("%d의 제곱은 %d", n, n * n);

	}

}
