package chap03_practice;

import java.util.Scanner;

public class programming02 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();

		switch (n) {
		case 1:
			System.out.println("���� ���߽��ϴ�.");
			break;
		case 2, 3:
			System.out.println("���߽��ϴ�.");
			break;
		case 4, 5, 6:
			System.out.println("�����Դϴ�.");
			break;
		default:
			System.out.println("����ؾ߰ڽ��ϴ�.");
		}

	}

}
