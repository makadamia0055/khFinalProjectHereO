package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.TeamApprovalListVO;
import com.hereo.project.vo.TeamVO;

public interface TeamDAO {

	ArrayList<TeamVO> selectTeamsByCriAndState(@Param("cri")Criteria cri, @Param("state")String state);

	ArrayList<TeamVO> selectAllTeamsByCri(@Param("cri")Criteria cri);

	TeamVO selectTeamByTm_num(@Param("tm_num")Integer teamNum);

	int countAllTeams(@Param("state")String state, @Param("cri")Criteria cri);

	boolean insertTeam(@Param("tm")TeamVO team);

	TeamApprovalListVO selectTeamAppListByTeam(@Param("tm")TeamVO tmpTeam);

	void insertTeamAppList(@Param("tm")TeamVO team);

	int updateTeamAppListState(@Param("tm_num")Integer teamNum, @Param("ta_state")int i);

	void deleteTeamAppList(@Param("tm_num")Integer teamNum);

	void updateTeamState(@Param("tm_num")Integer teamNum, @Param("state")String string);

	ArrayList<TeamVO> selectTeamByName(String tm_name);


}
