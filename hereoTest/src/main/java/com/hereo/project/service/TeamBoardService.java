package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardFileVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.TeamVO;

public interface TeamBoardService {

	ArrayList<BoardVO> selectTeamBoardByTeam(TeamVO team, Criteria cri);

	int countTeamBoardTotalCnt(TeamVO team, Criteria cri);

	ArrayList<BoardCategoryVO> selectTeamBoardCategory(Integer tm_num);

	boolean insertBoardFromTeamBoard(BoardVO board, Integer teamNum, MultipartFile[] files);
	
	public BoardTypeVO selectTeamBoardType(Integer teamNum);

	BoardVO selectTeamBoardByBoNum(Integer boNum);

	boolean updateTeamBoard(BoardVO board);

	ArrayList<BoardFileVO> selectTeamBoardFiles(Integer boNum);

}
