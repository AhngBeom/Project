package com.ahng.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ahng.domain.CartVO;
import com.ahng.domain.ProductVO;
import com.ahng.service.CartService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CartController {

	@Autowired
	private CartService service;

	@GetMapping({"/product/cart", "/product/order"})
	public void cart(Model model) {
		model.addAttribute("item", service.getList("unknown"));
	}

	@GetMapping(value = "/cartList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ProductVO>> cartList(String userID) {
		return new ResponseEntity<>(service.getList(userID), HttpStatus.OK);
	}

	@PostMapping(value = "/cartAdd", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> cartAdd(@RequestBody CartVO vo) {
		log.info("CartVO : " + vo);
		int insertCNT = service.register(vo);
		log.info("Cart INSERT COUNT : " + (insertCNT == 1 ? "Success" : "Failure"));

		return insertCNT == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping("/cartItemDel")
	public String remove(@RequestParam("userID") String userID, @RequestParam("pno") Long pno, RedirectAttributes rttr) {
		service.remove(userID, pno);
		return "redirect:/product/cart";
	}

//	@PostMapping("/pdtAdd")
//	public String pdtAddPOST(ProductVO vo, RedirectAttributes rttr) {
//
//		log.info("===============================================");
//		if(vo.getAttachList() != null) {
//			vo.getAttachList().forEach(attach -> log.info(attach));
//		}
//		log.info(vo);
//		log.info("===============================================");
//
//		service.register(vo);
//		rttr.addFlashAttribute("result", vo.getPno());
//		return "redirect:/product/all";
//	}
//
//	@GetMapping("/pdtModify")
//	public void productModify(@RequestParam("pno") Long pno, @ModelAttribute("cri") Criteria cri, Model model) {
//		model.addAttribute("pdt", service.get(pno));
//		// model.addAttribute("attach", service.getAttachList(pno));
//	}
//
//	@GetMapping("/pdtTable")
//	public void pdtTable(Criteria cri, Model model) {
//		model.addAttribute("pdt", service.getList(cri));
//	}
}
