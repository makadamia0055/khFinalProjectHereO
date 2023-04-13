package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.TeamBoardDAO;
import com.hereo.project.dao.TeamDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.TeamVO;

@Service
public class TeamBoardServiceImp implements TeamBoardService {
	@Autowired
	TeamBoardDAO teamBoardDao;
	@Autowired
	TeamDAO teamDao;
	
	@Override
	public ArrayList<BoardVO> selectTeamBoardByTeam(TeamVO team, Criteria cri) {
		if(team==null)
			return null;
		if(cri==null)
			return null;
		
		return teamBoardDao.selectTeamBoardByTeam(team, cri);
	}

	@Override
	public int countTeamBoardTotalCnt(TeamVO team, Criteria cri) {
		if(team==null)
			return 0;
		if(cri==null)
			return 0;
		return teamBoardDao.countTeamBoardTotalCnt(team, cri);
	}

	@Override
	public ArrayList<BoardCategoryVO> selectTeamBoardCategory(Integer tm_num) {
		if(tm_num==null)
			return null;
		ArrayList<BoardCategoryVO> list = teamBoardDao.selectTeamBoardCategory(tm_num);
		if(list==null||list.size()==0) {
			teamBoardInit(tm_num);
			list = teamBoardDao.selectTeamBoardCategory(tm_num);
		}
		return list;
	}

	@Override
	public boolean insertBoardFromTeamBoard(BoardVO board, Integer teamNum) {
		if(board==null||board.getBo_title()==null||board.getBo_content()==null||board.getBo_me_id()==null)
			return false;
		if(teamDao.selectTeamByTm_num(teamNum)==null)
			return false;
		// 팀 만드는 순간 게시판 객체 등록 필요
		// 기본 말머리 등록 필요
		// 일단 여기에 기본 쿼리문 구현하되 나중에 처리하기
		BoardTypeVO bt = selectTeamBoardType(teamNum);
		board.setBo_bt_num(bt.getBt_num());
		
		return teamBoardDao.insertBoardFromTeamBoard(board) !=0;
		
	}
	@Override
	public BoardTypeVO selectTeamBoardType(Integer teamNum) {
		BoardTypeVO bt = teamBoardDao.selectTeamBoardType(teamNum);
		if(bt==null) {
			teamBoardInit(teamNum);
			bt = teamBoardDao.selectTeamBoardType(teamNum);
		}
		return bt;
	}

	private void teamBoardInit(Integer teamNum) {
		teamBoardDao.teamBoardInit(teamNum);
		BoardTypeVO bt = teamBoardDao.selectTeamBoardType(teamNum);

		teamBoardDao.callProcedureTeamBoardCategoryInit(bt.getBt_num());
		
		
	}

	@Override
	public BoardVO selectTeamBoardByBoNum(Integer boNum) {
		if(boNum==null)
			return null;
		return teamBoardDao.selectTeamBoardByBoNum(boNum);
	}

	@Override
	public boolean updateTeamBoard(BoardVO board) {
		return teamBoardDao.updateTeamBoard(board) != 0;
	}

	

}
