package chap02_practice;

import java.util.Scanner;

public class programming04 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n, h, m, s;
		System.out.print("�� ���� ������ �Է��ϼ��� : ");
		n = sc.nextInt();
		h = n / 3600;
		n = n % 3600;
		m = n / 60;
		n = n % 60;
		s = n;
		System.out.printf("%d�ð� %d�� %d��", h, m, s);

	}

}
