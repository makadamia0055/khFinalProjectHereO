package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;

public interface TeamPlayerDAO {

	ArrayList<TeamPlayerVO> selectPlayerListByTeam(@Param("tm_num")Integer teamNum);

	ArrayList<TeamPlayerVO> selectTPlayerListByPl_Num(@Param("pl_num")Integer player);

	int countTeamMember(Integer teamNum);

	int insertMembersToTeam(@Param("tm")TeamVO team, @Param("pl")PlayerVO player, @Param("auth")int auth);

}
