package com.ahng.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ahng.domain.Criteria;
import com.ahng.domain.MemberVO;
import com.ahng.domain.ProductVO;
import com.ahng.mapper.MemberMapper;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberMapperTest {

	@Autowired
	private MemberMapper mapper;

	@Test
	public void test() {
		MemberVO vo = mapper.read("admin0");
		log.info(vo);
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}
}
