package com.ahng.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ahng.domain.OrderVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTests {

	@Autowired
	private ProductMapper pdtMapper;
	@Autowired
	private OrderMapper orderMapper;

	@Test
	public void test() {
//		orderMapper.orderList("member1");
		OrderVO vo = orderMapper.read("202005224684");
		vo.getPdtOnOrder().forEach(pdt -> log.info(pdt));;
	}

}
