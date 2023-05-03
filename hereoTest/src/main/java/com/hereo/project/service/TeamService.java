package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.MatchScheduleVO;
import com.hereo.project.vo.TeamApprovalListVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;
import com.hereo.project.vo.TeamWTJoinVO;

public interface TeamService {

	ArrayList<TeamVO> selectAllTeamsByCri(Criteria criteria);

	TeamVO selectTeamByTm_Num(Integer teamNum);

	int countTeams(String state, Criteria cri);

	int insertTeam(TeamVO team, MultipartFile imgFile);

	ArrayList<TeamVO> selectTeamsByCriAndState(Criteria cri, String state);

	TeamApprovalListVO selectTeamAppListByTeam(TeamVO tmpTeam);

	boolean updateTeamAppListState(Integer teamNum, int i);

	void deleteTeamAppListState(Integer teamNum, Integer teamState);

	boolean selectTeamByName(String tm_name);

	int countTeamMember(Integer teamNum);

	boolean insertTeamWTJ(TeamPlayerVO tmp);

	TeamWTJoinVO selectWTJByTjNum(int tjNum);

	int countWholeWTJ(int teamNum, String tj_state);

	boolean updateTeamWTJList(int tj_num, String tj_state);

	ArrayList<TeamWTJoinVO> selectWTJByTeam(int teamNum, String tj_state);

	public ArrayList<TeamVO> selectTeamByPlNumAndAuth(int pl_num, int auth);
	
	public TeamVO selectJoinedTeamByPlNum(int pl_num);

	boolean updateTeam(TeamVO team, Boolean currentLogoDelete, MultipartFile imgFile);

	boolean checkIsLeader(Integer teamNum, String bo_me_id);

	ArrayList<TeamVO> getNewTeam();

	int countTeamTotalMatch(Integer teamNum);

	ArrayList<TeamVO> getAllTeamList();




	



}
