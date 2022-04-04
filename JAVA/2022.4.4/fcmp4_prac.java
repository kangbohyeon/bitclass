//import java.util.Scanner;
//
//interface Ts {
//	public abstract int cmp();
//}
//
//class Tr {
//	String s;
//	String t;
//
//	Tr(String s, String t) {
//		this.s = s;
//		this.t = t;
//	}
//
//}
//
//class Strcmp extends Tr implements Ts {
//
//	Strcmp(String s, String t) {
//		super(s, t);
//	}
//
//	@Override
//	public int cmp() {
//		return s.compareTo(t);
//	}
//}
//
//class Numcmp extends Tr implements Ts {
//
//	Numcmp(String s, String t) {
//		super(s, t);
//	}
//
//	@Override
//	public int cmp() {
//		double a, b;
//		a = Double.parseDouble(s);
//		b = Double.parseDouble(t);
//		if (a > b)
//			return 1;
//		else if (a < b)
//			return -1;
//		else
//			return 0;
//	}
//}
//
//class Select extends Tr {
//
//	Select(String s, String t) {
//		super(s, t);
//
//	}
//
//	public Ts check() {
//		int i;
//
//		for (i = 0; i < s.length(); i++) {
//			if (s.charAt(i) == '-' || s.charAt(i) == '.')
//				continue;
//			if (Character.isDigit(s.charAt(i)) == false)
//				return new Strcmp(s, t);
//		}
//		for (i = 0; i < t.length(); i++) {
//			if (t.charAt(i) == '-' || t.charAt(i) == '.')
//				continue;
//
//			if (Character.isDigit(t.charAt(i)) == false)
//				return new Strcmp(s, t);
//		}
//		return new Numcmp(s, t);
//
//	}
//
//}
//
//public class fcmp4_prac {
//
//	public static void main(String[] args) {
//		Scanner sc = new Scanner(System.in);
//		String s = sc.nextLine();
//		String t = sc.nextLine();
//		Ts Q;
//		Select P;
//
//		P = new Select(s, t);
//		Q = P.check();
//
//		System.out.println(Q.cmp());
//
//	}
//
//}