package com.hereo.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hereo.project.service.CommuService;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.MembersVO;


@Controller
public class CommuController {
	@Autowired
	CommuService boardService;
	
	@GetMapping(value = "/community")
	public String Home01() {
		return "/community/free-board";
	}	
	@GetMapping(value = "/community/free")
	public String home02() {
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
	public String writing(HttpServletRequest request) {
		MembersVO user=(MembersVO)request.getSession().getAttribute("loginUser");
		ArrayList<BoardTypeVO> btList = boardService.getBoardType(user.getMe_siteauth());
		
		return "/community/commu-writingboard";
	}
}
	
