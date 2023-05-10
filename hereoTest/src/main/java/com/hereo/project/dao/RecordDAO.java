package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.BatterBoxEventVO;
import com.hereo.project.vo.MatchParticipateVO;
import com.hereo.project.vo.MatchRecordVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.PlayerRecordHitterVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;

public interface RecordDAO {

	ArrayList<PlayerRecordHitterVO> selectAllHitRecord();

	MatchRecordVO selectMatchRecordByMrNum(int mr_num);

	ArrayList<MatchParticipateVO> selectMatchPartInHome(int mr_num);

	ArrayList<MatchParticipateVO> selectMatchPartInAway(int mr_num);

	PlayerRecordHitterVO selectPlayerRecordHitterByTpNumAndMrNum(@Param("tp_num")Integer tp_num, @Param("mr_num")Integer mr_num);

	PlayerRecordHitterVO selectPlayerRecordPitcherByTpNumAndMrNum(@Param("tp_num")Integer tp_num, @Param("mr_num")Integer mr_num);

	ArrayList<BatterBoxEventVO> getAllBatterBoxEventList();

}
