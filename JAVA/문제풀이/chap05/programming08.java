package chap05;

import java.util.*;

public class programming08 {

	public static void main(String[] args) {

		String s;
		Scanner sc = new Scanner(System.in);
		s = sc.nextLine();
		System.out.print(s + getmake(s));

	}

	static String getmake(String s) {
		Day d = Day.FRIDAY;

		for (Day ch : d.values()) {
			if (s.equalsIgnoreCase(ch.name()) == true)
				s = ch.name();
			if (s.equals(ch.name()) == true) {
				d = ch;
				break;
			}
		}
		String s2 = switch (d) {
		case MONDAY -> "은 싫다";
		case FRIDAY -> "은 좋다";
		case SUNDAY -> "은 최고";
		case SATURDAY -> "은 최고";
		default -> "은 그저 그렇다";
		};

		return s2;
	}

}

enum Day {
	SUNDAY("SUNDAY"), MONDAY("MONDAY"), TUESDAY("TUESDAY"), WEDNEDAY("WEDNEDAY"), THURSDAY("THURSDAY"),
	FRIDAY("FRIDAY"), SATURDAY("SATURDAY");

	private String s;

	Day(String s) {
		this.s = s;
	}

	public String toString() {
		return s;
	}

}