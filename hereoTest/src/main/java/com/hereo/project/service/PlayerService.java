package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.Position_HopeVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;

public interface PlayerService {

	ArrayList<PlayerVO> selectPlayerByTm_Num(Integer teamNum);

	ArrayList<PlayerVO> selectPlayerByTm_Num(Integer teamNum, Criteria cri);
	
	ArrayList<Position_HopeVO> selectPositionHopeByPlayer(PlayerVO player);
	
	PlayerVO selectPlayerByPl_Num(Integer player);

	

	boolean insertPlayerToTeam(TeamVO team, PlayerVO player, int auth);

	PlayerVO selectPlayerByMeId(String me_id);

	boolean updateBackNum(TeamVO team, PlayerVO player, Integer tm_backnum);

	ArrayList<PlayerVO> selectPlayerByTm_Num(Integer teamNum, int auth);

	int countTeamPlayers(int teamNum, int auth, Criteria cri);

	boolean checkBackNum(int tm_num, Integer backNum);

	boolean insertNewTeamPlayer(TeamPlayerVO tmp);

	public boolean hasNoTeam(int pl_num);

	TeamPlayerVO selectTeamPlayerByPlNumAndTmNum(int pl_num, Integer tm_num);

	ArrayList<TeamPlayerVO> selectTPByTmNum(int tm_num); 


}
