package com.hereo.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.MembersService;
import com.hereo.project.vo.MembersVO;


@Controller
public class HomeController {
	@Autowired
	MembersService membersService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "/home";
	}
	
	@GetMapping(value = "/login")
	public String login(HttpServletRequest request) {
		
		return "login_etc/login";
	}
	@PostMapping(value = "/login")
	public String loginPost(Model model, MembersVO user) {
		MembersVO loginUser = membersService.login(user);
		model.addAttribute("loginUser",loginUser);
		if(loginUser==null) {
			return "redirect:/login";
		} else {
			return "redirect:/login";
		}
	}
	@GetMapping(value = "/signup")
	public ModelAndView signupGet(ModelAndView mv) {
		mv.setViewName("login_etc/signup");
		return mv;
	}
	
	@PostMapping(value = "/signup")
	public ModelAndView signupPost(ModelAndView mv, MembersVO user) {
		boolean isSignup = membersService.insertUser(user);
		if(isSignup) {
		mv.setViewName("redirect:/");
		} else {
			mv.setViewName("redirect:/signup");
		}
		return mv;
	}
	
	
}
	
