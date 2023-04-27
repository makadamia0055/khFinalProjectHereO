package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueParticipationteamVO;
import com.hereo.project.vo.LeagueScheduleVO;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerrecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;
import com.hereo.project.pagination.Criteria;


public interface LeagueService {

	int countLeague(String state, Criteria cri);

	ArrayList<LeagueVO> selectLeaguesByCriAndState(String state, Criteria cri);

	ArrayList<LeagueVO> selectLeagueByLgNum(int lg_num);

	ArrayList<LeagueAttributeVO> selectLeagueAttByLgNum(int lg_num);

	ArrayList<LeagueScheduleVO> selectLeagueSchedule(int lg_num);


}
