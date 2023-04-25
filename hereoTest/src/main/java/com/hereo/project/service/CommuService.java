package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.pagination.CommuCriteria;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.BoardVoteVO;
import com.hereo.project.vo.MembersVO;

public interface CommuService {

	ArrayList<BoardTypeVO> getBoardType(int me_siteauth);

	ArrayList<BoardTypeVO> getBoardType();

	ArrayList<BoardCategoryVO> getBoardCategory01(int bt_num);

	ArrayList<BoardCategoryVO> getBoardCategory02(int bt_num);


	BoardTypeVO getBoardTypebyBtNum(int bt_num);

	boolean enrollBoard(BoardVO board, MembersVO user, int boardType);

	BoardVO getBoardDetail(int bo_num);

	boolean updateBoard(BoardVO board);

	boolean deleteBoard(BoardVO board, MembersVO user);

	ArrayList<BoardVO> getBoard(int bt_num, CommuCriteria cri);

	int getBoardTotalCount(CommuCriteria cri, int bt_num);

	BoardVoteVO getBoardVote(MembersVO user, int bo_num);


}
