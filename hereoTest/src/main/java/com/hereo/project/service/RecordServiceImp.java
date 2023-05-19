package com.hereo.project.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDAO;
import com.hereo.project.dao.RecordDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.BatterBoxEventVO;
import com.hereo.project.vo.LeagueMatchListVO;
import com.hereo.project.vo.MatchBatterBoxEventVO;
import com.hereo.project.vo.MatchInningVO;
import com.hereo.project.vo.MatchParticipateVO;
import com.hereo.project.vo.MatchRecordVO;
import com.hereo.project.vo.PlayerRecordHitterVO;
import com.hereo.project.vo.PlayerRecordPitcherVO;



@Service
public class RecordServiceImp implements RecordService {
	@Autowired
	RecordDAO recordDao;
	@Autowired
	LeagueDAO leagueDao;

	@Override
	public ArrayList<PlayerRecordHitterVO> getSelectAllHitRecord() {

		return recordDao.selectAllHitRecord();
	}

	@Override
	public MatchRecordVO selectMatchRecordByMrNum(int mr_num) {
		return recordDao.selectMatchRecordByMrNum(mr_num);
	}

	@Override
	public ArrayList<MatchParticipateVO> selectMatchPartInHome(int mr_num) {
		return recordDao.selectMatchPartInHome(mr_num);
	}

	@Override
	public ArrayList<MatchParticipateVO> selectMatchPartInAway(int mr_num) {
		return recordDao.selectMatchPartInAway(mr_num);
	}

	@Override
	public PlayerRecordHitterVO selectPlayerRecordHitterByTpNumAndMrNum(Integer tp_num, Integer mr_num) {
		if(tp_num==null||mr_num==null||tp_num<1||mr_num<1)
			return null;
		return recordDao.selectPlayerRecordHitterByTpNumAndMrNum(tp_num, mr_num);
	}

	@Override
	public PlayerRecordPitcherVO selectPlayerRecordPitcherByTpNumAndMrNum(Integer tp_num, Integer mr_num) {
		if(tp_num==null||mr_num==null||tp_num<1||mr_num<1)
			return null;
		return recordDao.selectPlayerRecordPitcherByTpNumAndMrNum(tp_num, mr_num);

		
	}

	@Override
	public ArrayList<BatterBoxEventVO> getAllBatterBoxEventList() {
		return recordDao.getAllBatterBoxEventList();
	}

	@Override
	public MatchRecordVO selectMatchRecordByMsNum(int ms_num) {
		return recordDao.selectMatchRecordByMsNum(ms_num);
	}
	
	@Override
	public ArrayList<PlayerRecordHitterVO> getSelectLeagueHitRecord(int lg_num, Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		LeagueMatchListVO lm = leagueDao.selectLeagueMatchLgNum(1);
		MatchRecordVO mr = recordDao.selectMatchNum(lm.getLm_mr_num());
		
		return recordDao.selectLeagueHitRecord(mr.getMr_num(),cri);

	}

	
	@Override

	public boolean insertOrUpdateMatchRecord(MatchRecordVO matchRecord) {
		if(matchRecord==null||matchRecord.getMr_ms_num()<1)
			return false;
		MatchRecordVO ori = selectMatchRecordByMsNum(matchRecord.getMr_ms_num());
		if(ori== null) {
			return recordDao.insertMatchRecord(matchRecord) !=0;
		}else {
			matchRecord.setMr_num(ori.getMr_num());
			return recordDao.updateMatchRecord(matchRecord) !=0;
		}
	}

	@Override
	public ArrayList<MatchInningVO> insertOrUpdateMatchInning(String matchInningList) {
		if(matchInningList==null)
			return null;
//		json 변환 과정
		ObjectMapper objectMapper = new ObjectMapper();
		ArrayList<MatchInningVO> mIList;
		try {
			mIList = new ArrayList<MatchInningVO>(Arrays.asList(objectMapper.readValue(matchInningList, MatchInningVO[].class)));
			// 이후 메소드 처리
			int mr_num;
			if(mIList.get(0)==null) {
				return null;
			}
			mr_num = mIList.get(0).getMi_mr_num();
			ArrayList<MatchInningVO> exstList = recordDao.selectMatchInningByMrNum(mr_num);
			if(exstList!=null&&exstList.size()!=0) {
				recordDao.deleteMatchInning(mr_num);
				
			}
			for(MatchInningVO tmpInning : mIList) {
				recordDao.insertMatchInning(tmpInning);
			}
			return mIList;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public boolean insertOrUpdateMatchBBE(String matchBBEStr, Integer mr_num) {
		if(matchBBEStr==null||mr_num==null)
			return false;
//		json 변환 과정
		ObjectMapper objectMapper = new ObjectMapper();
		ArrayList<MatchBatterBoxEventVO> bBEList;
		try {
			bBEList = new ArrayList<MatchBatterBoxEventVO>(Arrays.asList(objectMapper.readValue(matchBBEStr, MatchBatterBoxEventVO[].class)));
			// 이후 메소드 처리
			for(MatchBatterBoxEventVO tmpBBE : bBEList) {
				System.out.println(tmpBBE);
				recordDao.insertMatchBBE(tmpBBE, mr_num);
			}
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean insertOrUpdateMatchParticipate(String matchParticipate, Integer mr_num) {
		if(matchParticipate==null)
			return false;
//		json 변환 과정
		ObjectMapper objectMapper = new ObjectMapper();
		ArrayList<MatchParticipateVO> partList;
		try {
			partList = new ArrayList<MatchParticipateVO>(Arrays.asList(objectMapper.readValue(matchParticipate, MatchParticipateVO[].class)));
			// 이후 메소드 처리
			recordDao.deleteMatchParticipate(mr_num);
				
			for(MatchParticipateVO tmpPart : partList) {
				recordDao.insertMatchParticipate(tmpPart);
			}
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public void clearCurrentPlayerRecordByMrNum(int mr_num) {
		recordDao.clearCurrentHitterRecordByMrNum(mr_num);
		recordDao.clearCurrentPitcherRecordByMrNum(mr_num);
		
	}

	@Override
	public boolean updateYearRecord(Integer mr_num) {
		ArrayList<PlayerRecordPitcherVO> pitcherList= recordDao.selectPlayerRecordHitterByMr_num(mr_num);
		ArrayList<PlayerRecordHitterVO> hitterList = recordDao.selectPlayerRecordPitcherByMr_num(mr_num);
		
		for(PlayerRecordPitcherVO tmp : pitcherList) {
			recordDao.updateYearRecordPitcher(mr_num, tmp);
		}
		for(PlayerRecordHitterVO tmp : hitterList) {
			recordDao.updateYearRecordHitter(mr_num, tmp);
		}
		
		return false;
  }

	

	
	

}