package com.ahng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;
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

	@GetMapping("/category")
	public void category(@RequestParam("cate") String category, Model model) {
		model.addAttribute("pdt", service.categoryList(category));
	}

	@GetMapping("/category2")
	public void category2() {

	}
	
	@GetMapping("/category3")
	public void category3() {

	}

	@GetMapping("/get")
	public void get(@RequestParam("pno") Long pno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("pdt", service.get(pno));
		// model.addAttribute("attach", service.getAttachList(pno));
	}

	@GetMapping(value = "/get/{pno}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<ProductVO> get(@PathVariable("pno") Long pno) {
		return new ResponseEntity<>(service.get(pno), HttpStatus.OK);
	}
}
