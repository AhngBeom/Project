package com.ahng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ahng.domain.Criteria;
import com.ahng.service.ProductService;

@Controller
@RequestMapping("/pages/*")
public class PageController {
	@Autowired
	private ProductService pdtService;
	@GetMapping("/test")
	public void Test(Criteria cri, Model model) {
		model.addAttribute("pdt", pdtService.getList(cri));
	}
	
	@GetMapping("/401")
	public void error401() {

	}

	@GetMapping("/404")
	public void error404() {

	}

	@GetMapping("/500")
	public void error500() {

	}

	@GetMapping("/index")
	public void index() {

	}

	@GetMapping("/charts")
	public void charts() {

	}

	@GetMapping("/layout-sidenav-light")
	public void layoutSidenavLight() {

	}

	@GetMapping("/layout-static")
	public void layoutStatic() {

	}

	@GetMapping("/login")
	public void login() {

	}

	@GetMapping("/password")
	public void password() {

	}

	@GetMapping("/register")
	public void register() {

	}

	@GetMapping("/tables")
	public void tables() {

	}

}
