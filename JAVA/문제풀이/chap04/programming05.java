class Line{
	int a;
	Line(int a){
		this.a=a;
	}
	public boolean isSameLine(Line b){
		if (a == b.a)
			return true;
		return false;
	}
}



public class programming05 {

	public static void main(String[] args) {
	Line a = new Line(1);
	Line b = new Line(1);
	
	System.out.println(a.isSameLine(b));
	System.out.println(a==b);

	}

}
