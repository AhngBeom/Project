package com.ahng.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@WebAppConfiguration
@Log4j
public class ControllerTests {

	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	/*
	 * @Test public void testList() throws Exception {
	 * log.info(mockMvc.perform(MockMvcRequestBuilders.get("/inquire")).andReturn().
	 * getModelAndView().getModelMap()); }
	 * 
	 * 
	 * @Test public void testRegister() throws Exception{ String resultPage =
	 * mockMvc.perform(MockMvcRequestBuilders.post("/inquire/register")
	 * .param("title", "테스트 문의") .param("content", "테스트 문의 내용") .param("writer",
	 * "user00")).andReturn().getModelAndView().getViewName(); log.info(resultPage);
	 * }
	 *
	 * @Test public void testGet() throws Exception {
	 * log.info(mockMvc.perform(MockMvcRequestBuilders.get("/inquire/get").param(
	 * "ino", "22")).andReturn() .getModelAndView().getModelMap()); }
	 *
	 *
	 * @Test public void testModify() throws Exception { String resultPage = mockMvc
	 * .perform(MockMvcRequestBuilders.post("/inquire/modify").param("ino",
	 * "1").param("title", "수정된 문의 제목") .param("content",
	 * "수정된 문의 내용").param("writer", "Another"))
	 * .andReturn().getModelAndView().getViewName(); log.info(resultPage); }
	 *
	 * @Test public void testRemove() throws Exception { String resultPage =
	 * mockMvc.perform(MockMvcRequestBuilders.post("/inquire/remove").param("ino",
	 * "41")) .andReturn().getModelAndView().getViewName(); log.info(resultPage); }
	 * 
	 */
	@Test
	public void testListPaging() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/replies/pages").param("fno", "6").param("page", "1"))
						.andReturn().getModelAndView().getModelMap());
	}

}
