import java.util.*;
/*
 * #1 - 3
 * #2 - 4
 * #3 - 3 중복원소 x, 중복키 x, 스레드에 안전
 * #4 - 배열을 list타입으로 변갱했으므로 크기를 변경할 수 없어 실행오류발생 
 * #5 - Map<String, Integer> 변수 = new HashMap<>();
 * #6 - si.forEach(s ->System.out.print(s + " "));
 * #7 - Iterator<String> iterator = presidents.iterator();
		while(iterator.hasNext())
		System.out.println(iterator.next());
	#8 - <HashMap>
		<String, String>
		HashMap<>()
 */

public class practice11 {

	public static void main(String[] args) {
//		#4
//		String[] s = {"사과", "바나나"};
//		List<String> list = Arrays.asList(s);
//		
//		list.add("컵케익");
//		list.forEach(v -> System.out.print(v+" "));

//		#6
//		Stack<Integer>si = new Stack<>();
//		si.add(10);
//		si.add(20);
//		si.add(1,100);		
//		si.forEach(s ->System.out.print(s + " "));

//		#7
//		List<String> presidents = List.of("이승만","박정희","전두환");
//		Iterator<String> iterator = presidents.iterator();
//		while(iterator.hasNext())
//			System.out.println(iterator.next());
//		#8
//		List<HashMap> list = new ArrayList<>();
//		HashMap<String, String> map;
//		
//		map = new HashMap<>() ;
//		map.put("eng", "boy");
//		map.put("han", "머스마");
//		list.add(map);
//		
//		map = new HashMap<>() ;
//		map.put("eng", "girl");
//		map.put("han", "가시나");
//		list.add(map);
//		
//		list.forEach(
//				m -> System.out.println(m.get("eng") + " = " + m.get("han")));

	}

}
