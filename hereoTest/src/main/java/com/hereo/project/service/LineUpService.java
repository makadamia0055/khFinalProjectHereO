package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.MatchLineUpVO;

public interface LineUpService {

	int insertMatchLineUp(ArrayList<MatchLineUpVO> lineupList);

	ArrayList<MatchLineUpVO> selectLineUpByTmNumAndMsNum(Integer teamNum, Integer ms_num);

	ArrayList<MatchLineUpVO> selectLineUpByMsNum(Integer ms_num);

	void deleteLineUpByTmNumAndMsNum(Integer teamNum, Integer ms_num);

}
