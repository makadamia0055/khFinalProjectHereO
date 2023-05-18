package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDAO;
import com.hereo.project.dao.MembersDAO;
import com.hereo.project.dao.RecordDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.LeagueAttributeVO;
import com.hereo.project.vo.LeagueParticipationteamVO;
import com.hereo.project.vo.LeagueScheduleVO;
import com.hereo.project.vo.LeagueVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.TeamVO;


@Service
public class LeagueServiceImp implements LeagueService {
	@Autowired
	LeagueDAO leagueDao;
	@Autowired
	RecordDAO recordDao;
	@Autowired
	MembersDAO membersDao;

	@Override
	public int countLeague(String state, Criteria cri) {
		return leagueDao.countAllleague(state,cri);
	}
	@Override
	public ArrayList<LeagueVO> selectLeaguesByCriAndState(String state, Criteria cri) {
		return leagueDao.selectLeaguesByCriAndState(state, cri);
	}
	@Override
	public LeagueVO selectLeagueByLgNum(int lg_num) {
		if(lg_num == 0)
			return null;
		return leagueDao.selectLeagueByLgNum(lg_num);
	}
	@Override
	public ArrayList<LeagueAttributeVO> selectLeagueAttByLgNum(int lg_num) {
		if(lg_num == 0)
			return null;
		return leagueDao.selectLeagueAttByLgNum(lg_num);
	}
	@Override
	public ArrayList<LeagueScheduleVO> selectLeagueSchedule(int lg_num) {
		if(lg_num == 0)
			return null;
		return leagueDao.selectLeagueSchedule(lg_num);
	}
	@Override
	public ArrayList<LeagueParticipationteamVO> getSelectLeagueParti(int lg_num) {
		if(lg_num == 0)
			return null;
		return leagueDao.selectLeagueParti(lg_num);
	}
	@Override
	public Boolean insertLeague(LeagueVO league) {
		//리그 등록 서비스

		if(!checkLeague(league)) // 필요한 리그정보 없을시 실패
			return false;
		
		leagueDao.insertLeague(league);
		
		return true;
	}
	private boolean checkLeague(LeagueVO league) {
		//리그정보체크
		if(league == null || league.getLg_name() == null)
			return false;
		return true;
	}
	@Override
	public boolean checkLeagueName(String lg_name) {
		if(lg_name == null || lg_name.trim().equals(""))
			return false;
		ArrayList<LeagueVO> leagueList = leagueDao.checkLeagueName(lg_name);
		if(leagueList == null || leagueList.size() == 0)
			return true;
		return false;
	}
	@Override
	public int countLeaguePlayer(Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		return recordDao.countLeaguePlayer(cri);
	}
	
	//리그타입 등록
	@Override
	public boolean insertLeagueType(LeagueAttributeVO la, int lg_num) {
		if(lg_num == 0)
			return false;
		if(la.getLa_name() == null && la.getLa_match_type() == null)
			return false;
		la.setLa_lg_num(lg_num);
		LeagueAttributeVO dbLa = leagueDao.selectLeagueAttByType(la.getLa_match_type());
		if( dbLa != null && la.getLa_num() != dbLa.getLa_num()) 
			return false;
		return leagueDao.insertLeagueType(la) != 0;
	}
	//리그타입 수정
	@Override
	public boolean updateLeagueType(LeagueAttributeVO la, int lg_num) {
		if(lg_num == 0)
			return false;
		if(la.getLa_num() < 1 && la.getLa_name() == null && la.getLa_match_type() == null)
			return false;
		return leagueDao.updateLeagueType(la) != 0;
	}
	@Override
	public boolean deleteLeagueType(Integer la_num) {
		if(la_num == null || la_num < 1)
			return false;
		return leagueDao.deleteLeagueType(la_num);
	}
	@Override
	public boolean updateLeaguePartiTeamSave(LeagueParticipationteamVO lp) {
		if(lp == null && lp.getLp_num() < 1)
			return false;
		System.out.println(lp);
		return leagueDao.updateLeaguePartiTeamSave(lp);
	}



}
