package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.BatterBoxEventVO;
import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.MatchParticipateVO;
import com.hereo.project.vo.MatchRecordVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerRecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;
import com.hereo.project.pagination.Criteria;


public interface RecordService {

	ArrayList<PlayerRecordHitterVO> getSelectAllHitRecord();

	MatchRecordVO selectMatchRecordByMrNum(int mr_num);

	ArrayList<MatchParticipateVO> selectMatchPartInHome(int mr_num);

	ArrayList<MatchParticipateVO> selectMatchPartInAway(int mr_num);

	PlayerRecordHitterVO selectPlayerRecordHitterByTpNumAndMrNum(Integer tp_num, Integer mr_num);

	PlayerRecordHitterVO selectPlayerRecordPitcherByTpNumAndMrNum(Integer tp_num, Integer mr_num);

	ArrayList<BatterBoxEventVO> getAllBatterBoxEventList();

}
