package com.cgm.assignment3spring.controllers;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutController {
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(Locale locale, Model model, HttpServletRequest request) {
		request.getSession().setAttribute("logged", false);
		request.getSession().removeAttribute("userAccount");
		//System.out.println("LOGGED OUT");
		return new ModelAndView("redirect:/", model.asMap());
	}
}
