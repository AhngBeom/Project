package com.ahng.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ahng.domain.Criteria;
import com.ahng.domain.MemberVO;
import com.ahng.domain.OrderVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTests {

	@Autowired
	private PasswordEncoder pwencoder;
	@Autowired
	private ProductMapper pdtMapper;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private MemberMapper memberMapper;

	@Test
	public void test() {
		MemberVO vo = new MemberVO();
		vo.setUserid("a");
		vo.setUserName("b");
		vo.setUserpw(pwencoder.encode("b"));
		memberMapper.update(vo);
	}
}
