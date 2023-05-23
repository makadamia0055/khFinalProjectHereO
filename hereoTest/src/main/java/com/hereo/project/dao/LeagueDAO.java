package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueMatchListVO;
import com.hereo.project.vo.LeagueParticipationteamVO;
import com.hereo.project.vo.LeagueScheduleVO;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;

public interface LeagueDAO {

	int countAllleague(@Param("state")String state, @Param("cri")Criteria cri);

	ArrayList<LeagueVO> selectLeaguesByCriAndState(@Param("state")String state, @Param("cri")Criteria cri);

	LeagueVO selectLeagueByLgNum(@Param("lg_num")int lg_num);

	LeagueMatchListVO selectLeagueMatchLgNum(@Param("ls_num")int ls_num);
	
	TeamVO selectPartiTmNum(@Param("lp_tm_num")int lp_tm_num);
	
	TeamPlayerVO selectTpNum(@Param("tm_num")int tm_num);

	ArrayList<LeagueAttributeVO> selectLeagueAttListByLgNum(@Param("lg_num")int lg_num);

	ArrayList<LeagueScheduleVO> selectLeagueScheduleList(@Param("la_num")int la_num);

	ArrayList<LeagueParticipationteamVO> selectLeaguePartiList(@Param("la_num")int la_num);

	ArrayList<LeagueScheduleVO> selectLeagueTmRank(@Param("ls_num")Integer ls_num);

	void insertLeague(@Param("lg")LeagueVO league);

	ArrayList<LeagueVO> selectLeague();

	ArrayList<LeagueVO> checkLeagueName(@Param("lg_name")String lg_name);

	LeagueAttributeVO selectLeagueTypeByName(@Param("la_match_type")String la_match_type);

	int insertLeagueType(@Param("la")LeagueAttributeVO la);

	LeagueAttributeVO selectLeagueAttByType(@Param("la_match_type")String la_match_type);

	int updateLeagueType(@Param("la")LeagueAttributeVO la);

	boolean deleteLeagueType(@Param("la_num")Integer la_num);

	boolean updateLeaguePartiTeamSave(@Param("lp")LeagueParticipationteamVO lp);

	LeagueParticipationteamVO selectleagueApproval(@Param("lp_num")int lp_num);

	void updateleagueApproval(@Param("lp")LeagueParticipationteamVO lpVo);

	LeagueParticipationteamVO selectLeaguePartiByLpNum(@Param("lp_num")int lp_num);

	int updateLeaguePartiTeam(@Param("la")LeagueAttributeVO la, @Param("la_num")int la_num);

	PlayerVO selectPlayerByUser(@Param("me_id")String me_id);

	TeamPlayerVO selectTplayerByPlNum(@Param("pl_num")int pl_num);

	TeamVO selectTeamByTpNum(@Param("tp_tm_num")int tp_tm_num);

	LeagueParticipationteamVO selectLeaguePartiTeamByLeagueAtt(@Param("tm_num")int tm_num, @Param("la_num")int la_num);

	void insertLeaguePartiByTmNum(@Param("lp")LeagueParticipationteamVO lpVo);

	MembersVO selectMemberByMeid(@Param("me_id")String me_id);

	LeagueAttributeVO selectLeagueAttByLgNum(@Param("lg_num")int lg_num,@Param("la_match_type")String la_match_type);

	LeagueScheduleVO selectLeagueScheByLaNum(@Param("la_num")int la_num);










}
