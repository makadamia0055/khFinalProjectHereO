package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.PlayerDAO;
import com.hereo.project.dao.PositionDAO;
import com.hereo.project.dao.TeamPlayerDAO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.Position_HopeVO;
import com.hereo.project.vo.TeamPlayerVO;

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
}
