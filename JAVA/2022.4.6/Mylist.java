package java_2022_4_5;

public class Mylist {
	Node head;

	public class Node {
		private int item;
		private Node next;

		Node(int input) {
			this.item = input;
			this.next = null;
		}

	}

	public void add(int input) {
		Node newnode = new Node(input);
		if (head == null) {
			newnode.next = head;
			head = newnode;
		} else {
			Node temp = head;
			while (temp.next != null) {
				temp = temp.next;
			}
			temp.next = newnode;

		}

	}

	public int delete() {
		Node temp1;
		int temp2 = 0;
		if (head == null)
			System.out.printf("공백리스트입니다.\n");
		else {
			temp1 = head;
			head = temp1.next;
			temp2 = temp1.item;
			temp1 = null;
		}
		return temp2;

	}

	public void print() {
		Node cur = head;
		while (cur != null) {
			if (cur.next == null)
				System.out.printf("%d\n", cur.item);
			else
				System.out.printf("%d -> ", cur.item);
			cur = cur.next;
		}
	}

	public static void main(String[] args) {
		Mylist my = new Mylist();
		my.add(0);
		my.add(1);
		my.add(2);
		my.add(3);
		my.print();
		my.delete();
		my.delete();
		my.print();

	}

}
