import java.util.Scanner;

class Time {
   int hour;
   int min;
   int sec;

   public Time(int hour, int min, int sec) {
      this.hour = hour;
      this.min = min;
      this.sec = sec;
   }

   public Time add_time(Time second_time) {
      int h1 = 0, m1 = 0, s1 = 0;
      h1 = hour + second_time.hour;
      m1 = min + second_time.min;
      s1 = sec + second_time.sec;

      return new Time(h1, m1, s1);

   }

   public Time sub_time(Time second_time) {
      int h1 = 0, m1 = 0, s1 = 0;
      h1 = hour - second_time.hour;
      m1 = min - second_time.min;
      s1 = sec - second_time.sec;

      return new Time(h1, m1, s1);

   }

   public void print() {
      System.out.printf("%d %d %d\n", hour, min, sec);
   }

}

public class easy_ver {

   public static void main(String[] args) {
      Scanner sc = new Scanner(System.in);
      int hour, min, sec;
      Time add_time;
      Time sub_time;
      int result;
      hour = sc.nextInt();
      min = sc.nextInt();
      sec = sc.nextInt();
      Time first_time = new Time(10, 10, 10);
      Time second_time = new Time(hour, min, sec);

      add_time = first_time.add_time(second_time); // add 메소드 호출
      sub_time = first_time.sub_time(second_time); // sub 메소도 호

      System.out.println("두 시간의 합은");
      add_time.print(); // print 메소드 호출

      System.out.println("두 시간의 차는");
      sub_time.print(); // print 메소드 호출


   }

}