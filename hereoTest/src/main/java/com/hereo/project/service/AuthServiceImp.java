package com.hereo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.AuthDAO;

@Service
public class AuthServiceImp implements AuthService{
	@Autowired
	AuthDAO authDao;
	
	@Override
	public boolean isSiteManager(String me_id) {
		if(me_id==null||me_id.trim().length()==0)
			return false;
		return authDao.isSiteManager(me_id)==9;
	}

}
