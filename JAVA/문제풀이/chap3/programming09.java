package chap03_practice;

public class programming09 {

	public static void main(String[] args) {

		foo("�ȳ�", 1);
		foo("�ȳ��ϼ���", 1, 2);
		foo("���־�");
	}

	private static void foo(String s) {
		System.out.println(s);
	}

	private static void foo(String s, int n1, int n2) {
		System.out.println(s + n1 + n2);
	}

	private static void foo(String s, int n1) {
		System.out.println(s + n1);
	}

}
