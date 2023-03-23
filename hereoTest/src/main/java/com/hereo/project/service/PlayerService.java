package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.PlayerVO;

public interface PlayerService {

	ArrayList<PlayerVO> selectPlayerByTm_Num(Integer teamNum);

}
