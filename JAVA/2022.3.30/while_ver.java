import java.util.Scanner;

public class while_ver {
	public static void main(String[] args) {
		System.out.println("문자열\n문자");
		Scanner sc = new Scanner(System.in);
		String s = sc.nextLine();
		char c = sc.next().charAt(0);

		String result = revsqueeze(s, c);
		System.out.println(result);

	}

	private static String revsqueeze(String s, char c) {
		char ch;
		String temp = "";
		int i = s.length() - 1;
		;

		while (i >= 0) {
			ch = s.charAt(i);

			if (ch != c)
				temp += ch;
			i--;

		}
		return temp;
	}

}
