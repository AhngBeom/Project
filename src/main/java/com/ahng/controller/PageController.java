package com.ahng.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ahng.domain.OrderVO;
import com.ahng.domain.ProductVO;
import com.ahng.service.OrderService;
import com.ahng.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/pages/*")
@Log4j
public class PageController {
	@Autowired
	private ProductService pdtService;
	@Autowired
	private OrderService orderService;

	@GetMapping("/test")
	public void Test(ProductVO vo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		log.info(session);
		ProductVO pdt = pdtService.get(29L);
		model.addAttribute("pdt", pdt);
		session.setAttribute("pdt", pdt);
	}

	@PostMapping("/postTest")
	public String TestPost(OrderVO vo, RedirectAttributes rttr) {
		log.info("===========================================");
		orderService.register(vo);
		log.info("===========================================");
		log.info("OrderVO : " + vo);
//		vo.getPdtOnOrder().forEach(pdt -> {
//			pdt.setOrderNumber(vo.getOrderNumber());
//			log.info("ProductOnOrderVO : " + pdt);
//		});
		return "redirect:/pages/test";
	}

	@GetMapping("/register")
	public void register() {

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

	@GetMapping("/tables")
	public void tables() {

	}

}
