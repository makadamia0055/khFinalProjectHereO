package com.hereo.project.service;

import java.util.ArrayList;


import com.hereo.project.pagination.Criteria;



import com.hereo.project.vo.BatterBoxEventVO;
import com.hereo.project.vo.MatchInningVO;
import com.hereo.project.vo.MatchParticipateVO;
import com.hereo.project.vo.MatchRecordVO;
import com.hereo.project.vo.PlayerRecordHitterVO;
import com.hereo.project.vo.PlayerRecordPitcherVO;
import com.hereo.project.vo.TeamVO;


public interface RecordService {

	ArrayList<PlayerRecordHitterVO> getSelectAllHitRecord();

	MatchRecordVO selectMatchRecordByMrNum(int mr_num);

	ArrayList<MatchParticipateVO> selectMatchPartInHome(int mr_num);

	ArrayList<MatchParticipateVO> selectMatchPartInAway(int mr_num);

	PlayerRecordHitterVO selectPlayerRecordHitterByTpNumAndMrNum(Integer tp_num, Integer mr_num);

	PlayerRecordPitcherVO selectPlayerRecordPitcherByTpNumAndMrNum(Integer tp_num, Integer mr_num);

	ArrayList<BatterBoxEventVO> getAllBatterBoxEventList();

	MatchRecordVO selectMatchRecordByMsNum(int ms_num);


	boolean insertOrUpdateMatchRecord(MatchRecordVO matchRecord);

	ArrayList<MatchInningVO> insertOrUpdateMatchInning(String matchInningList) ;

	boolean insertOrUpdateMatchBBE(String matchBBEStr, Integer mr_num);

	boolean insertOrUpdateMatchParticipate(String matchParticipate, Integer mr_num);

	void clearCurrentPlayerRecordByMrNum(int mr_num);

	boolean updateYearRecord(Integer mr_num);

	ArrayList<PlayerRecordHitterVO> getSelectLeagueHitRecord(int lg_num, Criteria cri);


	TeamVO getOppoTeamName(Integer mr_num, Integer tm_num);






	

}
