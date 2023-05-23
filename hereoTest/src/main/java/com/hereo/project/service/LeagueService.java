package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueParticipationteamVO;
import com.hereo.project.vo.LeagueScheduleVO;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerRecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;
import com.hereo.project.pagination.Criteria;


public interface LeagueService {

	int countLeague(String state, Criteria cri);

	ArrayList<LeagueVO> selectLeaguesByCriAndState(String state, Criteria cri);

	LeagueVO selectLeagueByLgNum(int lg_num);

	ArrayList<LeagueAttributeVO> selectLeagueAttListByLgNum(int lg_num);

	ArrayList<LeagueScheduleVO> selectLeagueScheduleList(int la_num);

	ArrayList<LeagueParticipationteamVO> getSelectLeaguePartiList(int lg_num);

	Boolean insertLeague(LeagueVO league, MembersVO user);

	boolean checkLeagueName(String lg_name);

	int countLeaguePlayer(Criteria cri);

	boolean insertLeagueType(LeagueAttributeVO la, int lg_num);

	boolean updateLeagueType(LeagueAttributeVO la);

	boolean deleteLeagueType(Integer la_num);

	int leagueApproval(int lp_num, int lp_approval, int lp_tm_num);

	LeagueParticipationteamVO getLeagueParti(int lp_num);

	boolean updateLeaguePartiTeam(LeagueAttributeVO la, int la_num);

	int insertLeagueAttByTeam(int la_num, String me_id);

	MembersVO getSelectMember(String me_id);





}
