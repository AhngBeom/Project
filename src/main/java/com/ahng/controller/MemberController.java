package com.ahng.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ahng.domain.OrderVO;
import com.ahng.service.OrderService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/member/*")
@Controller
@Log4j
public class MemberController {

	@Autowired
	private OrderService service;

	@GetMapping("/info")
	public void doMember(Model model) {
		log.info("logined member");
	}

	@GetMapping("/orderList")
	public void orderList(Principal pc, Model model) {
		List<OrderVO> vo = service.orderList(pc.getName());
		model.addAttribute("order", vo);
//		log.info(vo.);
	}

}
