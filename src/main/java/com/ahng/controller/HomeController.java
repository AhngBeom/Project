package com.ahng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ahng.domain.Criteria;
import com.ahng.domain.PageDTO;
import com.ahng.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {

	@Autowired
	private ProductService pdtService;

//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(@RequestParam(value = "ctg", defaultValue = "%") String ctg, Criteria cri, Model model) {
//		log.info("List : " + cri);
//		log.info("Total : " + pdtService.getTotal(cri, ctg));
//		model.addAttribute("pdt", pdtService.getListWithPaging(cri, ctg));
//		model.addAttribute("page", new PageDTO(cri, pdtService.getTotal(cri, ctg)));
//		return "/product/all";
//	}

}
