package com.hereo.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hereo.project.utils.MessageUtils;
import com.hereo.project.vo.MembersVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
    @Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object Handler) throws Exception {
		HttpSession session = request.getSession();
		MembersVO loginUser = (MembersVO)session.getAttribute("loginUser");
		System.out.println("게스트"+loginUser);
		if(loginUser==null || loginUser.getMe_siteauth()<9) {
			MessageUtils.alertAndGoPage(response, "접근 권한이 없습니다", "/hereoTest", "/home");
			return false;
		}
		return true;
	}

}
