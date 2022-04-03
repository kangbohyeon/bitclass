class Complex{
	double a,b;
	Complex(double a){
		this.a = a;
		this.b = 0.0;
	}
	Complex(double a,double b){
		this.a = a;
		this.b = b;
	}
	void print() {
		System.out.printf("%.1f + %.1fi\n",a,b);
	}
}
public class programming06 {

	public static void main(String[] args) {
		Complex c1 = new Complex(2.0);
		c1.print();
		Complex c2 = new Complex(1.5,2.5);
		c2.print();

	}

}
