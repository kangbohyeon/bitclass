class GolfClub {
	int a;
	String s;

	GolfClub() {
		this.a = 7;
	}

	GolfClub(int a) {
		this.a = a;
	}

	GolfClub(String s) {
		this.s = s;
	}

	void print() {
		if (this.a != 0)
			System.out.printf("%d번 아이언입니다\n", a);
		else
			System.out.printf("%s입니다\n", s);

	}
}

public class programming07 {

	public static void main(String[] args) {
		GolfClub g1 = new GolfClub();
		g1.print();

		GolfClub g2 = new GolfClub(8);
		g2.print();

		GolfClub g3 = new GolfClub("퍼터");
		g3.print();

	}

}
