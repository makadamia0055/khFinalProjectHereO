package com.hereo.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@RequestMapping(value = "/team/main", method = RequestMethod.GET)
	public ModelAndView tempTeam(ModelAndView mv) {
		mv.setViewName("/team/team-main");
		return mv;
	}
}
	
