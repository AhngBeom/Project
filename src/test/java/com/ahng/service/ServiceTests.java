package com.ahng.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ahng.domain.CartVO;
import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ServiceTests {

	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService pdtService;

	@Test
	public void serviceTest() {
		String userID = "unknown";
//		CartVO vo = new CartVO();
//		vo.setUserID(userID);
//		vo.setPno(7L);
//		service.register(vo);
//		service.remove(userID, 2L);
//		cartService.getList(userID);
		pdtService.getAttachList(13L);
	}
}
