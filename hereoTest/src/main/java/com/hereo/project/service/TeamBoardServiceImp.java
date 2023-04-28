package com.hereo.project.service;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hereo.project.dao.TeamBoardDAO;
import com.hereo.project.dao.TeamDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.utils.UploadFileUtils;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardFileVO;
import com.hereo.project.vo.BoardReplyVO;
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
		insertBoardFile(board.getBo_num(), files);
		
		return res;
		
	}
	private void insertBoardFile(int bonum, MultipartFile[] files) {
		if(files!=null&&files.length!=0) {
			for(MultipartFile file : files) {
				if(file==null||file.getOriginalFilename().length()==0)
					continue;
				try {
					String uploadedFileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
					BoardFileVO tmpBoardFile = new BoardFileVO();
					tmpBoardFile.setBf_ori_filename(file.getOriginalFilename());
					tmpBoardFile.setBf_filename(uploadedFileName);
					tmpBoardFile.setBf_bo_num(bonum);
					
					teamBoardDao.insertBoardFile(tmpBoardFile);
					} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
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
		ArrayList<BoardFileVO> files = selectTeamBoardFiles(bo_num);
		if(teamBoardDao.deleteTeamBoardByNumAndId(bo_num, bo_me_id)==0)
			return false;
		for(BoardFileVO file : files) {
			UploadFileUtils.removeFile(uploadPath, file.getBf_filename());
			
		}
		
		
		return true;
	}

	@Override
	public boolean deleteTeamBoardByAuth(int bo_num) {
		
		return teamBoardDao.deleteTeamBoardByAuth(bo_num)!=0;
	}

	@Override
	public boolean insertReply(BoardReplyVO reply) {
		if(reply==null||reply.getBr_me_id()==null||reply.getBr_me_id().trim().length()==0||
				reply.getBr_contents()==null||reply.getBr_contents().trim().length()==0)
			return false;
		
		boolean res =teamBoardDao.insertReply(reply)!=0;
		reply.setBr_groupOrd(reply.getBr_groupOrd()+1);
		updateReplyPlusOne(reply);	
				
		return res;
	}

	@Override
	public int countReply(int bo_num) {
		return teamBoardDao.countReply(bo_num);
	}

	@Override
	public ArrayList<BoardReplyVO> selectReplyByBoNumAndCri(Criteria cri, Integer bo_num) {
		if(cri==null) {
			cri=new Criteria();
		}
		if(bo_num==null||bo_num<1)
			return null;
		return teamBoardDao.selectReplyByBoNumAndCri(cri, bo_num);
	}

	@Override
	public String selectMeIdByBrOriNum(Integer br_ori_num) {
		return teamBoardDao.selectMeIdByBrOriNum(br_ori_num);
	}

	@Override
	public boolean deleteReply(Integer br_num) {
		if(br_num == null)
			return false;
//		프론트 단에서 해결하기로 결정
//		if(teamBoardDao.beforeDeleteReplyChecker(br_num)!=0) {
//			teamBoardDao.updateToDeletedReply(br_num);
//			return true;
//		}
		return teamBoardDao.deleteReply(br_num)!=0;
	}
	@Override
	public boolean updateReply(BoardReplyVO reply) {
		if(reply==null||reply.getBr_me_id()==null||reply.getBr_me_id().trim().length()==0||
				reply.getBr_contents()==null||reply.getBr_contents().trim().length()==0)
			return false;
		
		return teamBoardDao.updateReply(reply)!=0;
	}

	@Override
	public BoardFileVO uploadSummerNoteImg(MultipartFile file) {
		if(file==null||file.getOriginalFilename().length()==0)
			return null;
		
		BoardFileVO tmpBoardFile = new BoardFileVO();
		try {
			String uploadedFileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			tmpBoardFile.setBf_ori_filename(file.getOriginalFilename());
			tmpBoardFile.setBf_filename(uploadedFileName);
			tmpBoardFile.setBf_issummernote(true);
			
			teamBoardDao.insertBoardFileSummerNote(tmpBoardFile);
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tmpBoardFile;
	}

	@Override
	public void updateSummerNoteImg(int bo_num, String resArr, String tmpArr) {
		ArrayList<Integer> resList = strToList(resArr);
		ArrayList<Integer> tmpList = strToList(tmpArr);
		
		for(int i = 0; i<tmpList.size();i++) {
			if(!resList.contains(tmpList.get(i)))
				continue;
			tmpList.remove(i);
		}
		for(Integer res : resList) {
			teamBoardDao.updateSummerNoteImg(bo_num, res);
		}
		for(int i = 0 ; i<tmpList.size(); i++) {
			BoardFileVO bf = teamBoardDao.selectTeamBoardFilesByBfNum(tmpList.get(i));
			UploadFileUtils.removeFile(uploadPath, bf.getBf_filename());
		
		}
		if(tmpList.size()==0)
			return;
		for(Integer tmp : tmpList) {
				teamBoardDao.deleteSummerNoteImg(bo_num, tmp);
		}
		
				
	}
	
	private ArrayList<Integer> strToList(String str){
		StringTokenizer st = new StringTokenizer(str, ",");
		ArrayList<Integer> list = new ArrayList<Integer>();
		while(st.hasMoreTokens()) {
			list.add(Integer.parseInt(st.nextToken()));
		}
		return list;
	}

	@Override
	public boolean UpdateBoardFromTeamBoard(BoardVO board, Integer teamNum, MultipartFile[] files) {
		if(board==null||board.getBo_title()==null||board.getBo_content()==null||board.getBo_me_id()==null)
			return false;
		if(teamDao.selectTeamByTm_num(teamNum)==null)
			return false;
		
		BoardTypeVO bt = selectTeamBoardType(teamNum);
		board.setBo_bt_num(bt.getBt_num());
		
		boolean res = teamBoardDao.updateBoardFromTeamBoard(board) !=0;
		
//		게시글 파일 넣기 
		insertBoardFile(board.getBo_num(), files);
		return res;
	}

	@Override
	public void deleteBoardFilesByBFNum(Integer s) {
		BoardFileVO file = teamBoardDao.selectTeamBoardFilesByBfNum(s);
		UploadFileUtils.removeFile(uploadPath, file.getBf_filename());

		teamBoardDao.deleteBoardFilesByBfNum(s);
	}
	public void updateReplyPlusOne(BoardReplyVO reply) {
		
		teamBoardDao.updateReplyPlusOne(reply);
	}
}
