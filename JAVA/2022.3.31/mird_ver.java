import java.util.Scanner;

public class mird_ver {
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String s, a, b, result;
		s = sc.next();
		a = sc.next();
		b = sc.next();
		result = mirdstr(s, a, b);
		System.out.println(result);
	}

	private static String mirdstr(String... s) {
		String ps = s[0];
		int a, b;
		a = Integer.parseInt(s[1]);
		b = Integer.parseInt(s[2]);
		String temp = new String("");
		temp = ps.substring(a - 1, b);
		return temp;
	}

}
