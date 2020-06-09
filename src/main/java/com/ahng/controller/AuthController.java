package com.ahng.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ahng.domain.MemberVO;
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

	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idCheck(vo);
		log.info(vo.getUserid() + " : " + result);
		return result;
	}

	@PostMapping("/register")
	public String register(MemberVO vo, RedirectAttributes rttr) {
		int result = service.idCheck(vo);
		try {
			if (result == 1) {
				return "/member/register";
			} else if (result == 0) {
				vo.setUserpw(pwencoder.encode(vo.getUserpw()));
				service.register(vo);
				rttr.addFlashAttribute("result", result);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/auth/login";
	}

	@PostMapping("/modify")
	public String modify(MemberVO vo, RedirectAttributes rttr, Principal pc) {
//		vo.setUserid(pc.getName());
		vo.setUserpw(pwencoder.encode(vo.getUserpw()));
		log.info(vo);
		if (service.modify(vo)) {
			log.info("Modify Complete");
			rttr.addFlashAttribute("result", "Member-Info-Update-Complete");
		}
		return "redirect:/logout";
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
//		else{
//			model.addAttribute("message", "회원가입이 정상적으로 완료되었습니다. 로그인해주세요");
//		}
	}

	@PostMapping("/login")
	public void loginPOST() {
	}

	@GetMapping("/logout")
	public String logoutGET(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		log.info("GETMAPPING Logout");
		log.info(request.getHeader("referer"));
		return "redirect:" + request.getHeader("referer");
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
		log.info("access Denied : " + auth.getAuthorities());
		model.addAttribute("memberAuth", auth.getAuthorities());
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
