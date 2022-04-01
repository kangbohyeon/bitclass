package chap03_practice;

public class programming08 {
	public static void main(String[] args) {

		System.out.println(factorial(5));

	}

	static int factorial(int n) {

		return switch (n) {
		case 1 -> 1;
		default -> n * factorial(n - 1);
		};
	}

}
