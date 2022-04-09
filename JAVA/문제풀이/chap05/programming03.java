package chap05;

public class programming03 {

	public static void main(String[] args) {
		Direction direction =  Direction.direction;
		for(Direction d : direction.values())
			System.out.print(d + " ");

	}

}

enum Direction{
	direction("µ¿"),direction2("¼­"),direction3("³²"),direction4("ºÏ");
	
	private String s;
	Direction(String s){
		this.s = s;
	}
	public String toString() {
		return s;
	}
}