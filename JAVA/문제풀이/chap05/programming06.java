package chap05;
import java.util.*;
public class programming06 {

	public static void main(String[] args) {
		int i;
		int [] org = {1,2,3,4,5};
		int [] a = new int[5];
		a = reverse(org);
		for(i=0;i<5;i++)
			System.out.print(a[i]);
		
	}

	private static int [] reverse(int[] org) {
		int i,j;
		int [] a = new int[org.length];
		for (i = org.length-1,j=0;i>=0;i--,j++) 
			a[j]= org[i];
		
		return a;
	}


}
