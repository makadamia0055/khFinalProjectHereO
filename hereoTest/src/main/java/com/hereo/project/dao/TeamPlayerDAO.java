package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.TeamPlayerVO;

public interface TeamPlayerDAO {

	ArrayList<TeamPlayerVO> selectPlayerListByTeam(@Param("tm_num")Integer teamNum);

	ArrayList<TeamPlayerVO> selectTPlayerListByPl_Num(@Param("pl_num")Integer player);

}
