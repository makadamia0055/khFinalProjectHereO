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
	
	

}
