package com.hereo.project.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.hereo.project.service.LeagueService;
import com.hereo.project.service.MembersService;
import com.hereo.project.service.RecordService;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerrecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;



@Controller
public class LeagueController {

	@Autowired
	LeagueService leagueService;
	@Autowired
	RecordService recordService;
	@Autowired
	MembersService memberService;
	
	@RequestMapping(value = "/league/leagueSearch", method = RequestMethod.GET)
	public ModelAndView leagueSearch(ModelAndView mv) {
		mv.setViewName("/league/league-search");
		return mv;
	}
	
	@RequestMapping(value = "/league/main", method = RequestMethod.GET)
	public ModelAndView leagueMain(ModelAndView mv) {
		
		mv.setViewName("/league/league-main");
		return mv;
	}
	@RequestMapping(value = "/league/recordHit", method = RequestMethod.GET)
	public ModelAndView leagueRecordHit(ModelAndView mv) {
		ArrayList<PlayerrecordHitterVO> hList = recordService.getSelectAllHitRecord();

		mv.addObject("hList", hList);
		mv.setViewName("/league/league-record-hit");
		return mv;
	}
	@RequestMapping(value = "/league/recordPit", method = RequestMethod.GET)
	public ModelAndView leagueRecordPit(ModelAndView mv) {
		mv.setViewName("/league/league-record-pit");
		return mv;
	}
	@RequestMapping(value = "/league/recordTeam", method = RequestMethod.GET)
	public ModelAndView leagueRecordTeam(ModelAndView mv) {
		mv.setViewName("/league/league-record-team");
		return mv;
	}
	@RequestMapping(value = "/league/schedule", method = RequestMethod.GET)
	public ModelAndView leagueSchedule(ModelAndView mv) {
		
		mv.setViewName("/league/league-schedule");
		return mv;
	}
	@RequestMapping(value = "/league/enroll", method = RequestMethod.GET)
	public ModelAndView leagueEnroll(ModelAndView mv) {
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
	
