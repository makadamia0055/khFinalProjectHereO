package com.hereo.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.PlayerService;
import com.hereo.project.service.TeamService;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.TeamVO;

public class InfoInsertInterceptor implements HandlerInterceptor{
	@Autowired
	TeamService teamService;
	@Autowired
	PlayerService playerService;

	
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mv) throws Exception{
		HttpSession session = req.getSession();
		MembersVO user =(MembersVO)session.getAttribute("loginUser");
		PlayerVO player = (PlayerVO)session.getAttribute("userPlayer");
		TeamVO team = (TeamVO)session.getAttribute("userTeam");
		if(user!=null) {
			if(player==null) {
				player = playerService.selectPlayerByMeId(user.getMe_id());
				session.setAttribute("userPlayer", player);
				
			}
			if(team==null) {
				player = (PlayerVO)session.getAttribute("userPlayer");
				if(player!=null) {
					team = teamService.selectJoinedTeamByPlNum(player.getPl_num());
				}
				System.out.println(team);
				session.setAttribute("userTeam", team);
			}
			
			
		}
		
		
	}
	
}
