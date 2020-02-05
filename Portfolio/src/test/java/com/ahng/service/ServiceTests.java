package com.ahng.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ahng.domain.Criteria;
import com.ahng.domain.FeedVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ServiceTests {

	@Setter(onMethod_ = @Autowired)
	private FeedService service;
	
	@Test
	public void serviceTest() {
		FeedVO vo = new FeedVO();
		vo.setUserID("asdasd");
		vo.setMessage("asd");
		service.register(vo);
	}	
}
