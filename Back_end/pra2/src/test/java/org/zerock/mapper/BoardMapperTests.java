package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Test
	public void testGetList() {

		mapper.getList().forEach(board -> log.info(board));
		
	}
	
	@Test
	public void testInsert() {

		BoardVO board = new BoardVO();
		board.setName("글쓴이");
		board.setKor_grade(10);
		board.setMath_grade(20);
		board.setEng_grade(30);
		mapper.insert(board);

		log.info(board);
	}

	@Test
	public void testInsertSelectKey() {

		BoardVO board = new BoardVO();
		board.setName("글쓴이selectkey");
		board.setKor_grade(10);
		board.setMath_grade(20);
		board.setEng_grade(30);
		mapper.insertSelectKey(board);

		log.info(board);
	}

	@Test
	public void testRead() {

		// 존재하는 게시글 번호
		BoardVO board = mapper.read(10L);

		log.info(board);

	}

	@Test
	public void testDelete() {

		log.info("DELETE COUNT: " + mapper.delete(4L));
	}

	@Test
	public void testUpdate() {

		BoardVO board = new BoardVO();
		// 실행 전 존재하는 번호인지 확인
		board.setBno(10L);

		board.setName("수정된글쓴이asdkjflk");
		board.setKor_grade(20);
		board.setMath_grade(20);
		board.setEng_grade(30);
		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);
	}

}
