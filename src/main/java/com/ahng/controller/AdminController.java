package com.ahng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;
import com.ahng.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {

	@Autowired
	private ProductService service;

	@GetMapping("/pdtAdd")
	public void pdtAddGET() {

	}

	@PostMapping("/pdtAdd")
	public String pdtAddPOST(ProductVO vo, RedirectAttributes rttr) {

		log.info("===============================================");
//		if(vo.getAttachList() != null) {
//			vo.getAttachList().forEach(attach -> log.info(attach));
//		}
		log.info(vo);
		log.info("===============================================");

		service.register(vo);
		rttr.addFlashAttribute("result", vo.getPno());
		return "redirect:/product/all";
	}

	@GetMapping("/pdtModify")
	public void productModify(@RequestParam("pno") Long pno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("pdt", service.get(pno));
		// model.addAttribute("attach", service.getAttachList(pno));
	}

	@GetMapping("/pdtTable")
	public void pdtTable(Criteria cri, Model model) {
		model.addAttribute("pdt", service.getList(cri));
	}
}
