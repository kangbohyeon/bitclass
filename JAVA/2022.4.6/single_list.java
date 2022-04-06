package java_2022_4_5;

import java.util.Scanner;

class Mylink {

	class Node {
		int item;
		Node link;

		public Node(int item) { // node class 持失切
			this.item = item;
			this.link = null;
		}
	}

	public Node add(Node p, int num) {

		if (p == null) {
			p = new Node(num);
			p.item = num;
			p.link = null;
		} else {
			p.link = add(p.link, num);
		}
		return p;
	}

	public Node delete(Node p) {

		if (p == null) {
			System.out.println("vacant list");
			return p;
		} else
			return p.link;
	}

	public void print(Node p) {
		while (p != null) {
			System.out.println(p.item);
			p = p.link;
		}
	}
}

public class single_list {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int cond, item = 0;

		Mylink list = new Mylink();
		Mylink.Node root = null; // root node object 持失

		while (true) {
			System.out.println("1:insert 2:delete 3:output 4:exit");
			cond = sc.nextInt();

			if (cond == 1) {
				System.out.println("input item");
				item = sc.nextInt();
				root = list.add(root, item);
			} else if (cond == 2) {
				root = list.delete(root);
			} else if (cond == 3) {
				list.print(root);
			} else if (cond == 4) {
				break;
			} else {
				System.out.println("retry");
			}
		}
	}

}