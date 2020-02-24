package com.ahng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ahng.domain.Criteria;
import com.ahng.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	private ProductService service;
	
	@GetMapping("/all")
	public void all(Criteria cri, Model model) {
		model.addAttribute("pdt", service.getList(cri));
	}
	@GetMapping("/category1")
	public void category1() {

	}
	@GetMapping("/category2")
	public void category2() {

	}
	
	@GetMapping("/get")
	public void get(@RequestParam("pno") Long pno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("pdt", service.get(pno));
		//model.addAttribute("attach", service.getAttachList(pno));
	}
	
}
