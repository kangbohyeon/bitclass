package chap03_practice;

import java.util.Scanner;

public class programming10 {

	public static void main(String[] args) {
		System.out.print("���� ������ �Է��ϼ��� :");
		int num = new Scanner(System.in).nextInt();
		if (isPrime(num))
			System.out.println(num + "�� �Ҽ��Դϴ�");
		else
			System.out.println(num + "�� �Ҽ��� �ƴմϴ�.");
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
