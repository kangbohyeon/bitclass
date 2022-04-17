package chap06;

class Parent{
	String name;
	Parent (){
		this.name = "영조";
	}
	void print() {
		System.out.println("나는 " +this.name+"이다.");
	}
}
class Child extends Parent{
	String name;
	Child(){
		this.name = "사도세자";
	}
	void print() {
		System.out.println("나는 " +this.name+"이다.");
	}
}



public class programming04 {

	public static void main(String[] args) {
		Parent p = new Child();
		System.out.println(p.name);
		p.print();
}

}
