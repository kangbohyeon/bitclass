package chap02_practice;

import java.util.Scanner;

public class programming09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a, b, c;
		Scanner sc = new Scanner(System.in);
		System.out.print("���� �̼� ���� : ");
		a = sc.nextInt();
		System.out.print("���� �̼� ���� : ");
		b = sc.nextInt();
		System.out.print("�Ϲ� �̼� ���� : ");
		c = sc.nextInt();

		if (a >= 70) {
			if ((b >= 30 && c >= 30) || (b + c) >= 80)
				System.out.print("��������");
			else
				System.out.print("�����Ұ���");
		} else
			System.out.print("�����Ұ���");
	}

}
