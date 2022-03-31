package chap03_practice;

public class programming05 {

	public static void main(String[] args) {
		int i, j, k;
		for (i = 1; i <= 20; i++)
			for (j = 1; j <= 20; j++)
				for (k = 1; k <= 20; k++)
					if ((i + j + k <= 20) && (k * k == i * i + j * j) && (k < i + j))
						System.out.printf("%d %d %d\n", i, j, k);

	}

}
