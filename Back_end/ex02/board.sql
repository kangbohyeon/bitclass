insert into tbl_board(bno, title, content, writer) 
	(select seq_board.nextval, title, content, writer from tbl_board);
	
	
select count(*) from tbl_board;