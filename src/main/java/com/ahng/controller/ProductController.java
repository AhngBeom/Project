package com.ahng.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
import com.ahng.domain.PageDTO;
import com.ahng.domain.ProductAttachVO;
import com.ahng.domain.ProductVO;
import com.ahng.service.CartService;
import com.ahng.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService pdtService;
	@Autowired
	private CartService cartService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list(Criteria cri, Model model) {
		log.info("List : " + cri);
		log.info("Total : " + pdtService.getTotal(cri));
		model.addAttribute("pdt", pdtService.getListWithPaging(cri));
		model.addAttribute("page", new PageDTO(cri, pdtService.getTotal(cri)));
		return "/product/list";
	}

	@RequestMapping(value = "/list2", method = RequestMethod.GET)
	public void list2(Criteria cri, Model model) {
		log.info("List : " + cri);
		log.info("Total : " + pdtService.getTotal(cri));
		model.addAttribute("pdt", pdtService.getListWithPaging(cri));
		model.addAttribute("page", new PageDTO(cri, pdtService.getTotal(cri)));
	}

	@GetMapping("/get")
	public void get(@RequestParam("pno") Long pno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("pdt", pdtService.get(pno));
	}

	@GetMapping(value = "/get/{pno}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<ProductVO> get(@PathVariable("pno") Long pno) {
		return new ResponseEntity<>(pdtService.get(pno), HttpStatus.OK);
	}

	@GetMapping("/getAttachList")
	@ResponseBody
	public ResponseEntity<List<ProductAttachVO>> getAttachList(Long pno) {
		return new ResponseEntity<>(pdtService.getAttachList(pno), HttpStatus.OK);
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/orderDirect")
	public void directOrder(@RequestParam("pno") Long pno, Model model) {
		model.addAttribute("item", pdtService.get(pno));
	}

	@GetMapping("/orderCart")
	public void cartOrder(Model model, Principal pc) {
		model.addAttribute("item", cartService.getList(pc.getName()));
	}
}
