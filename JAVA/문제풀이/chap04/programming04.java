class Car{
	static String s;
	static int a=0;
	static int b=0;
	Car(String s){
		this.s=s;
		a++;
		if(s.equals("red") || s.equals("RED"))
			b++;
	}
	public static int getnumOfCar() {
		
		return a;
	}
	public static int getNumOfRedCar() {
		
		return b;
	}
	
}
public class programming04 {

	public static void main(String[] args) {

		Car c1  = new Car("red");
		Car c2  = new Car("blue");
		Car c3  = new Car("RED");
		
		System.out.printf("자동차 수 ; %d, 빨간색 자동차 수: %d",Car.getnumOfCar(),Car.getNumOfRedCar());
		
	}

}
