package com.ahng.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		log.warn("Login Success " + request.getHeader("Referer"));
		List<String> roleName = new ArrayList<>();
		auth.getAuthorities().forEach(authority -> {
			roleName.add(authority.getAuthority());
		});
		log.warn("ROLE NAMES : " + roleName);
//		if (roleName.contains("ROLE_ADMIN")) {
//			response.sendRedirect("/admin/pdtTable");
//			return;
//		}
//		if (roleName.contains("ROLE_MEMBER")) {
//			response.sendRedirect("/product");
//			return;
//		}
		response.sendRedirect("/product");
	}

}
