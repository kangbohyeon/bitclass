package chap03_practice;

import java.util.Scanner;

public class programming03 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n, hap = 0;

		do {
			System.out.print("���� ������ �Է��ϼ��� : ");
			n = sc.nextInt();
			if (n < 0)
				break;
			if (n % 2 == 0)
				hap += n;

		} while (true);
		System.out.println("�Է��� ���� ���� �߿��� ¦���� ���� " + hap);
	}

}
