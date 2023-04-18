package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hereo.project.dao.TeamBoardDAO;
import com.hereo.project.dao.TeamDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.utils.UploadFileUtils;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardFileVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.BoardVoteVO;
import com.hereo.project.vo.TeamVO;

@Service
public class TeamBoardServiceImp implements TeamBoardService {
	@Autowired
	TeamBoardDAO teamBoardDao;
	@Autowired
	TeamDAO teamDao;
	
	String uploadPath = "D:\\uploadfiles";

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
	public boolean insertBoardFromTeamBoard(BoardVO board, Integer teamNum, MultipartFile[] files) {
		if(board==null||board.getBo_title()==null||board.getBo_content()==null||board.getBo_me_id()==null)
			return false;
		if(teamDao.selectTeamByTm_num(teamNum)==null)
			return false;
		// 팀 만드는 순간 게시판 객체 등록 필요
		// 기본 말머리 등록 필요
		// 일단 여기에 기본 쿼리문 구현하되 나중에 처리하기
		BoardTypeVO bt = selectTeamBoardType(teamNum);
		board.setBo_bt_num(bt.getBt_num());
		
		boolean res = teamBoardDao.insertBoardFromTeamBoard(board) !=0;
		
//		게시글 파일 넣기 
		if(files!=null&&files.length!=0) {
			for(MultipartFile file : files) {
				if(file==null||file.getOriginalFilename().length()==0)
					continue;
				try {
					String uploadedFileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
					BoardFileVO tmpBoardFile = new BoardFileVO();
					tmpBoardFile.setBf_ori_filename(file.getOriginalFilename());
					tmpBoardFile.setBf_filename(uploadedFileName);
					tmpBoardFile.setBf_bo_num(board.getBo_num());
					
					teamBoardDao.insertBoardFile(tmpBoardFile);
					} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return res;
		
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

	@Override
	public ArrayList<BoardFileVO> selectTeamBoardFiles(Integer boNum) {
		if(boNum==null)
			return null;
		return teamBoardDao.selectTeamBoardFiles(boNum);
	}

	@Override
	public int insertOrUpdateVote(BoardVoteVO vote) {
		if(vote==null)
			return -1;
		BoardVoteVO prevVote = selectBoardVoteByBoNumAndMeId(vote.getBv_bo_num(), vote.getBv_me_id());
		if(prevVote ==null) {
			teamBoardDao.insertVote(vote);
			return 1;

		}else {
			vote.setBv_num(prevVote.getBv_num());
			if(vote.getBv_state()==prevVote.getBv_state()) {
//				같은 버튼을 누른 경우
				vote.setBv_state(0);
				teamBoardDao.updateVote(vote);
				return 0;
			}else {
//				다른 버튼을 누른 경우
			}
			
			teamBoardDao.updateVote(vote);
			return 1;
		}
		
	}
	
	@Override
	public BoardVoteVO selectBoardVoteByBoNumAndMeId(int bo_num, String bo_me_id) {
		if(bo_me_id ==null) 
			return null;
		
		return teamBoardDao.selectBoardVoteByBoNumAndMeId(bo_num, bo_me_id);
	}

	@Override
	public boolean deleteTeamBoard(int bo_num, String bo_me_id) {
		if(bo_me_id ==null)
			return false;
		return teamBoardDao.deleteTeamBoardByNumAndId(bo_num, bo_me_id)!=0;
	}

	
}
