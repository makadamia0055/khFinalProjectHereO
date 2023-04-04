package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.Position_HopeVO;
import com.hereo.project.vo.TeamVO;

public interface PlayerService {

	ArrayList<PlayerVO> selectPlayerByTm_Num(Integer teamNum);
	
	ArrayList<Position_HopeVO> selectPositionHopeByPlayer(PlayerVO player);
	
	PlayerVO selectPlayerByPl_Num(Integer player);



	boolean insertPlayerToTeam(TeamVO team, PlayerVO player, int auth);

	PlayerVO selectPlayerByMeId(String me_id);

	boolean updateBackNum(TeamVO team, PlayerVO player, Integer tm_backnum);

}
