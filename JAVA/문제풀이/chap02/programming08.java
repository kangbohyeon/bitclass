package chap02_practice;

import java.util.Scanner;

public class programming08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		int n, m, hap = 0;
		System.out.print("0~999 사이의 숫자를 입력하세요 : ");
		n = sc.nextInt();
		m = n;
		while (true) {
			hap += m % 10;
			m /= 10;
			if (m == 0)
				break;

		}
		System.out.printf("각 자릿수의 합 = %d", hap);
	}

}
