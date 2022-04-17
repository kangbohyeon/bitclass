package chap06;

class Phone {
	protected String owner;

	Phone(String owner) {
		this.owner = owner;
	}

	void talk() {
		System.out.println(owner + "�� ��ȭ ���̴�.");
	}

}

class Telephone extends Phone {
	private String when;

	Telephone(String owner, String when) {
		super(owner);
		this.when = when;
	}

	void autoAnswering() {
		System.out.println(owner + "�� ����. " + when + "��ȭ �ٷ�.");
	}
}

class Smartphone extends Phone {
	private String game;

	Smartphone(String owner, String game) {
		super(owner);
		this.game = game;
	}

	void playGame() {
		System.out.println(owner + "�� " + this.game + " ������ �ϴ� ���̴�.");
	}
}

public class programming05 {

	public static void main(String[] args) {
		Phone[] phones = { new Phone("Ȳ����"), new Telephone("�浿��", "����"), new Smartphone("�α���", "������") };
		for (int i = 0; i < phones.length; i++) {
			if (phones[i] instanceof Telephone)
				((Telephone) phones[i]).autoAnswering();
			else if (phones[i] instanceof Smartphone)
				((Smartphone) phones[i]).playGame();
			else
				phones[i].talk();

		}
	}

}
