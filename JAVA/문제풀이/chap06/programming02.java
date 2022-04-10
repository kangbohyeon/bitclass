package chap06;

class Person {
	int age;
	String name;

	Person(String name, int age) {
		this.age = age;
		this.name = name;
	}

	String show() {
		return "���[�̸� : " + this.name + ", ���� : " + this.age + "]";
	}
}

class Student extends Person {
	int num;

	Student(String name, int age, int num) {
		super(name, age);
		this.num = num;
	}

	String show() {
		return "�л�[�̸� : " + this.name + ", ���� : " + this.age + ", �й� : " + num + "]";
	}
}

class ForeignStudent extends Student {
	String coun;

	ForeignStudent(String name, int age, int num, String coun) {
		super(name, age, num);
		this.coun = coun;
	}

	String show() {
		return "�ܱ��л�[�̸� : " + this.name + ", ���� : " + this.age + ", �й� : " + num + ", ���� : " + coun + "]";
	}
}

public class programming02 {

	public static void main(String[] args) {
		Person[] p = { new Person("�浿��", 22), new Student("Ȳ����", 23, 100),
				new ForeignStudent("Amy", 30, 200, "U.S.A") };
		for (Person k : p) {
			System.out.println(k.show());
		}

	}

}
