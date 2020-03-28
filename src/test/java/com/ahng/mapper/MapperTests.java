package com.ahng.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;

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
		Criteria cri = new Criteria();
		cri.setType("c1");
		List<ProductVO> vo = mapper.categoryList("c1");
//		mapper.getList(new Criteria());
	}

}
