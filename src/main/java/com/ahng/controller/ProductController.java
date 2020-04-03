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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;
import com.ahng.service.CartService;
import com.ahng.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	private ProductService pdtService;
	@Autowired
	private CartService cartService;

	@GetMapping("/all")
	public void all(Criteria cri, Model model) {
		model.addAttribute("pdt", pdtService.getList(cri));
	}

	@GetMapping("/category")
	public void category(@RequestParam("cate") String category, Model model) {
		model.addAttribute("pdt", pdtService.categoryList(category));
	}

	@GetMapping("/get")
	public void get(@RequestParam("pno") Long pno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("pdt", pdtService.get(pno));
		// model.addAttribute("attach", pdtService.getAttachList(pno));
	}

	@GetMapping(value = "/get/{pno}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<ProductVO> get(@PathVariable("pno") Long pno) {
		return new ResponseEntity<>(pdtService.get(pno), HttpStatus.OK);
	}
	
	@GetMapping("/orderDirect")
	public void directOrder(@RequestParam("pno") Long pno, Model model) {
		model.addAttribute("order", pdtService.get(pno));
	}
	
	@GetMapping("/orderCart")
	public void cartOrder(Model model) {
		model.addAttribute("item", cartService.getList("unknown"));
	}
}
