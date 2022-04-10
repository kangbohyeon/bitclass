package chap06;

class Person {
	int age;
	String name;

	Person(String name, int age) {
		this.age = age;
		this.name = name;
	}

	String show() {
		return "사람[이름 : " + this.name + ", 나이 : " + this.age + "]";
	}
}

class Student extends Person {
	int num;

	Student(String name, int age, int num) {
		super(name, age);
		this.num = num;
	}

	String show() {
		return "학생[이름 : " + this.name + ", 나이 : " + this.age + ", 학번 : " + num + "]";
	}
}

class ForeignStudent extends Student {
	String coun;

	ForeignStudent(String name, int age, int num, String coun) {
		super(name, age, num);
		this.coun = coun;
	}

	String show() {
		return "외국학생[이름 : " + this.name + ", 나이 : " + this.age + ", 학번 : " + num + ", 국적 : " + coun + "]";
	}
}

public class programming02 {

	public static void main(String[] args) {
		Person[] p = { new Person("길동이", 22), new Student("황진이", 23, 100),
				new ForeignStudent("Amy", 30, 200, "U.S.A") };
		for (Person k : p) {
			System.out.println(k.show());
		}

	}

}
