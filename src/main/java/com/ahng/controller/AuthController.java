package com.ahng.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ahng.domain.MemberVO;
import com.ahng.domain.OrderVO;
import com.ahng.service.MemberService;
import com.ahng.service.OrderService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/auth/*")
@Log4j
public class AuthController {

	@Autowired
	private PasswordEncoder pwencoder;
	@Autowired
	private MemberService service;
	@Autowired
	private OrderService orderService;

	@PostMapping("/register")
	public String register(MemberVO vo, RedirectAttributes rttr) {
		vo.setUserpw(pwencoder.encode(vo.getUserpw()));
		log.info(vo);
		service.register(vo);
		return "/auth/member";
	}

	@GetMapping("/login")
	public void loginGET(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if (logout != null) {
			model.addAttribute("logout", "Logout!!!");
		}
	}

	@PostMapping("/login")
	public void loginPOST() {
	}

	@GetMapping("/logout")
	public void logoutGET() {
		log.info("GETMAPPING Logout");
	}

	@PostMapping("/logout")
	public void logoutPOST() {
		log.info("POSTMAPPING Logout");
	}

	@GetMapping("/password")
	public void password() {

	}

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied");
	}

	@GetMapping("/all")
	public void doAll() {
		log.info("do all can access everybody");
	}

	@GetMapping("/admin")
	public void doAdmin() {
		log.info("admin only");
	}
}
