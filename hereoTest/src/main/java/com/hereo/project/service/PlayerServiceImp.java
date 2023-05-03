package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.PlayerDAO;
import com.hereo.project.dao.PositionDAO;
import com.hereo.project.dao.TeamPlayerDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.Position_HopeVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;

@Service
public class PlayerServiceImp implements PlayerService{
	@Autowired
	PlayerDAO playerDao;
	@Autowired
	TeamPlayerDAO teamPlayerDao;
	@Autowired
	PositionDAO positionDao;
	
	@Override
	public ArrayList<PlayerVO> selectPlayerByTm_Num(Integer teamNum) {
		if(teamNum==null||teamNum<0)
			return null;
		ArrayList<TeamPlayerVO> teamPlayerList = teamPlayerDao.selectPlayerListByTeam(teamNum);
		if(teamPlayerList==null||teamPlayerList.size()==0)
			return null;
		ArrayList<PlayerVO> playerList = new ArrayList<PlayerVO>();
		for(TeamPlayerVO tmp : teamPlayerList) {
			PlayerVO tmpPlayer = playerDao.selectPlayerByTP(tmp);
			if(tmpPlayer==null)
				continue;
			if(tmpPlayer.getTeamList()!=null)
				tmpPlayer.setTeamList(teamPlayerList);
			ArrayList<Position_HopeVO> tmpPositionList = selectPositionHopeByPlayer(tmpPlayer);
			tmpPlayer.setPositionList(tmpPositionList);
			playerList.add(tmpPlayer);
			
		}
		
		
		return playerList;
	}
//	아직 미구현
	@Override
	public ArrayList<PlayerVO> selectPlayerByTm_Num(Integer teamNum, Criteria cri) {
		if(teamNum==null||teamNum<0)
			return null;
		ArrayList<TeamPlayerVO> teamPlayerList = teamPlayerDao.selectPlayerListByTeam(teamNum);
		if(teamPlayerList==null||teamPlayerList.size()==0)
			return null;
		ArrayList<PlayerVO> playerList = new ArrayList<PlayerVO>();
		for(TeamPlayerVO tmp : teamPlayerList) {
			PlayerVO tmpPlayer = playerDao.selectPlayerByTP(tmp);
			if(tmpPlayer==null)
				continue;
			if(tmpPlayer.getTeamList()!=null)
				tmpPlayer.setTeamList(teamPlayerList);
			ArrayList<Position_HopeVO> tmpPositionList = selectPositionHopeByPlayer(tmpPlayer);
			tmpPlayer.setPositionList(tmpPositionList);
			playerList.add(tmpPlayer);
			
		}
		
		
		return playerList;
	}
	@Override
	public ArrayList<PlayerVO> selectPlayerByTm_Num(Integer teamNum, int auth) {
		if(teamNum==null||teamNum<0)
			return null;
		ArrayList<TeamPlayerVO> teamPlayerList = teamPlayerDao.selectPlayerListByTeamAndAuth(teamNum, auth);
		if(teamPlayerList==null||teamPlayerList.size()==0)
			return null;
		ArrayList<PlayerVO> playerList = new ArrayList<PlayerVO>();
		for(TeamPlayerVO tmp : teamPlayerList) {
			PlayerVO tmpPlayer = playerDao.selectPlayerByTP(tmp);
			if(tmpPlayer==null)
				continue;
			if(tmpPlayer.getTeamList()!=null)
				tmpPlayer.setTeamList(teamPlayerList);
			ArrayList<Position_HopeVO> tmpPositionList = selectPositionHopeByPlayer(tmpPlayer);
			tmpPlayer.setPositionList(tmpPositionList);
			playerList.add(tmpPlayer);
			
		}
		
		
		return playerList;
	}
	public ArrayList<Position_HopeVO> selectPositionHopeByPlayer(PlayerVO player){
		if(player==null||player.getPl_num()<0)
			return null;
		ArrayList<Position_HopeVO> list = positionDao.selectPlayerPosition_H(player);
		
		
		return list;
	}
	@Override
	public PlayerVO selectPlayerByPl_Num(Integer player) {
		if(player==null)
			return null;
		PlayerVO playerVO = playerDao.selectPlayerByNum(player);
		ArrayList<Position_HopeVO> list =selectPositionHopeByPlayer(playerVO);
		ArrayList<TeamPlayerVO> tpList = teamPlayerDao.selectTPlayerListByPl_Num(player);
		playerVO.setPositionList(list);
		return playerVO;
	}
	@Override
	public boolean insertPlayerToTeam(TeamVO team, PlayerVO player, int auth) {
		if(team==null||team.getTm_num()<0)
			return false;
		if(player==null||player.getPl_num()<0)
			return false;
		
		return teamPlayerDao.insertMembersToTeam(team, player, auth) !=0;
	}
	@Override
	public PlayerVO selectPlayerByMeId(String me_id) {
		if(me_id==null)
			return null;
		
		return playerDao.selectPlayerByMeId(me_id);
	}
	@Override
	public boolean updateBackNum(TeamVO team, PlayerVO player, Integer tm_backnum) {
		if(team==null)
			return false;
		if(player==null)
			return false;
		TeamPlayerVO teamPlayer = teamPlayerDao.selectTeamPlayerByTeamAndPlayer(team.getTm_num(), player.getPl_num());
		teamPlayer.setTp_backnum(tm_backnum);
		
		return teamPlayerDao.updateTeamPlayer(teamPlayer) != 0; 
	}
	@Override
	public int countTeamPlayers(int teamNum, int auth, Criteria cri) {
		return teamPlayerDao.countTeamMember(teamNum, auth, cri);
	}
	@Override
	public boolean checkBackNum(int tm_num, Integer backNum) {
		if(backNum==null)
			return false;
		return teamPlayerDao.checkBackNum(tm_num, backNum)==0;
	}
	@Override
	public boolean insertNewTeamPlayer(TeamPlayerVO tmp) {
		if(tmp==null)
			return false;
		
		return teamPlayerDao.insertNewTeamPlayer(tmp)!=0;
	}
	
	@Override
	public boolean hasNoTeam(int pl_num) {
		return teamPlayerDao.hasTeam(pl_num)==0;
	}
//	팀 선수 객체를 선수 번호와 팀번호로 가져오는 메소드
	@Override
	public TeamPlayerVO selectTeamPlayerByPlNumAndTmNum(int pl_num, Integer tm_num) {
		if(pl_num == 0||tm_num==null||tm_num==0)
			return null;
		return teamPlayerDao.selectTeamPlayerByPlNumAndTmNum(pl_num, tm_num);
	}
	@Override
	public ArrayList<TeamPlayerVO> selectTPByTmNum(int tm_num) {
		if(tm_num == 0)
			return null;
		return teamPlayerDao.selectPlayerListByTeam(tm_num);
	}
}
