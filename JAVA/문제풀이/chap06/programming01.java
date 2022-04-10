package chap06;

class Circle {
	int radius;

	Circle(int radius) {
		this.radius = radius;
	}

	void show() {
		System.out.printf("�������� %d�� ���̴�.\n", radius);
	}
}

class ColoredCircle extends Circle {
	String color;

	ColoredCircle(int radius, String color) {
		super(radius);
		this.color = color;
	}

	void show() {
		System.out.printf("�������� %d�� %s ���̴�\n", radius, color);
	}
}

public class programming01 {

	public static void main(String[] args) {
		Circle c1 = new Circle(5);
		ColoredCircle c2 = new ColoredCircle(10, "red");
		
		c1.show();
		c2.show();
	}

}
