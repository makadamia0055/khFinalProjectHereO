package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardFileVO;
import com.hereo.project.vo.BoardReplyVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.BoardVoteVO;
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

	int insertOrUpdateVote(BoardVoteVO vote);
	
	BoardVoteVO selectBoardVoteByBoNumAndMeId(int bo_num, String bo_me_id);

	boolean deleteTeamBoard(int bo_num, String bo_me_id);

	boolean deleteTeamBoardByAuth(int bo_num);

	boolean insertReply(BoardReplyVO reply);

	int countReply(int bo_num);

	ArrayList<BoardReplyVO> selectReplyByBoNumAndCri(Criteria cri, Integer bo_num);

	String selectMeIdByBrOriNum(Integer br_ori_num);

	boolean deleteReply(Integer br_num);

	boolean updateReply(BoardReplyVO reply);

	BoardFileVO uploadSummerNoteImg(MultipartFile file);

	void updateSummerNoteImg(int bo_num, String resArr, String tmpArr);

	boolean UpdateBoardFromTeamBoard(BoardVO board, Integer teamNum, MultipartFile[] files);

	void deleteBoardFilesByBFNum(Integer s);

}
