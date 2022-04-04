//import java.util.Scanner;
//
//abstract class Tr {
//	String s;
//	String t;
//
//	Tr(String s, String t) {
//		this.s = s;
//		this.t = t;
//	}
//
//	public abstract int cmp();
//}
//
//class Strcmp extends Tr {
//
//	Strcmp(String s, String t) {
//		super(s, t);
//	}
//	@Override
//	public int cmp() {
//		return s.compareTo(t);
//	}
//}
//
//class Numcmp extends Tr {
//
//	Numcmp(String s, String t) {
//		super(s, t);
//	}
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
//class Select {
//	String s, t;
//
//	Select(String s, String t) {
//		this.s = s;
//		this.t = t;
//	}
//
//	public Tr check() {
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
//public class fcmp3_prac {
//
//	public static void main(String[] args) {
//		Scanner sc = new Scanner(System.in);
//		String s = sc.nextLine();
//		String t = sc.nextLine();
//		Tr Q;
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