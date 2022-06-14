package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

  private Long bno;
  private String name;
  private int kor_grade;
  private int math_grade;
  private int eng_grade;
  private Date updateDate;
}
