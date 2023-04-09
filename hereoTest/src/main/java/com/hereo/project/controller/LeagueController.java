package com.hereo.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.MembersService;



@Controller
public class LeagueController {
	@Autowired
	MembersService membersService;
	
	@RequestMapping(value = "/league/league-search", method = RequestMethod.GET)
	public ModelAndView leagueSearch(ModelAndView mv) {
		mv.setViewName("/league/league-search");
		return mv;
	}
	
	
	
	
}
	
