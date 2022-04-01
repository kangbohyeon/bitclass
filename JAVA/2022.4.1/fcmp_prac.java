import java.util.Scanner;

class Ts {
	String s;
	String t;
	public static final int NUM = 0;
	public static final int STR = 1;

	Ts(String s, String t) {
		this.s = s;
		this.t = t;
	}

	public int check() {
		int i, f1 = 0, f2 = 0;

		for (i = 0; i < s.length(); i++) {
			if (s.charAt(i) == '-' || s.charAt(i) == '.')
				continue;
			if (Character.isDigit(s.charAt(i)) == false)
				return STR;
		}
		for (i = 0; i < t.length(); i++) {
			if (t.charAt(i) == '-' || t.charAt(i) == '.')
				continue;

			if (Character.isDigit(t.charAt(i)) == false)
				return STR;
		}
		return NUM;

	}
}

public class fcmp_prac {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String s = sc.nextLine();
		String t = sc.nextLine();
		double a, b;
		int result;

		Ts P = new Ts(s, t);
		int cond = P.check();

		if (cond == Ts.STR) {
			result = s.compareTo(t);

		} else {
			a = Double.parseDouble(s);
			b = Double.parseDouble(t);
			if (a > b)
				result = 1;
			else if (a < b)
				result = -1;
			else
				result = 0;
		}
		System.out.println(result);
	}
}
