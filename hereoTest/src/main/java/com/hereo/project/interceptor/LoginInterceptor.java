package com.hereo.project.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.MembersService;
import com.hereo.project.vo.MembersVO;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Autowired 
	MembersService membersService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv) throws Exception{
		
		ModelMap modelMap = mv.getModelMap();
		MembersVO loginUser = (MembersVO)modelMap.get("loginUser");
		
		if(loginUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			if(loginUser.isAutoLogin()) {
				Cookie cookie = new Cookie("loginCookie", session.getId());
				
				int time = 60*60*24*7;
				cookie.setPath("/");
				cookie.setMaxAge(time);
				response.addCookie(cookie);
				
				loginUser.setMe_session_id(session.getId());
				
				Date date = new Date(System.currentTimeMillis() + time*1000);
				loginUser.setMe_session_limit(date);
				membersService.updateAutoLoginSession(loginUser);
			}
		}
		
	}
}
