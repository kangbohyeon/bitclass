package chap02_practice;

import java.util.Scanner;

public class programming04 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n, h, m, s;
		System.out.print("초 단위 정수를 입력하세요 : ");
		n = sc.nextInt();
		h = n / 3600;
		n = n % 3600;
		m = n / 60;
		n = n % 60;
		s = n;
		System.out.printf("%d시간 %d분 %d초", h, m, s);

	}

}
