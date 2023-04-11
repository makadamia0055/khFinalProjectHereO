package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.BoardDAO;
import com.hereo.project.vo.BoardTypeVO;

@Service
public class CommuServiceImp implements CommuService {
	
	@Autowired
	BoardDAO boardDao;
	
	@Override
	public ArrayList<BoardTypeVO> getBoardType(int me_siteauth) {
		return boardDao.selectBoardType(me_siteauth);
	}

}
