package chap02_practice;

import java.util.Scanner;

public class programming03 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int r, h;
		System.out.print("������� �ظ� ��������? : ");
		r = sc.nextInt();
		System.out.print("������� ���̴�? : ");
		h = sc.nextInt();

		System.out.printf("������� ���Ǵ� %.1f", 3.14 * h * r * r);

	}

}
