package com.hereo.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.pagination.PageMaker;
import com.hereo.project.service.PlayerService;
import com.hereo.project.service.TeamService;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.TeamVO;

@Controller
public class TeamController {
	@Autowired
	TeamService teamService;
	@Autowired
	PlayerService playerService;
	
//	팀 메인 페이지 
	@RequestMapping(value = "/team/main", method = RequestMethod.GET)
	public ModelAndView teamMainPage(ModelAndView mv, Criteria cri) {
		PageMaker pm = new PageMaker();
		int totalCount = teamService.countTeams();
		if(cri==null) {
			cri = new Criteria();
		}
		pm.setCri(cri);
		pm.setTotalCount(totalCount);
		ArrayList<TeamVO> teamList = teamService.selectAllTeams(pm.getCri());
		mv.addObject("teamList", teamList);
		mv.addObject("pm", pm);
		mv.setViewName("/team/team-main");
		return mv;
	}
	
//	팀 개별 페이지
	@RequestMapping(value = "/team/sep", method = RequestMethod.GET)
	public ModelAndView teamMainPage(ModelAndView mv, Integer teamNum) {
		TeamVO tmpTeam = teamService.selectTeamByTm_Num(teamNum);
		
		mv.addObject("team", tmpTeam);
		mv.setViewName("/team/team-sep");
		return mv;
	}
//	팀 전체 선수 페이지
	@RequestMapping(value = "/team/wholeplayer", method = RequestMethod.GET)
	public ModelAndView teamWholePlayer(ModelAndView mv, Integer teamNum) {
		ArrayList<PlayerVO> playerList = playerService.selectPlayerByTm_Num(teamNum);
		
		
		mv.addObject("playerList", playerList);
		mv.setViewName("/team/team-wholeplayer");
		return mv;
	}
//	선수 디테일 페이지(일단 이걸로 구현)
	@RequestMapping(value = "/team/pdetail", method = RequestMethod.GET)
	public ModelAndView teamPlayerDetail(ModelAndView mv, Integer player) {
		PlayerVO tmpPlayer = playerService.selectPlayerByPl_Num(player);
		mv.addObject("Player", tmpPlayer);
		mv.setViewName("/team/team-playerdetail");
		return mv;
	}
//	팀 신청 페이지(일단 이걸로 구현)
	@RequestMapping(value = "/team/create", method = RequestMethod.GET)
	public ModelAndView teamCreate(ModelAndView mv) {
		
		mv.setViewName("/team/team-create");
		return mv;
	}

	
	
}
