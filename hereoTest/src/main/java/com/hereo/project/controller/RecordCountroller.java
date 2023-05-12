package com.hereo.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.RecordService;

@Controller
public class RecordCountroller {
	
	@Autowired
	RecordService recordService;
	
	@RequestMapping(value = "/record/insert")
	public ModelAndView leagueEnroll(ModelAndView mv) {
		mv.setViewName("/record/record-insert");
		return mv;
	}
	
}
