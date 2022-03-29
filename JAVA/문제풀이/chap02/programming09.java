package chap02_practice;

import java.util.Scanner;

public class programming09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a, b, c;
		Scanner sc = new Scanner(System.in);
		System.out.print("전공 이수 학점 : ");
		a = sc.nextInt();
		System.out.print("교양 이수 학점 : ");
		b = sc.nextInt();
		System.out.print("일반 이수 학점 : ");
		c = sc.nextInt();

		if (a >= 70) {
			if ((b >= 30 && c >= 30) || (b + c) >= 80)
				System.out.print("졸업가능");
			else
				System.out.print("졸업불가능");
		} else
			System.out.print("졸업불가능");
	}

}
