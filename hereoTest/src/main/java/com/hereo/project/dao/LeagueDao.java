package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueParticipationteamVO;
import com.hereo.project.vo.PlayerrecordHitterVO;

public interface LeagueDao {

	ArrayList<LeagueAttributeVO> selectLeagueAttribute();

	


}
