import java.math.*;
class Dice{

	int roll(){
		return (int)(Math.random()*10);
		
	}
}
public class programming08 {

	public static void main(String[] args) {
		Dice d = new Dice();
		System.out.println("주사위의 숫자 : "+ d.roll());

	}

}
