package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.MembersDAO;
import com.hereo.project.vo.MembersVO;

@Service
public class MembersServiceImp implements MembersService{
	@Autowired
	MembersDAO membersDao;

	@Override
	public boolean insertUser(MembersVO user) {
		if(user==null)
			return false;
		if(membersDao.insertUser(user) !=0 )
			return true;
		
		return false;
	}

	@Override
	public MembersVO login(MembersVO user) {
		if(user==null || user.getMe_id()==null || user.getMe_pw()==null)
			return null;
		MembersVO dbuser = membersDao.selectUserId(user.getMe_id());
		if(dbuser==null)
			return null;
		if(user.getMe_pw().equals(dbuser.getMe_pw()))
			return dbuser;
		return null;
	}

	@Override
	public MembersVO selectMembersByMeId(String pl_me_id) {
		return membersDao.selectMembersByMeId(pl_me_id);
	}

	@Override
	public void updateAutoLoginSession(MembersVO loginUser) {
		if(loginUser==null)
			return;
		membersDao.updateSession(loginUser);
		
	}

	@Override
	public MembersVO getLoginSession(String me_session_id) {
		
		return membersDao.selectLoginSession(me_session_id);
		
	}


	

}
