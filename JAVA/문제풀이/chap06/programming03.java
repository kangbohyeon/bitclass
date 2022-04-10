package chap06;

class Point {
	private int x, y;

	Point(int x, int y) {
		this.x = x;
		this.y = y;
	}

	int getpointx() {
		return this.x;
	}

	int getpointy() {
		return this.y;
	}

	public String toString() {
		return "xÁÂÇ¥´Â : " + x + ",yÁÂÇ¥´Â : " + y;
	}

}

class MovablePoint extends Point {
	private int xSpeed, ySpeed;

	MovablePoint(int x, int y, int xSpeed, int ySpeed) {
		super(x, y);
		this.xSpeed = xSpeed;
		this.ySpeed = ySpeed;
	}

	public String toString() {
		return "xÁÂÇ¥´Â : " + getpointx() + ",yÁÂÇ¥´Â : " + getpointy() + ", xÁÂÇ¥ÀÇ ¼Óµµ´Â " + xSpeed + ", yÁÂÇ¥ÀÇ ¼Óµµ´Â " + ySpeed;
	}

}

public class programming03 {

	public static void main(String[] args) {

		MovablePoint mo = new MovablePoint(5, 6, 3, 4);
		Point p = new Point(1, 2);
		System.out.println(p.toString());
		System.out.print(mo.toString());

	}

}
