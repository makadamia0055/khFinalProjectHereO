package com.hereo.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("/home");
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("login_etc/login");
		return mv;
	}
	
	@GetMapping(value = "/signup")
	public ModelAndView signupGet(ModelAndView mv) {
		mv.setViewName("login_etc/signup");
		return mv;
	}
	
	@PostMapping(value = "/signup")
	public ModelAndView signupPost(ModelAndView mv, MembersVO user) {
		membersService.insertUser(user);
		mv.setViewName("redirect:/");
		return mv;
	}
	
	
}
	
