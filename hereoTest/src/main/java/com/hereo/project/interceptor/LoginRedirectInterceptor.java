package com.hereo.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.MembersService;
import com.hereo.project.vo.MembersVO;

public class LoginRedirectInterceptor implements HandlerInterceptor {

	@Autowired 
	MembersService membersService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession();
		MembersVO loginUser = (MembersVO)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			String url = (String)session.getAttribute("prevURL");
			if(url!=null) {
				response.sendRedirect(url);
				session.removeAttribute("prevURL");
				return false;
			}
		}
		return true;
	}
	
}
