package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.TeamVO;

public interface TeamService {

	ArrayList<TeamVO> selectAllTeamsByCri(Criteria criteria);

	TeamVO selectTeamByTm_Num(Integer teamNum);

	int countTeams();

	boolean insertTeam(TeamVO team, MultipartFile imgFile);



}
