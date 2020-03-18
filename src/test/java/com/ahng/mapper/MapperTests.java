package com.ahng.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTests {

	@Autowired
	private ProductMapper mapper;
	@Autowired
	private CartMapper cartMapper;

	@Test
	public void test() {
		String userID = "unknown";
//		ProductVO vo = new ProductVO();
//		vo.setName("TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest");
//		vo.setTitle("Test");
//		vo.setPrice(9999);
//		vo.setCategory("c2");
//		vo.setDescript("Test");
//		mapper.insert(vo);
//		mapper.getList(new Criteria());
		cartMapper.itemList(userID);
	}

}
