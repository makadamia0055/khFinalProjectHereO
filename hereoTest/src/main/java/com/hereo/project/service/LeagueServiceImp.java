package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.LeagueDAO;
import com.hereo.project.dao.MembersDAO;
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
	public Boolean insertLeague(MembersVO user, LeagueVO league) {
		//리그 등록 서비스
		if(user == null) //로그인체크
			return false;
		if(!checkLeague(league)) // 필요한 리그정보 없을시 실패
			return false;
		leagueDao.insertLeague(league);
		
		return true;
	}
	private boolean checkLeague(LeagueVO league) {
		//리그정보체크
		if(league == null || league.getLg_name() == null || league.getLg_re_num() == 0)
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

}
