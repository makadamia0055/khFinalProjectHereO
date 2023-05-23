package com.hereo.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.CommuService;
import com.hereo.project.service.MembersService;
import com.hereo.project.service.TeamService;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.TeamVO;


@Controller
public class HomeController {
	@Autowired
	MembersService membersService;
	
	@Autowired
	CommuService commuService;
	
	@Autowired
	TeamService teamService;
	
	
	@GetMapping(value = {"/","/home"})
	public String home(Model model) {
		ArrayList<BoardVO> hotList = commuService.getAllBoardForHot();
		ArrayList<TeamVO> newTeam = teamService.getNewTeam();
		
		model.addAttribute("hot", hotList);
		model.addAttribute("team", newTeam);
		return "/home";
	}
	//회원가입 기능
	@GetMapping(value = "/signup")
	public String signupGet() {
		return "/login_etc/signup";
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
	//로그인 기능
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
			loginUser.setAutoLogin(user.isAutoLogin());
			//System.out.println("체크용"+loginUser);
			return "redirect:/login";
		}		
	}
	//로그아웃 기능
	@GetMapping(value = "/logout")
	public String logout(HttpServletResponse response, HttpSession session) {
		//추후 자동로그인 기능을 위해 user남겨둠
		MembersVO loginUser = (MembersVO)session.getAttribute("loginUser");
		loginUser.setMe_session_limit(null);
		membersService.updateAutoLoginSession(loginUser);
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	@ResponseBody
	@PostMapping(value ="/sign/idcheck")
	public String idCheck(@RequestParam("me_id") String me_id) {
		System.out.println(me_id);
		String data="";
		if(me_id==null || me_id.length()==0) {
			data="null";					
		}else {
			MembersVO id = membersService.idCheck(me_id);
			if(id==null || id.getMe_id()==null) {
				data="y";
			}else { 
				data="n";
			}
		}
		System.out.println(data);
		return data;
	}
}
	
