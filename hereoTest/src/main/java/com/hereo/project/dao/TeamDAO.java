package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.TeamVO;

public interface TeamDAO {

	ArrayList<TeamVO> selectAllTeams();

	TeamVO selectTeamByTm_num(@Param("tm_num")Integer teamNum);

}
