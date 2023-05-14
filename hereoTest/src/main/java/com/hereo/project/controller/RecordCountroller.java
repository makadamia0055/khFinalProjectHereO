package com.hereo.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.PlayerService;
import com.hereo.project.service.RecordService;
import com.hereo.project.service.ScheduleService;
import com.hereo.project.vo.BatterBoxEventVO;
import com.hereo.project.vo.MatchInningVO;
import com.hereo.project.vo.MatchRecordVO;
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
	
	@RequestMapping(value = "/record/insert", method = RequestMethod.GET)
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
	@ResponseBody
	@RequestMapping(value="/record/matchRecordPost", method=RequestMethod.POST)
	public Map<String, Object>getMatchRecordPost(@RequestBody MatchRecordVO matchRecord) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = recordService.insertOrUpdateMatchRecord(matchRecord);
		map.put("res", res);
		map.put("matchRecord", matchRecord);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/record/matchInningPost", method=RequestMethod.POST)
	public Map<String, Object>getMatchInningPost(@RequestParam(value="homeTeamList") String matchInningList) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = recordService.insertOrUpdateMatchInning(matchInningList);
		
		
		return map;
	}
	
}
