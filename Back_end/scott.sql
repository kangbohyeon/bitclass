create table tbl_board2(
bno number(10,0),
name varchar2(200) not null,
kor_grade number(3) not null,
math_grade number(3) not null,
eng_grade number(3) not null,
regdate date default sysdate,
updatedate date default sysdate
);

alter table tbl_board2 add constraint
pk_board2
primary key (bno);

insert into tbl_board2 (bno, name, kor_grade,math_grade,eng_grade)
values (SEQ_BOARD.nextval, 'user1', 70, 80,90);

insert into tbl_board2 (bno, name, kor_grade,math_grade,eng_grade)
values (SEQ_BOARD.nextval, 'user2', 30, 20,90);

insert into tbl_board2 (bno, name, kor_grade,math_grade,eng_grade)
values (SEQ_BOARD.nextval, 'user3', 40, 80,50);

insert into tbl_board2 (bno, name, kor_grade,math_grade,eng_grade)
values (SEQ_BOARD.nextval, 'user4', 100, 90,90);

insert into tbl_board2 (bno, name, kor_grade,math_grade,eng_grade)
values (SEQ_BOARD.nextval, 'user5', 65, 50,30);

insert into tbl_board2 (bno, name, kor_grade,math_grade,eng_grade)
values (SEQ_BOARD.nextval, 'user6', 100, 80,90);

insert into tbl_board2 (bno, name, kor_grade,math_grade,eng_grade)
values (SEQ_BOARD.nextval, 'user7', 30, 30,30);

insert into tbl_board2 (bno, name, kor_grade,math_grade,eng_grade)
values (SEQ_BOARD.nextval, 'user8', 80, 80,80);

insert into tbl_board2 (bno, name, kor_grade,math_grade,eng_grade)
values (SEQ_BOARD.nextval, 'user9', 35, 36,30);

insert into tbl_board2 (bno, name, kor_grade,math_grade,eng_grade)
values (SEQ_BOARD.nextval, 'user10', 100, 100,100);

insert into tbl_board2 (bno, name, kor_grade,math_grade,eng_grade)
values (SEQ_BOARD.nextval, 'user11', 20, 45,55);

insert into tbl_board2 (bno, name, kor_grade,math_grade,eng_grade)
values (SEQ_BOARD.nextval, 'user12', 100, 50,90);


select * from tbl_board2;

commit;