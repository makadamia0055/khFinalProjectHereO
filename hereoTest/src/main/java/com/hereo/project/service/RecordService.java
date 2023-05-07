package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerRecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;
import com.hereo.project.pagination.Criteria;


public interface RecordService {

	ArrayList<PlayerRecordHitterVO> getSelectAllHitRecord();

}
