package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueParticipationteamVO;
import com.hereo.project.vo.LeagueScheduleVO;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.TeamVO;

public interface LeagueDAO {

	int countAllleague(@Param("state")String state, @Param("cri")Criteria cri);

	ArrayList<LeagueVO> selectLeaguesByCriAndState(@Param("state")String state, @Param("cri")Criteria cri);

	ArrayList<LeagueVO> selectLeagueByLgNum(@Param("lg_num")int lg_num);

	ArrayList<LeagueAttributeVO> selectLeagueAttByLgNum(@Param("la_lg_num")int lg_num);

	ArrayList<LeagueScheduleVO> selectLeagueSchedule(@Param("ls_la_num")int lg_num);

}
