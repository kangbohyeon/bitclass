package java_2022_4_5;

import java.util.Scanner;

class MyList2 {

	static class Node { // ��� ����
		int item;
		Node head;
		Node llink;
		Node rlink;

		public Node(int item) {
			this.item = item;
		}

		public Node() { // ���̳�� null
			this.head = null;
		}

	}

	public void add2(Node head, int item) {
		Node newnode, node;
		newnode = new Node(item);// ��� ����
		newnode.item = item;// �� ����

		node = head.llink;
		newnode.llink = node;
		newnode.rlink = node.rlink;
		node.rlink.llink = newnode;
		node.rlink = newnode;

	}

	public void delete2(Node head) {
		Node deleted;
		if ((head == head.llink) && (head == head.rlink)) {
			System.out.println("empty");// ������ִٸ� empty���
		} else {// �װ� �ƴϸ� ����
			deleted = head.rlink;
			deleted.llink.rlink = deleted.rlink;
			deleted.rlink.llink = deleted.llink;
		}
	}

	public void print2(Node head) {// ���
		Node ptr;
		ptr = head.llink;
		while (ptr != head) {// ptr�� head�϶����� ���
			System.out.println(ptr.item);
			ptr = ptr.llink;
		}
	}

}

public class cirlist {

	public static void main(String[] args) {
		int cond2, item2 = 0;

		Scanner scanner = new Scanner(System.in);
		MyList2 list2 = new MyList2();
		MyList2.Node head = new MyList2.Node(); // ���̳�� ����
		head.llink = head.rlink = head;// �ʱ�ȭ

		while (true) {
			System.out.println("1.���� 2.���� 3.��� 4.����");
			cond2 = scanner.nextInt();
			if (cond2 == 1) {// ����
				System.out.printf("�Է��ϼ��� :");
				item2 = scanner.nextInt();
				list2.add2(head, item2);
			} else if (cond2 == 2) {// ����
				list2.delete2(head);
			} else if (cond2 == 3) {// ���
				list2.print2(head);
			} else if (cond2 == 4) {// ����
				break;
			} else {
				System.out.print("�ٽ��Է��ϼ���\n");
			}
		}

	}

}
