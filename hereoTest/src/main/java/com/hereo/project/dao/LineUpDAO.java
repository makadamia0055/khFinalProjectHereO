package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.MatchLineUpVO;

public interface LineUpDAO {

	ArrayList<MatchLineUpVO> selectLineUpByMsNum(Integer ms_num);

	ArrayList<MatchLineUpVO> selectLineUpByTmNumAndMsNum(@Param("teamNum")Integer teamNum, @Param("ms_num")Integer ms_num);

	void deleteLineUpByTmNumAndMsNum(@Param("teamNum")Integer teamNum, @Param("ms_num")Integer ms_num);

	int insertMatchLineUp(@Param("ml")MatchLineUpVO tmp);

}
