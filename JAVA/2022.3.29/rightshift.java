import java.util.Scanner;

public class rightshift {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int num, n;
		int check1 = 0X80000000; // 100000000000000000000
		int check2 = 0X7fffffff; // 011111111111111111111
		num = sc.nextInt();
		n = sc.nextInt();
		System.out.println(Integer.toBinaryString(num));

		for (int i = 0; i < n; i++) {
			if (num >= 0) {// 양수
				if ((num & 1) == 0) {
					num = num >> 1;

				} else {
					num = num >> 1;
					num = num | check1;

				}
			} else {// 음수
				if ((num & 1) == 0) {
					num = num >> 1;
					num = num & check2;

				} else {
					num = num >> 1;

				}
			}
		}
		System.out.println(Integer.toBinaryString(num));
	}

}
