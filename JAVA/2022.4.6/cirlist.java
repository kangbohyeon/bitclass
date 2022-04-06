package java_2022_4_5;

import java.util.Scanner;

class MyList2 {

	static class Node { // 노드 생성
		int item;
		Node head;
		Node llink;
		Node rlink;

		public Node(int item) {
			this.item = item;
		}

		public Node() { // 더미노드 null
			this.head = null;
		}

	}

	public void add2(Node head, int item) {
		Node newnode, node;
		newnode = new Node(item);// 노드 생성
		newnode.item = item;// 값 생성

		node = head.llink;
		newnode.llink = node;
		newnode.rlink = node.rlink;
		node.rlink.llink = newnode;
		node.rlink = newnode;

	}

	public void delete2(Node head) {
		Node deleted;
		if ((head == head.llink) && (head == head.rlink)) {
			System.out.println("empty");// 비워져있다면 empty출력
		} else {// 그게 아니면 연결
			deleted = head.rlink;
			deleted.llink.rlink = deleted.rlink;
			deleted.rlink.llink = deleted.llink;
		}
	}

	public void print2(Node head) {// 출력
		Node ptr;
		ptr = head.llink;
		while (ptr != head) {// ptr이 head일때까지 출력
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
		MyList2.Node head = new MyList2.Node(); // 더미노드 생성
		head.llink = head.rlink = head;// 초기화

		while (true) {
			System.out.println("1.삽입 2.삭제 3.출력 4.종료");
			cond2 = scanner.nextInt();
			if (cond2 == 1) {// 삽입
				System.out.printf("입력하세요 :");
				item2 = scanner.nextInt();
				list2.add2(head, item2);
			} else if (cond2 == 2) {// 삭제
				list2.delete2(head);
			} else if (cond2 == 3) {// 출력
				list2.print2(head);
			} else if (cond2 == 4) {// 종료
				break;
			} else {
				System.out.print("다시입력하세요\n");
			}
		}

	}

}
