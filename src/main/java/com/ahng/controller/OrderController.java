package com.ahng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ahng.domain.OrderVO;
import com.ahng.service.OrderService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class OrderController {

	@Autowired
	private OrderService service;

	@PostMapping("/orderRegister")
	public String orderRegister(OrderVO vo, RedirectAttributes rttr) {
		service.register(vo);
		return "/member/info";
	}

}
