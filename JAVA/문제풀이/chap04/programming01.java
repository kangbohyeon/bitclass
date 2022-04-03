class Triangle {
	double a, b;

	Triangle(double a, double b) {
		this.a = a;
		this.b = b;
	}

	public double findArea() {
		return (a*b/2);
	}

	public boolean isSameArea(Triangle t2) {
		double result = 0.0;
		double result2 = 0.0;
		result =(a*b/2);
		result2 = (t2.a*t2.b/2);
		if ( result == result2)
			return true;
		return false;
	}
	

}

public class programming01 {
	public static void main(String[] args) {
		Triangle t = new Triangle(10.0, 5.0);
		System.out.println(t.findArea());
	}	
	
}
