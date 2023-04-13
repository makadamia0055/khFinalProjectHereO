package com.hereo.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hereo.project.service.CommuService;
import com.hereo.project.utils.MessageUtils;
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
	public String writing(
			HttpServletRequest request, 
			HttpServletResponse response,
			Model model
			) {
		String referer = request.getHeader("Referer");
		MembersVO user=(MembersVO)request.getSession().getAttribute("loginUser");
		if (user==null) {
			MessageUtils.alertAndGoPrepage(response, "로그인 기능이 필요한 서비스입니다.", referer);
		}
		return "/community/commu-writingboard";
		
	}
}
	
