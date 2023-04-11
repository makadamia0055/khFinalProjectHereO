package com.hereo.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.pagination.PageMaker;
import com.hereo.project.service.LeagueService;
import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueParticipationteamVO;






@Controller
public class LeagueController {
	
	LeagueService leagueService;
	
	@RequestMapping(value = "/league/main", method = RequestMethod.GET)
	public ModelAndView leagueMain(ModelAndView mv) {
		mv.setViewName("/league/league-main");
		return mv;
	}
	@RequestMapping(value = "/league/recodeHit", method = RequestMethod.GET)
	public ModelAndView leagueRecodeHit(ModelAndView mv) {
		mv.setViewName("/league/league-recode-hit");
		return mv;
	}
	@RequestMapping(value = "/league/recodePit", method = RequestMethod.GET)
	public ModelAndView leagueRecodePit(ModelAndView mv) {
		mv.setViewName("/league/league-recode-pit");
		return mv;
	}
	@RequestMapping(value = "/league/recodeTeam", method = RequestMethod.GET)
	public ModelAndView leagueRecodeTeam(ModelAndView mv) {
		mv.setViewName("/league/league-recode-team");
		return mv;
	}
	@RequestMapping(value = "/league/schedule", method = RequestMethod.GET)
	public ModelAndView leagueSchedule(ModelAndView mv) {
		mv.setViewName("/league/league-schedule");
		return mv;
	}
	@RequestMapping(value = "/league/enroll", method = RequestMethod.GET)
	public ModelAndView leagueEnroll(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(10);
		ArrayList<LeagueAttributeVO> list = leagueService.getLeagueAttribute(cri);
		int totalCount = leagueService.getTotalCountLeagueParticipationteam(cri);
		int displayPageNum = 1;
		PageMaker pm = new PageMaker(totalCount, displayPageNum, cri);
		mv.addObject("list",list);
		mv.addObject("pm",pm);
		mv.setViewName("/league/league-enroll");
		return mv;
	}
	@RequestMapping(value = "/league/partimanagerment", method = RequestMethod.GET)
	public ModelAndView leaguePartiManagerment(ModelAndView mv) {
		mv.setViewName("/league/league-parti-managerment");
		return mv;
	}
	@RequestMapping(value = "/league/schedulemanagerment", method = RequestMethod.GET)
	public ModelAndView leagueScheduleManagerment(ModelAndView mv) {
		mv.setViewName("/league/league-schedule-managerment");
		return mv;
	}
	
	
	
	
}
	
