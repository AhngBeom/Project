package com.ahng.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		log.info(request.getHeader("referer"));
		response.sendRedirect("redirect:" + request.getHeader("referer"));
	}
//	
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public void logout(HttpServletRequest request, HttpServletResponse response) {
//		log.info(request.getHeader("referer"));
//	}

}
