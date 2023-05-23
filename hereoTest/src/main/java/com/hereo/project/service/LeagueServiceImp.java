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
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.TeamPlayerVO;
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
	public ArrayList<LeagueAttributeVO> selectLeagueAttListByLgNum(int lg_num) {
		if(lg_num == 0)
			return null;
		return leagueDao.selectLeagueAttListByLgNum(lg_num);
	}
	@Override
	public ArrayList<LeagueScheduleVO> selectLeagueScheduleList(int la_num) {
		if(la_num == 0)
			return null;
		LeagueAttributeVO la = leagueDao.selectLeagueAttByLgNum(la_num, "프로리그");
		if(la == null)
			return null;
		return leagueDao.selectLeagueScheduleList(la.getLa_num());
	}
	@Override
	public ArrayList<LeagueParticipationteamVO> getSelectLeaguePartiList(int lg_num) {
		if(lg_num == 0)
			return null;
		LeagueAttributeVO la = leagueDao.selectLeagueAttByLgNum(lg_num, "프로리그");
		if(la == null)
			return null;
		return leagueDao.selectLeaguePartiList(la.getLa_num());
	}
	@Override
	public Boolean insertLeague(LeagueVO league, MembersVO user) {
		//리그 등록 서비스
		if(user == null)
			return false;
		if(!checkLeague(league)) // 필요한 리그정보 없을시 실패
			return false;
		league.setLg_me_id(user.getMe_id());
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
		if(la.getLa_name() == null || la.getLa_match_type() == null)
			return false;
		la.setLa_lg_num(lg_num);
		
		int isOk = leagueDao.insertLeagueType(la);
		if(isOk == 0)
			return false;
		
		return true;
	}
	//리그타입 수정
	@Override
	public boolean updateLeagueType(LeagueAttributeVO la) {

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
	
	//리그 참가 승인
	@Override
	public int leagueApproval(int lp_num, int lp_approval, int lp_tm_num) {
		if(lp_num < 1)
			return -100;
		int res = 0;
		LeagueParticipationteamVO dbLp = leagueDao.selectleagueApproval(lp_num);
		if( dbLp.getLp_tm_num() != lp_tm_num)
			return -100;
		
		if(dbLp.getLp_approval() == lp_approval) {
			LeagueParticipationteamVO lpVo = new LeagueParticipationteamVO(lp_num, lp_approval, lp_tm_num);
			leagueDao.updateleagueApproval(lpVo);
			res = 0;
		}else {
			LeagueParticipationteamVO lpVo = new LeagueParticipationteamVO(lp_num, lp_approval, lp_tm_num);
			leagueDao.updateleagueApproval(lpVo);
			res = lp_approval;
		}
		return res;
	}
	@Override
	public LeagueParticipationteamVO getLeagueParti(int lp_num) {
		return leagueDao.selectLeaguePartiByLpNum(lp_num);
	}
	@Override
	public boolean updateLeaguePartiTeam(LeagueAttributeVO la, int la_num) {
		if(la == null)
			return false;
		return leagueDao.updateLeaguePartiTeam(la, la_num) != 0 ;
	}
	
	//리그 참가신청 (팀)
	@Override
	public int insertLeagueAttByTeam(int la_num, String me_id) {
		if(me_id == null)
			return -100;
		int res = 0;
		PlayerVO player = leagueDao.selectPlayerByUser(me_id);
		TeamPlayerVO tPlayer = leagueDao.selectTplayerByPlNum(player.getPl_num());
		//팀에 소속되어 있는지 확인
		if(tPlayer.getTp_tm_num() < 1)
			return -100;
		TeamVO team = leagueDao.selectTeamByTpNum(tPlayer.getTp_tm_num());
		
		//팀이 리그신청이 되어있는지 확인 
		LeagueParticipationteamVO dbLp = leagueDao.selectLeaguePartiTeamByLeagueAtt(team.getTm_num(), la_num);
		
		if(dbLp != null) {
			res = 3;
		}else {
			LeagueParticipationteamVO lpVo = new LeagueParticipationteamVO(team.getTm_num(), la_num);
			leagueDao.insertLeaguePartiByTmNum(lpVo);
			res = 2;
		}
			
		
		return res;
	}
	@Override
	public MembersVO getSelectMember(String me_id) {
		if(me_id == null)
			return null;
		return leagueDao.selectMemberByMeid(me_id);
	}


}
