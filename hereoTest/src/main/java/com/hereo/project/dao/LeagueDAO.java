package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueMatchListVO;
import com.hereo.project.vo.LeagueParticipationteamVO;
import com.hereo.project.vo.LeagueScheduleVO;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;

public interface LeagueDAO {

	int countAllleague(@Param("state")String state, @Param("cri")Criteria cri);

	ArrayList<LeagueVO> selectLeaguesByCriAndState(@Param("state")String state, @Param("cri")Criteria cri);

	LeagueVO selectLeagueByLgNum(@Param("lg_num")int lg_num);

	LeagueMatchListVO selectLeagueMatchLgNum(@Param("ls_num")int ls_num);
	
	TeamVO selectPartiTmNum(@Param("lp_tm_num")int lp_tm_num);
	
	TeamPlayerVO selectTpNum(@Param("tm_num")int tm_num);

	ArrayList<LeagueAttributeVO> selectLeagueAttByLgNum(@Param("la_lg_num")int lg_num);

	ArrayList<LeagueScheduleVO> selectLeagueSchedule(@Param("ls_la_num")int lg_num);

	ArrayList<LeagueParticipationteamVO> selectLeagueParti(@Param("ls_la_num")int lg_num);

	ArrayList<LeagueScheduleVO> selectLeagueTmRank(@Param("ls_la_num")Integer ls_num);

	void insertLeague(@Param("lg")LeagueVO league);

	ArrayList<LeagueVO> selectLeague();

	ArrayList<LeagueVO> checkLeagueName(@Param("lg_name")String lg_name);

	LeagueAttributeVO selectLeagueTypeByName(@Param("la_match_type")String la_match_type);

	int insertLeagueType(@Param("la")LeagueAttributeVO la);

	LeagueAttributeVO selectLeagueAttByType(@Param("la_match_type")String la_match_type);

	int updateLeagueType(@Param("la")LeagueAttributeVO la);

	boolean deleteLeagueType(@Param("la_num")Integer la_num);

	boolean updateLeaguePartiTeamSave(@Param("lp")LeagueParticipationteamVO lp);








}
