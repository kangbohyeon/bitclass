import java.util.Scanner;

class Time {
   int day;
   int hour;
   int min;
   int sec;

   public Time(int day, int hour, int min, int sec) {
      this.day = day;
      this.hour = hour;
      this.min = min;
      this.sec = sec;
   }

   public Time add_time(Time second_time) {
      int d1 = 0, h1 = 0, m1 = 0, s1 = 0;
      int hap1 = 0, hap2 = 0, hap3 = 0;
      hap1 = this.day * 3600 * 24 + this.hour * 3600 + this.min * 60 + this.sec;
      hap2 = second_time.day * 3600 * 24 + second_time.hour * 3600 + second_time.min * 60 + second_time.sec;
      hap3 = hap1 + hap2;

      if (this.hour + second_time.hour >= 24)
         d1 = 1;
      else
         d1 = 0;

      hap3 -= d1 * 3600 * 24;

      if (this.min + second_time.min >= 60)
         h1 = (this.hour + second_time.hour) / 24 + 1;

      else
         h1 = (this.hour + second_time.hour);

      hap3 -= h1 * 3600;

      if (this.sec + second_time.sec >= 60)
         m1 = (this.min + second_time.min) / 60 + 1;

      else
         m1 = (this.min + second_time.min);

      s1 = hap3 % 60;

      return new Time(d1, h1, m1, s1);

   }

   public Time sub_time(Time second_time) {
      int d1 = 0, h1 = 0, m1 = 0, s1 = 0;
      int hap1 = 0, hap2 = 0, hap3 = 0;
      hap1 = this.day * 3600 * 24 + this.hour * 3600 + this.min * 60 + this.sec;
      hap2 = second_time.day * 3600 * 24 + second_time.hour * 3600 + second_time.min * 60 + second_time.sec;

      if (hap1 >= hap2) {
         d1 = 0;
         hap3 = hap1 - hap2;
         h1 = hap3 / 3600;
         hap3 = hap3 % 3600;
         m1 = hap3 / 60;
         hap3 = hap3 % 60;
         s1 = hap3;
      } else {
         d1 = -1;
         hap3 = hap2 - hap1;
         h1 = hap3 / 3600;
         hap3 = hap3 % 3600;
         m1 = hap3 / 60;
         hap3 = hap3 % 60;
         s1 = hap3;
      }

      return new Time(d1, h1, m1, s1);
   }

   public int compare(Time second_time) {
      int hap1 = 0, hap2 = 0;

      hap1 = this.hour * 3600 + this.min * 60 + this.sec;
      hap2 = second_time.hour * 3600 + second_time.min * 60 + second_time.sec;
      if (hap1 > hap2)
         return -1;
      else if (hap1 < hap2)
         return 1;
      return 0;

   }

   public void print() {
      if (this.day == -1)
         System.out.printf("?????? %d??? %d??? %d???\n", this.hour, this.min, this.sec);
      else if (this.day == 1)
         System.out.printf("?????? %d??? %d??? %d???\n", this.hour, this.min, this.sec);
      else
         System.out.printf("?????? %d??? %d??? %d???\n", this.hour, this.min, this.sec);

   }

}

public class hard_ver {

   public static void main(String[] args) {
      Scanner sc = new Scanner(System.in);
      Time add_time, sub_time;
      int day, hour, min, sec, result;

      day = sc.nextInt();
      hour = sc.nextInt();
      min = sc.nextInt();
      sec = sc.nextInt();

      Time first_time = new Time(0, 10, 10, 10);
      Time second_time = new Time(day, hour, min, sec);

      add_time = first_time.add_time(second_time); // add ????????? ??????
      sub_time = first_time.sub_time(second_time); // sub ????????? ???

      System.out.println("??? ????????? ??????");
      add_time.print(); // print ????????? ??????

      System.out.println("??? ????????? ?????????");
      sub_time.print(); // print ????????? ??????

      result = first_time.compare(second_time); // compare ????????? ??????
      System.out.printf("???????????? %d?????? \n1?????? first_time??? ?????? -1?????? second_time??? ?????? 0??? ????????????", result); // compare ?????? ???

   }

}