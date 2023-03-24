package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.Position_HopeVO;

public interface PlayerService {

	ArrayList<PlayerVO> selectPlayerByTm_Num(Integer teamNum);
	
	ArrayList<Position_HopeVO> selectPositionHopeByPlayer(PlayerVO player);
	
	PlayerVO selectPlayerByPl_Num(Integer player);

}
