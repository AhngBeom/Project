package com.ahng.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ahng.domain.OrderVO;
import com.ahng.domain.ProductVO;
import com.ahng.service.CartService;
import com.ahng.service.OrderService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/member/*")
@Controller
@Log4j
public class MemberController {

	@Autowired
	private OrderService service;
	@Autowired
	private CartService cartService;

	@GetMapping("/info")
	public void doMember(Model model) {
		log.info("logined member");
	}
	
	@GetMapping("/cart")
	public void cart(Model model, String userid) {
		model.addAttribute("item", cartService.getList(userid));
	}
	
	@GetMapping("/orderList")
	public void orderList(Principal pc, Model model) {
		model.addAttribute("orderPdt", service.orderPdtList(""));
		model.addAttribute("order", service.orderList(pc.getName()));
//		log.info(vo.);
	}
	
	@GetMapping(value = "/orderPdtList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ProductVO>> orderPdtList(String orderNumber, Principal pc, Model model) {
//		model.addAttribute(service.orderPdtList(orderNumber));
		return new ResponseEntity<>(service.orderPdtList(orderNumber), HttpStatus.OK);
	}

}
