package chap05;

public class programming03 {

	public static void main(String[] args) {
		Direction direction =  Direction.direction;
		for(Direction d : direction.values())
			System.out.print(d + " ");

	}

}

enum Direction{
	direction("��"),direction2("��"),direction3("��"),direction4("��");
	
	private String s;
	Direction(String s){
		this.s = s;
	}
	public String toString() {
		return s;
	}
}