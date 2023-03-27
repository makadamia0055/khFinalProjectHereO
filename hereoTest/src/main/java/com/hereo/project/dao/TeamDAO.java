package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.TeamVO;

public interface TeamDAO {

	ArrayList<TeamVO> selectAllTeamsByCri(@Param("cri")Criteria cri);

	TeamVO selectTeamByTm_num(@Param("tm_num")Integer teamNum);

	int countAllTeams();

	boolean insertTeam(@Param("tm")TeamVO team);

}
