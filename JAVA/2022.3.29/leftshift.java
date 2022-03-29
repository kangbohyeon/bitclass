import java.util.Scanner;

public class leftshift {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int num, n;
		int check = 0X80000000; // 100000000000000000000
		num = sc.nextInt();
		n = sc.nextInt();
		System.out.println(Integer.toBinaryString(num));

		for (int i = 0; i < n; i++) {
			if ((num & check) == 0) {
				num = num << 1;

			} else {
				num = num << 1;
				num += 1;
			}

		}

		System.out.println(Integer.toBinaryString(num));
	}

}
