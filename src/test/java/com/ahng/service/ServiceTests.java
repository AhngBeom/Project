package com.ahng.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ahng.domain.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ServiceTests {

	@Autowired
	private ProductService service;

	@Test
	public void serviceTest() {
		ProductVO vo = service.get(7L);
		log.info(vo.getPno());

//		ProductVO vo = new ProductVO();
//		vo.setName("Å×½ºÆ®");
//		vo.setPrice(1000);
//		service.register(vo);
	}

}
