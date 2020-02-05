package com.ahng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ahng.domain.Criteria;
import com.ahng.domain.PageDTO;
import com.ahng.service.InquireService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {
	
	@GetMapping("/intro")
	public void intro() {
		
	}
	
	@GetMapping("/developer")
	public void dev() {
		
	}
	
	@GetMapping("/feed_test")
	public void test(Criteria cri, Model model) {
		
	}
	
	@GetMapping("/example")
	public void ex() {
		
	}

}
