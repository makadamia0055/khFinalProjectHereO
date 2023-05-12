package com.hereo.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.PlayerService;
import com.hereo.project.service.RecordService;
import com.hereo.project.service.ScheduleService;
import com.hereo.project.vo.BatterBoxEventVO;
import com.hereo.project.vo.MatchScheduleVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.TeamPlayerVO;

@Controller
public class RecordCountroller {
	
	@Autowired
	RecordService recordService;
	@Autowired
	ScheduleService scheduleService;
	@Autowired
	PlayerService playerService;
	
	@RequestMapping(value = "/record/insert")
	public ModelAndView recordInsert(ModelAndView mv, Integer ms_num) {
//		임시 코드
		if(ms_num == null)
			ms_num =1;
		
		ArrayList<BatterBoxEventVO> bbList = recordService.getAllBatterBoxEventList();
		MatchScheduleVO ms = scheduleService.selectMatchScheduleByMsNum(ms_num);
		
		
		ArrayList<TeamPlayerVO> homeTPlayerList = playerService.selectTPByTmNum(ms.getHomeTeam().getTm_num());
		ArrayList<PlayerVO> homePlayerList = playerService.selectPlayerByTm_Num(ms.getHomeTeam().getTm_num());
		ArrayList<TeamPlayerVO> awayTPlayerList = playerService.selectTPByTmNum(ms.getAwayTeam().getTm_num());
		ArrayList<PlayerVO> awayPlayerList = playerService.selectPlayerByTm_Num(ms.getAwayTeam().getTm_num());
		
		mv.addObject("hTPlayerList", homeTPlayerList);
		mv.addObject("hPlayerList", homePlayerList);
		mv.addObject("aTPlayerList", awayTPlayerList);
		mv.addObject("aPlayerList", awayPlayerList);
		mv.addObject("bbList", bbList);
		mv.addObject("ms", ms);
		mv.setViewName("/record/record-insert");
		return mv;
	}
	
}
