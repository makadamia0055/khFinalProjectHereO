package com.hereo.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.CommuService;


@Controller
public class CommuController {
	@Autowired
	CommuService boardService;
	
	@GetMapping(value = "/community/free")
	public String home() {
		return "/community/free-board";
	}	
	
	@GetMapping(value = "/community/eventAcid")
	public String eventAcid() {
		return "/community/eventAcid-board";
	}	
	
	@GetMapping(value = "/community/findHero")
	public String findHero() {
		return "/community/findHero-board";
	}
	
	@GetMapping(value = "/community/market")
	public String market() {
		return "/community/market-board";
	}
	
	@GetMapping(value = "/community/writing")
	public String writing() {
		return "/community/commu-writingboard";
	}
}
	
