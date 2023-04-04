package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;

public interface TeamPlayerDAO {

	ArrayList<TeamPlayerVO> selectPlayerListByTeam(@Param("tm_num")Integer teamNum);

	ArrayList<TeamPlayerVO> selectTPlayerListByPl_Num(@Param("pl_num")Integer player);

	int countTeamMember(@Param("teamNum")Integer teamNum, @Param("auth")int auth, @Param("cri")Criteria cri);

	int insertMembersToTeam(@Param("tm")TeamVO team, @Param("pl")PlayerVO player, @Param("auth")int auth);

	TeamPlayerVO selectTeamPlayerByTeamAndPlayer(@Param("tm_num")int tm_num, @Param("pl_num")int pl_num);

	int updateTeamPlayer(@Param("tp")TeamPlayerVO teamPlayer);

	ArrayList<TeamPlayerVO> selectPlayerListByTeamAndAuth(@Param("teamNum")Integer teamNum, @Param("auth")int auth);

}
