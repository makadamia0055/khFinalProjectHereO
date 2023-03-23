package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.PlayerDAO;
import com.hereo.project.dao.TeamPlayerDAO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.TeamPlayerVO;

@Service
public class PlayerServiceImp implements PlayerService{
	@Autowired
	PlayerDAO playerDao;
	@Autowired
	TeamPlayerDAO teamPlayerDao;
	
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
		playerList.add(tmpPlayer);
			
		}
		
		
		return playerList;
	}

}
