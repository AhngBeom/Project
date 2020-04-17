package com.ahng.mapper;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
		cri.setKeyword("Mac");
		cri.setType("ND");
		
		List<ProductVO> list = mapper.getListWithPaging(cri, "");
		list.forEach(product -> log.info(product));
	}

}
