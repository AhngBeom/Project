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

	@GetMapping("/product/cart")
	public void cart(Model model, Principal pc) {
		model.addAttribute("item", service.getList(pc.getName()));
	}

	@GetMapping(value = "/cartList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ProductVO>> cartList(String userID, Principal pc) {
		log.info(pc.getName());
		return new ResponseEntity<>(service.getList(pc.getName()), HttpStatus.OK);
	}
	@GetMapping(value = "/cartListId", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ProductVO>> cartList(String userID) {
		log.info(userID);
		return new ResponseEntity<>(service.getList(userID), HttpStatus.OK);
	}

	@GetMapping(value = "/cartRead", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<CartVO>> cartRead(String userID) {
		return new ResponseEntity<>(service.get(userID), HttpStatus.OK);
	}

	@PostMapping(value = "/cartAdd", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> cartAdd(@RequestBody CartVO vo) {
		log.info("CartVO : " + vo);
		int insertCNT = service.register(vo);
		log.info("Cart INSERT COUNT : " + (insertCNT == 1 ? "Success" : "Failure"));

		return insertCNT == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping(value = "/cartItemDel")
	public String remove(@RequestParam("userID") String userID, @RequestParam("pno") Long pno,
			RedirectAttributes rttr) {
		log.info("Cart DELETE : " + userID + ", " + pno);
		boolean deleteCnt = service.remove(userID, pno);
		log.info("Cart DELETE COUNT : " + (deleteCnt == true ? "Success" : "Failure"));
		return "redirect:/product/cart";
	}

	@PostMapping("/cartAllDel")
	public String CartAllItemDelete(RedirectAttributes rttr) {
		boolean deleteCnt = service.Allremove();
		log.info("Cart DELETE COUNT : " + (deleteCnt == true ? "Success" : "Failure"));
		return "redirect:/product/cart";
	}

}
