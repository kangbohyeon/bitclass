package chap06;

class Parent{
	String name;
	Parent (){
		this.name = "����";
	}
	void print() {
		System.out.println("���� " +this.name+"�̴�.");
	}
}
class Child extends Parent{
	String name;
	Child(){
		this.name = "�絵����";
	}
	void print() {
		System.out.println("���� " +this.name+"�̴�.");
	}
}



public class programming04 {

	public static void main(String[] args) {
		Parent p = new Child();
		System.out.println(p.name);
		p.print();
}

}
