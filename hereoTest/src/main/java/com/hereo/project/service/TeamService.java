package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.TeamVO;

public interface TeamService {

	ArrayList<TeamVO> selectAllTeams();

	TeamVO selectTeamByTm_Num(Integer teamNum);



}