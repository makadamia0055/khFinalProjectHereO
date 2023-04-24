package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.PlayerrecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;

public interface LeagueDAO {
	
	int countAllleague(@Param("state")String state, @Param("cri")Criteria cri);

	ArrayList<LeagueVO> selectLeaguesByCriAndState(@Param("state")String state, @Param("cri")Criteria cri);

}
