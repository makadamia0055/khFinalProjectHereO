package com.hereo.project.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.hereo.project.service.MembersService;
import com.hereo.project.vo.MembersVO;

public class AutoLoginInterceptor implements HandlerInterceptor {

	@Autowired
	MembersService membersService;
	
	public boolean preHandle(HttpServletResponse response,
		HttpServletRequest request,
		Object handler)throws Exception {
		
		HttpSession session = request.getSession();
		MembersVO loginUser = (MembersVO)session.getAttribute("loginUser");
		
		if(loginUser==null) {
			Cookie cookie =WebUtils.getCookie(request, "loginCookie");
			
			if(cookie != null) {
				String me_session_id = cookie.getValue();
				loginUser=membersService.getLoginSession(me_session_id);
				
				if(loginUser!=null) {
					session.setAttribute("loginUser", loginUser);
				}
			}
		}
		
		return true;
	}
	
}
