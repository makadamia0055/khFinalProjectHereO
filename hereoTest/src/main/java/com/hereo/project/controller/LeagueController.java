package com.hereo.project.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.dao.RegionDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.pagination.PageMaker;
import com.hereo.project.service.LeagueService;
import com.hereo.project.service.MembersService;
import com.hereo.project.service.RecordService;
import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueParticipationteamVO;
import com.hereo.project.vo.LeagueScheduleVO;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerrecordHitterVO;
import com.hereo.project.vo.RegionVO;
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
	@Autowired
	RegionDAO regionDao;
	
	@RequestMapping(value = "/league/leagueSearch", method = RequestMethod.GET)
	public ModelAndView leagueSearch(ModelAndView mv , Criteria cri) {
		int totalCount = leagueService.countLeague("활동중", cri);
		if(cri==null) {
			cri = new Criteria();
		}
		cri.setPerPageNum(8);
		PageMaker pm = new PageMaker(totalCount, 8, cri);	
		
		ArrayList<LeagueVO> leagueList = leagueService.selectLeaguesByCriAndState( "활동중", pm.getCri());
		
		RegionVO[] regionArr = regionDao.selectAllRegion();
		
		mv.addObject("league", leagueList);
		mv.addObject("region", regionArr);
		mv.addObject("pm", pm);
		mv.setViewName("/league/league-search");
		return mv;
	}
	
	@RequestMapping(value = "/league/main{lg_num}", method = RequestMethod.GET)
	public ModelAndView leagueMain(ModelAndView mv, @PathVariable("lg_num")int lg_num) {
		ArrayList<LeagueVO> league = leagueService.selectLeagueByLgNum(lg_num);
		ArrayList<LeagueAttributeVO> leagueAtt = leagueService.selectLeagueAttByLgNum(lg_num);
		ArrayList<LeagueScheduleVO> leagueSche = leagueService.selectLeagueSchedule(lg_num);

		mv.addObject("leagueSche", leagueSche);
		mv.addObject("leagueAtt",leagueAtt);
		mv.addObject("league", league);
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
	
