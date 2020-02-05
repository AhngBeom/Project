package com.ahng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ahng.domain.Criteria;
import com.ahng.domain.InquireVO;
import com.ahng.domain.PageDTO;
import com.ahng.service.InquireService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/inquire/*")
@AllArgsConstructor
@Log4j
public class InquireController {

	private InquireService service;

	@GetMapping("/list")
	public void inquirePage(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("/register")
	public void registerGet() {

	}

	@PostMapping("/register")
	public String registerPost(InquireVO vo, RedirectAttributes rttr) {
		log.info("Register : " + vo);
		service.register(vo);
		rttr.addFlashAttribute("result", vo.getIno());
		return "redirect:/inquire/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void getOrModify(@RequestParam("ino") Long ino, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("iq", service.get(ino));
	}

	@PostMapping("/modify")
	public String modify(InquireVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if (service.modify(vo)) {
			rttr.addFlashAttribute("result", "success_modify");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/inquire/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("ino") Long ino, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if (service.remove(ino)) {
			rttr.addFlashAttribute("result", "success_remove");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/inquire/list";
	}

}
