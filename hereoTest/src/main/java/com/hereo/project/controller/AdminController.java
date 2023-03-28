package com.hereo.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.service.TeamService;
import com.hereo.project.vo.TeamApprovalListVO;
import com.hereo.project.vo.TeamVO;


@Controller
public class AdminController {
	@Autowired
	TeamService teamService;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminMain(ModelAndView mv) {
		mv.setViewName("/admin/admin_main");
		return mv;
	}
	@RequestMapping(value = "/admin/team_create", method = RequestMethod.GET)
	public ModelAndView adminTeamCreate(ModelAndView mv, Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		ArrayList<TeamVO> teamList = teamService.selectTeamsByCriAndState(cri, "심사중");
		ArrayList<TeamApprovalListVO> TAppList = new ArrayList<TeamApprovalListVO>();
		for(TeamVO tmpTeam: teamList) {
			TeamApprovalListVO tmpApp= teamService.selectTeamAppListByTeam(tmpTeam);
			if(tmpApp !=null) {
			tmpApp.setTeam(tmpTeam);
			TAppList.add(tmpApp);
			}
		}
		mv.addObject("TAList", TAppList);
		mv.setViewName("/admin/admin_teamcreate");
		return mv;
	}
	@RequestMapping(value = "/admin/team_createBoard", method = RequestMethod.GET)
	public ModelAndView adminTeamCreateBoard(ModelAndView mv, Integer teamNum) {
		TeamVO tmpTeam = teamService.selectTeamByTm_Num(teamNum);
		TeamApprovalListVO tmpApp= teamService.selectTeamAppListByTeam(tmpTeam);
		if(tmpApp !=null) {
			tmpApp.setTeam(tmpTeam);
		}
		if(tmpApp.getTa_state()==0) {
			boolean res = teamService.updateTeamAppListState(teamNum, 1);
			
		}
		mv.addObject("TAL", tmpApp);
		mv.setViewName("/admin/admin_teamcreateboard");
		return mv;
	}
	@RequestMapping(value = "/admin/team_createBoard", method = RequestMethod.POST)
	public ModelAndView adminTeamCreateBoardPost(ModelAndView mv, Integer teamNum, Integer teamState) {
		boolean res = teamService.updateTeamAppListState(teamNum, teamState);
		if(res) {
			teamService.deleteTeamAppListState(teamNum, teamState);
			
		}
		
		mv.setViewName("redirect:/admin/team_create");
		return mv;
	}
	
	
}
