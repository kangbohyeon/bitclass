package chap02_practice;

import java.util.Scanner;

public class programming03 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int r, h;
		System.out.print("원기둥의 밑면 반지름은? : ");
		r = sc.nextInt();
		System.out.print("원기둥의 높이는? : ");
		h = sc.nextInt();

		System.out.printf("원기둥의 부피는 %.1f", 3.14 * h * r * r);

	}

}
