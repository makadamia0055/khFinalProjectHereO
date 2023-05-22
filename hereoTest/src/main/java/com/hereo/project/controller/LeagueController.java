package com.hereo.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.dao.RegionDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.pagination.PageMaker;
import com.hereo.project.service.LeagueService;
import com.hereo.project.service.MembersService;
import com.hereo.project.service.RecordService;
import com.hereo.project.utils.MessageUtils;
import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueParticipationteamVO;
import com.hereo.project.vo.LeagueScheduleVO;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerRecordHitterVO;
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
	MembersService membersService;
	@Autowired
	RegionDAO regionDao;
	
	@RequestMapping(value = "/league/leagueSearch", method = RequestMethod.GET) 
	public ModelAndView leagueSearch(ModelAndView mv , Criteria cri, HttpSession session) {
		MembersVO user = (MembersVO)session.getAttribute("user");
		int totalCount = leagueService.countLeague("활동중", cri);
		if(cri==null) {
			cri = new Criteria();
		}
		cri.setPerPageNum(6);
		PageMaker pm = new PageMaker(totalCount, 6, cri);	
		
		ArrayList<LeagueVO> leagueList = leagueService.selectLeaguesByCriAndState( "활동중", pm.getCri());
		
		RegionVO[] regionArr = regionDao.selectAllRegion();
		
		mv.addObject("user",user);
		mv.addObject("league", leagueList);
		mv.addObject("region", regionArr);
		mv.addObject("pm", pm);
		mv.setViewName("/league/league-search");
		return mv;
	}	
	
	@RequestMapping(value = "/league/main/{lg_num}", method = RequestMethod.GET)
	public ModelAndView leagueMain(ModelAndView mv, @PathVariable("lg_num")int lg_num) {
		//리그 메인페이지
		ArrayList<LeagueAttributeVO> leagueAtt = leagueService.selectLeagueAttByLgNum(lg_num);
		ArrayList<LeagueScheduleVO> leagueSche = leagueService.selectLeagueSchedule(lg_num);
		ArrayList<LeagueParticipationteamVO> leagueParti = leagueService.getSelectLeagueParti(lg_num);

		mv.addObject("leagueParti", leagueParti);
		mv.addObject("leagueSche", leagueSche);
		mv.addObject("leagueAtt",leagueAtt);
		mv.addObject("lg_num", lg_num);
		mv.setViewName("/league/league-main");
		return mv;
	}
	@RequestMapping(value = "/league/recordHit/{lg_num}", method = RequestMethod.GET)
	public ModelAndView leagueRecordHit(ModelAndView mv, @PathVariable("lg_num")int lg_num
			, Criteria cri) {	
		int totalCount = leagueService.countLeaguePlayer(cri);
		if(cri==null) {
			cri = new Criteria();
		}
		cri.setPerPageNum(10);
		PageMaker pm = new PageMaker(totalCount, 10, cri);
		//리그 기록실 타자기록페이지
		ArrayList<PlayerRecordHitterVO> hList = recordService.getSelectLeagueHitRecord(lg_num, cri);

		mv.addObject("lg_num", lg_num);
		mv.addObject("hList", hList);
		mv.addObject("pm", pm);
		mv.setViewName("/league/league-record-hit");
		return mv;
	}
	@RequestMapping(value = "/league/recordPit/{lg_num}", method = RequestMethod.GET)
	public ModelAndView leagueRecordPit(ModelAndView mv, @PathVariable("lg_num")int lg_num) {
		
		mv.setViewName("/league/league-record-pit");
		mv.addObject("lg_num", lg_num);
		return mv;
	}
	@RequestMapping(value = "/league/recordTeam/{lg_num}", method = RequestMethod.GET)
	public ModelAndView leagueRecordTeam(ModelAndView mv, @PathVariable("lg_num")int lg_num) {
		mv.setViewName("/league/league-record-team");
		mv.addObject("lg_num", lg_num);
		return mv;
	}
	@RequestMapping(value = "/league/schedule/{lg_num}", method = RequestMethod.GET)
	public ModelAndView leagueSchedule(ModelAndView mv, @PathVariable("lg_num")int lg_num) {
		ArrayList<LeagueAttributeVO> leagueAtt = leagueService.selectLeagueAttByLgNum(lg_num);
		ArrayList<LeagueParticipationteamVO> leagueParti = leagueService.getSelectLeagueParti(lg_num);
		ArrayList<LeagueScheduleVO> leagueSche = leagueService.selectLeagueSchedule(lg_num);

		
		mv.addObject("leagueSche", leagueSche);
		mv.addObject("leagueParti", leagueParti);
		mv.addObject("leagueAtt", leagueAtt);
		mv.addObject("lg_num", lg_num);
		mv.setViewName("/league/league-schedule");
		return mv;
	}
	
	//리그 참가 신청(팀)
	@RequestMapping(value = "/league/enroll/{lg_num}", method = RequestMethod.GET)
	public ModelAndView leagueEnroll(ModelAndView mv, @PathVariable("lg_num")int lg_num,
			HttpSession session) {
		ArrayList<LeagueAttributeVO> laList = leagueService.selectLeagueAttByLgNum(lg_num);
		ArrayList<LeagueParticipationteamVO> lpList = leagueService.getSelectLeagueParti(lg_num);
		MembersVO user = (MembersVO)session.getAttribute("user");
		
		
		
		mv.addObject("user", user);
		mv.addObject("lpList", lpList);
		mv.addObject("laList", laList);
		mv.addObject("lg_num", lg_num);
		mv.setViewName("/league/league-enroll");
		return mv;
	}
	
	//리그타입 (등록,수정,삭제) 
	@RequestMapping(value = "/league/insertType/{lg_num}", method = RequestMethod.GET)
	public ModelAndView leagueInsertType(ModelAndView mv, @PathVariable("lg_num")int lg_num) {
		ArrayList<LeagueAttributeVO> laList = leagueService.selectLeagueAttByLgNum(lg_num);
		
		mv.addObject("laList", laList);
		mv.addObject("lg_num", lg_num);
		mv.setViewName("/league/league-insertType");
		return mv;
	}
	@RequestMapping(value = "/league/insertType/{lg_num}/insert", method = RequestMethod.POST)
	public ModelAndView leagueInsertTypePost(ModelAndView mv, @PathVariable("lg_num")int lg_num,
			LeagueAttributeVO la) {
		boolean isInsert = leagueService.insertLeagueType(la, lg_num);

		mv.addObject("lg_num", lg_num);
		mv.setViewName("redirect:/league/insertType/{lg_num}");
		return mv;
	}
	@RequestMapping(value = "/league/insertType/{lg_num}/update", method = RequestMethod.POST)
	public ModelAndView leagueUpdateTypePost(ModelAndView mv, @PathVariable("lg_num")int lg_num,
			LeagueAttributeVO la) {
		boolean isUpdate = leagueService.updateLeagueType(la);
		
		mv.addObject("lg_num", lg_num);
		mv.setViewName("redirect:/league/insertType/{lg_num}");
		return mv;
	}
	@RequestMapping(value = "/league/insertType/{lg_num}/delete", method = RequestMethod.GET)
	public ModelAndView leagueDeleteType(ModelAndView mv,@PathVariable("lg_num")int lg_num,
			Integer la_num) {
		boolean isDelete = leagueService.deleteLeagueType( la_num);
		

		mv.setViewName("redirect:/league/insertType/{lg_num}");
		return mv;
	}
	
	//리그 참가 신청 승인(리그)
	@RequestMapping(value = "/league/partimanagerment/list/{lg_num}")
	public ModelAndView leaguePartiManagermentList(ModelAndView mv, @PathVariable("lg_num")int lg_num) {
		ArrayList<LeagueAttributeVO> laList = leagueService.selectLeagueAttByLgNum(lg_num);
		
		
		mv.addObject("laList", laList);
		mv.setViewName("/league/league-parti-managerment-list");
		mv.addObject("lg_num", lg_num);
		return mv;
	}
	
	@RequestMapping(value = "/league/partimanagerment/{lg_num}/detail/{la_num}", method = RequestMethod.GET)
	public ModelAndView leaguePartiManagerment(ModelAndView mv, @PathVariable("lg_num")int lg_num,
			@PathVariable("la_num")int la_num) {
		ArrayList<LeagueParticipationteamVO> lpList = leagueService.getSelectLeagueParti(la_num);
		
		mv.addObject("lpList",lpList);
		mv.setViewName("/league/league-parti-managerment-detail");
		mv.addObject("lg_num", lg_num);
		return mv;
	}
	@RequestMapping(value = "/league/partimanagerment/{lg_num}/detail/{la_num}/save", method = RequestMethod.GET)
	public ModelAndView leaguePartiManagermentSave(ModelAndView mv, @PathVariable("lg_num")int lg_num,
			@PathVariable("la_num")int la_num) {
		
		mv.setViewName("redirect:/league/partimanagerment/list/{lg_num}");
		mv.addObject("lg_num", lg_num);
		return mv;
	}
	@RequestMapping(value = "/league/partimanagerment/{lg_num}/detail/{la_num}/update", method = RequestMethod.GET)
	public ModelAndView leaguePartiManagermentUpdate(ModelAndView mv, @PathVariable("lg_num")int lg_num,
			@PathVariable("la_num")int la_num, LeagueAttributeVO la) {
		boolean isUpdate = leagueService.updateLeaguePartiTeam(la, la_num);
		

		mv.setViewName("redirect:/league/partimanagerment/list/{lg_num}");
		mv.addObject("lg_num", lg_num);
		return mv;
	}
	
	@RequestMapping(value = "/league/schedulemanagerment/{lg_num}", method = RequestMethod.GET)
	public ModelAndView leagueScheduleManagerment(ModelAndView mv, @PathVariable("lg_num")int lg_num) {
		mv.setViewName("/league/league-schedule-managerment");
		mv.addObject("lg_num", lg_num);
		return mv;
	}
	
	@RequestMapping(value = "/league/leagueInsert", method = RequestMethod.GET)
	public ModelAndView leagueInsert(ModelAndView mv, HttpSession session) {

		mv.setViewName("/league/league-insert");
		return mv;
	}
	
	@RequestMapping(value = "/league/leagueInsert", method = RequestMethod.POST)
	public ModelAndView leagueInsertPOST(ModelAndView mv, LeagueVO league) {
		
		leagueService.insertLeague(league);
		
		mv.setViewName("redirect:/league/leagueSearch");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/check/lgName", method = RequestMethod.POST)
	public Map<String, Object> checkId(@RequestBody LeagueVO league) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean res = leagueService.checkLeagueName(league.getLg_name());
		map.put("res", res);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/league/approval/{lp_num}/{lp_approval}/{lp_tm_num}", method = RequestMethod.GET)
	public Map<String, Object> leagueApproval(@PathVariable("lp_num")int lp_num,
			@PathVariable("lp_approval")int lp_approval, @PathVariable("lp_tm_num")int lp_tm_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int res = leagueService.leagueApproval(lp_num, lp_approval, lp_tm_num);

		map.put("state", res);
		LeagueParticipationteamVO lp = leagueService.getLeagueParti(lp_num);
		map.put("lp_num", lp);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/league/team/appli/{la_num}", method = RequestMethod.GET)
	public Map<String, Object> leagueApplication(@RequestBody LeagueAttributeVO leagueAtt,
			@PathVariable("la_num")int la_num, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		MembersVO user = (MembersVO)session.getAttribute("user");
		
		int res = leagueService.insertLeagueAttByTeam(la_num, user);
		
		map.put("res", res);
		return map;
	}
	
}
	
