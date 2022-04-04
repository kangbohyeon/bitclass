//package test;
//
//import java.util.Scanner;
//
//class Select {
//	String s;
//	String t;
//	static final int NUM = 0, STR = 1;
//
//	Select(String s, String t) {
//		this.s = s;
//		this.t = t;
//	}
//
//	class Strcmp {
//		
//		public Strcmp(String s, String t) {
//			Select.this.s = s;
//			Select.this.t = t;
//		}
//		public int cmp() {
//			return s.compareTo(t);
//		}
//	}
//
//	class Numcmp {
//
//		public Numcmp(String s, String t) {
//			Select.this.s = s;
//			Select.this.t = t;
//		}
//
//		public int cmp() {
//			double a, b;
//			a = Double.parseDouble(s);
//			b = Double.parseDouble(t);
//			if (a > b)
//				return 1;
//			else if (a < b)
//				return -1;
//			else
//				return 0;
//		}
//	}
//
//	public int check() {
//		int i;
//
//		for (i = 0; i < s.length(); i++) {
//			if (s.charAt(i) == '-' || s.charAt(i) == '.')
//				continue;
//			if (Character.isDigit(s.charAt(i)) == false)
//				return STR;
//		}
//		for (i = 0; i < t.length(); i++) {
//			if (t.charAt(i) == '-' || t.charAt(i) == '.')
//				continue;
//
//			if (Character.isDigit(t.charAt(i)) == false)
//				return STR;
//		}
//		return NUM;
//
//	}
//
//}
//
//public class fcmp5_prac {
//
//	public static void main(String[] args) {
//		Scanner sc = new Scanner(System.in);
//		String s = sc.nextLine();
//		String t = sc.nextLine();
//		Select P;
//		int result, Q;
//		P = new Select(s, t);
//
//		Q = P.check();
//		if(Q==Select.STR) {
//			Select.Strcmp k = P.new Strcmp(s,t);
//			result = k.cmp();
//		}
//		else {
//			Select.Numcmp k = P.new Numcmp(s,t);
//			result = k.cmp();
//		}
//		System.out.println(result);
//
//	}
//
//}