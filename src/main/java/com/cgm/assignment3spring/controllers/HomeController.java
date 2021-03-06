package com.cgm.assignment3spring.controllers;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cgm.assignment3spring.builders.ArtefactBuilder;
import com.cgm.assignment3spring.entities.Message;
import com.cgm.assignment3spring.entities.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		// System.out.println(request.getSession().getAttribute("logged"));
		if (request.getSession().getAttribute("logged") == null) {
			request.getSession().setAttribute("logged", false);
		}

		if (request.getSession().getAttribute("logged").equals(true)) {
			ArrayList<Message> messagesForCurrentUser = new ArrayList<Message>();
			User currentUser = (User) request.getSession().getAttribute("userAccount");
			for (Message message : ArtefactBuilder.getMessages()) {
				if (message.getMessageAuthor().equals(currentUser) || currentUser.getFriends().contains(message.getMessageAuthor())) {
					messagesForCurrentUser.add(message);
				}
			}
			model.addAttribute("messages", messagesForCurrentUser);
		}
		
		model.addAttribute("message", new Message());
		return new ModelAndView("home", model.asMap());
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView postMessage(@ModelAttribute("message") Message message, Model model, HttpServletRequest request) {
		message.setMessageAuthor((User) request.getSession().getAttribute("userAccount"));
		ArtefactBuilder.getMessageQueue().addMessage(message);
		System.out.println("ADDED THE MESSAGE: " + message.getMessageAuthor() + " " + message.getMessageText());
		return new ModelAndView("redirect:/", model.asMap());
	}
}
