package chap05;

import java.util.Scanner;
import java.util.ArrayList;

public class programming05 {

	public static void main(String[] args) {
		int i, j, num, cnt = 0;
		int[] c = new int[10];
		ArrayList<Integer> b = new ArrayList<>();

		Scanner sc = new Scanner(System.in);
		System.out.println("숫자를 10개 입력하세요.");

		for (i = 0; i < 10; i++) {
			num = sc.nextInt();
			if (num < 0)
				continue;
			b.add(num);

		}
		for (i = 0; i < b.size(); i++)
			c[b.get(i) / 10]++;

		System.out.println();
		for (i = 0; i < c.length; i++) {
			System.out.printf("%d ~ %d :", 10 * i, 10 * i + 9);
			for (j = 0; j < c[i]; j++)
				System.out.print("*");
			System.out.println();
		}

	}

}
