package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDAO;
import com.hereo.project.dao.RecordDAO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.PlayerRecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;


@Service
public class RecordServiceImp implements RecordService {
	@Autowired
	RecordDAO recordDao;

	@Override
	public ArrayList<PlayerRecordHitterVO> getSelectAllHitRecord() {

		return recordDao.selectAllHitRecord();
	}

}
