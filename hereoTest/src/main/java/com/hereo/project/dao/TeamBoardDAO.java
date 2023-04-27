package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardFileVO;
import com.hereo.project.vo.BoardReplyVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.BoardVoteVO;
import com.hereo.project.vo.TeamVO;

public interface TeamBoardDAO {

	ArrayList<BoardVO> selectTeamBoardByTeam(@Param("tm")TeamVO team, @Param("cri")Criteria cri);

	int countTeamBoardTotalCnt(@Param("tm")TeamVO team, @Param("cri")Criteria cri);

	ArrayList<BoardCategoryVO> selectTeamBoardCategory(Integer tm_num);

	BoardTypeVO selectTeamBoardType(Integer teamNum);

	void teamBoardInit(Integer teamNum);

	int insertBoardFromTeamBoard(@Param("bo")BoardVO board);

	void callProcedureTeamBoardCategoryInit(Integer btNum);

	BoardVO selectTeamBoardByBoNum(Integer boNum);

	int updateTeamBoard(@Param("bo")BoardVO board);

	void insertBoardFile(@Param("bf")BoardFileVO tmpBoardFile);

	ArrayList<BoardFileVO> selectTeamBoardFiles(Integer boNum);

	BoardVoteVO selectBoardVoteByBoNumAndMeId(@Param("bv_bo_num")int bv_bo_num, @Param("bv_me_id")String bv_me_id);

	int insertVote(@Param("bv")BoardVoteVO vote);

	int updateVote(@Param("bv")BoardVoteVO vote);

	int deleteTeamBoardByNumAndId(@Param("bo_num")int bo_num, @Param("bo_me_id")String bo_me_id);

	int deleteTeamBoardByAuth(int bo_num);

	int insertReply(@Param("br")BoardReplyVO reply);

	int countReply(int bo_num);

	ArrayList<BoardReplyVO> selectReplyByBoNumAndCri(@Param("cri")Criteria cri, @Param("bo_num")int bo_num);

	String selectMeIdByBrOriNum(Integer br_ori_num);

	int deleteReply(Integer br_num);

	int updateReply(@Param("br")BoardReplyVO reply);

	void insertBoardFileSummerNote(@Param("bf")BoardFileVO tmpBoardFile);

	void updateSummerNoteImg(@Param("bo_num")int bo_num, @Param("bf_num")Integer resList);

	void deleteSummerNoteImg(@Param("bo_num")int bo_num, @Param("bf_num")Integer tmpList);

	BoardFileVO selectTeamBoardFilesByBfNum(Integer bf_num);

	int updateBoardFromTeamBoard(@Param("bo")BoardVO board);

	void deleteBoardFilesByBfNum(Integer bf_num);

	void updateToDeletedReply(Integer br_num);

	int beforeDeleteReplyChecker(Integer br_num);

	

}
