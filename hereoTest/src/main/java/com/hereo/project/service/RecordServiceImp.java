package com.hereo.project.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.RecordDAO;
import com.hereo.project.vo.BatterBoxEventVO;
import com.hereo.project.vo.MatchInningVO;
import com.hereo.project.vo.MatchParticipateVO;
import com.hereo.project.vo.MatchRecordVO;
import com.hereo.project.vo.PlayerRecordHitterVO;


@Service
public class RecordServiceImp implements RecordService {
	@Autowired
	RecordDAO recordDao;

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
	public PlayerRecordHitterVO selectPlayerRecordPitcherByTpNumAndMrNum(Integer tp_num, Integer mr_num) {
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
	public boolean insertOrUpdateMatchInning(String matchInningList) {
		if(matchInningList==null)
			return false;
//		json 변환 과정
		ObjectMapper objectMapper = new ObjectMapper();
		List<MatchInningVO> mIList;
		try {
			mIList = Arrays.asList(objectMapper.readValue(matchInningList, MatchInningVO[].class));
			System.out.println(mIList);
			// 이후 메소드 처리
			int mr_num;
			if(mIList.get(0)==null) {
				return false;
			}
			mr_num = mIList.get(0).getMi_mr_num();
			ArrayList<MatchInningVO> exstList = recordDao.selectMatchInningByMrNum(mr_num);
			if(exstList!=null&&exstList.size()!=0) {
				recordDao.deleteMatchInning(mr_num);
				
			}
			for(MatchInningVO tmpInning : mIList) {
				if(recordDao.insertMatchInning(tmpInning)!=0)
					return false;
			}
			System.out.println(mIList);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		
		
		
		
	}

	
	

}
