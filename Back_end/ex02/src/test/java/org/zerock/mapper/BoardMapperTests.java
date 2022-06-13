package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Test
	public void testGetList() {

		mapper.getList().forEach(board -> log.info(board));
		

	}
/* =======================================================*/
	@Test
	public void testInsert() {

		BoardVO board = new BoardVO();
		board.setTitle("새 작성 글");
		board.setContent("새로 작성하는 글의 내용");
		board.setWriter("newbie");

		mapper.insert(board);

		log.info(board);
	}

	@Test
	public void testInsertSelectKey() {

		BoardVO board = new BoardVO();
		board.setTitle("새 작성 글 select key");
		board.setContent("새로 작성하는 글의 내용  select key");
		board.setWriter("pmk");

		mapper.insertSelectKey(board);

		log.info(board);
	}

	@Test
	public void testRead() {

		// 존재하는 게시글 번호
		BoardVO board = mapper.read(6L);

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
		board.setBno(2L);
		board.setTitle("수정된 제목sdfdgsfshfshd");
		board.setContent("수정된 내용gdfsadggg");
		board.setWriter("kbh");

		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);
	}

//	@Test
//	public void testPaging() {
//
//		Criteria cri = new Criteria();
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//
//		list.forEach(board -> log.info(board));
//
//	}
	
	@Test
	public void testPaging() {

		Criteria cri = new Criteria();
		
	    //10 개씩 3 페이지
	    cri.setPageNum(3);
	    cri.setAmount(10);


		List<BoardVO> list = mapper.getListWithPaging(cri);

		list.forEach(board -> log.info(board));

	}
	
	
	
	  @Test
	  public void testSearch() {

	    Criteria cri = new Criteria();
	    cri.setKeyword("테스트");
	    cri.setType("TCW");

	    List<BoardVO> list = mapper.getListWithPaging(cri);

	    list.forEach(board -> log.info(board));
	  }


}
