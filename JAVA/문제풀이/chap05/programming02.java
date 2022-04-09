package chap05;

public class programming02 {

	public static void main(String[] args) {
		System.out.println(sumExceptFirst(1,2,3,4));
		int arr[] = {2,3};
		System.out.println(sumExceptFirst(1,arr));
		System.out.println(sumExceptFirst(1,2,3,4,5));

	}

	static int  sumExceptFirst(int b, int ... a) {
		int hap =0;
		for(int i = 0; i<a.length;i++)
			hap +=a[i];
		return hap;
	}

}
