package com.hereo.project.dao;

import java.util.ArrayList;

import com.hereo.project.vo.MatchScheduleVO;
import com.hereo.project.vo.StadiumVO;

public interface ScheduleDAO {

	ArrayList<MatchScheduleVO> selectTeamScheduleByTeamAfterToday(Integer teamNum);

	MatchScheduleVO selectNextTeamSchedule(Integer teamNum);
	
	StadiumVO selectStadiumByRv_Num(Integer rv_num);

}
