package com.ahng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pages/*")
public class PageController {
	
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
