package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.TeamApprovalListVO;
import com.hereo.project.vo.TeamVO;

public interface TeamService {

	ArrayList<TeamVO> selectAllTeamsByCri(Criteria criteria);

	TeamVO selectTeamByTm_Num(Integer teamNum);

	int countTeams(String state, Criteria cri);

	boolean insertTeam(TeamVO team, MultipartFile imgFile);

	ArrayList<TeamVO> selectTeamsByCriAndState(Criteria cri, String state);

	TeamApprovalListVO selectTeamAppListByTeam(TeamVO tmpTeam);

	boolean updateTeamAppListState(Integer teamNum, int i);

	void deleteTeamAppListState(Integer teamNum, Integer teamState);

	boolean selectTeamByName(String tm_name);

	



}
