package chap05;

public class programming07 {

	public static void main(String[] args) {
		int[] a = { 3, 2, 4, 1, 5 };
		int[] b = { 3, 2, 4, 1 };
		int[] c = { 3, 2, 4, 1, 5 };
		int[] d = { 2, 7, 1, 8, 2 };

		boolean ch;
		ch = getmake(a, c);

		System.out.println(ch);
	}

	private static boolean getmake(int[] a, int[] b) {
		int i, f, j;

		if (a.length == b.length) {
			f = 0;
			for (i = 0; i < a.length; i++)
				if (a[i] != b[i]) {
					f = 1;
				}
			if (f == 1) {
				return false;
			}
		}

		else {
			
			for (i = 0, j = 0; i < a.length && j < b.length; i++, j++) {
				f = 0;
				if (a[i] != b[j]) {
					f = 1;
				}
				if (f == 1)
					return false;

			}
			return false;
		}

		return true;

	}

}
