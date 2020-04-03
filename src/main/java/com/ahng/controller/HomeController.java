package com.ahng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ahng.domain.Criteria;
import com.ahng.service.ProductService;

@Controller
public class HomeController {

	@Autowired
	private ProductService pdtService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Criteria cri, Model model) {
		model.addAttribute("pdt", pdtService.getList(cri));
		return "/product/all";
	}

}
