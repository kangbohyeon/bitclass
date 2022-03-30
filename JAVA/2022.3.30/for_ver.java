import java.util.Scanner;

public class for_ver {
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
		for (int i = s.length() - 1; i >= 0; i--) {
			ch = s.charAt(i);

			if (ch != c)
				temp += ch;

		}
		return temp;
	}
}
