package chap02_practice;

import java.util.Scanner;

public class programming08 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		int n, m, hap = 0;
		System.out.print("0~999 ������ ���ڸ� �Է��ϼ��� : ");
		n = sc.nextInt();
		m = n;
		while (true) {
			hap += m % 10;
			m /= 10;
			if (m == 0)
				break;

		}
		System.out.printf("�� �ڸ����� �� = %d", hap);
	}

}
