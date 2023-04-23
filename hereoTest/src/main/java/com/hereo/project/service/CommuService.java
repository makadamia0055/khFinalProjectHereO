package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.MembersVO;

public interface CommuService {

	ArrayList<BoardTypeVO> getBoardType(int me_siteauth);

	ArrayList<BoardTypeVO> getBoardType();

	ArrayList<BoardCategoryVO> getBoardCategory01(int bt_num);

	ArrayList<BoardCategoryVO> getBoardCategory02(int bt_num);

	ArrayList<BoardVO> getBoard(int bt_num);

	BoardTypeVO getBoardTypebyBtNum(int bt_num);

	boolean enrollBoard(BoardVO board, MembersVO user, int boardType);

	BoardVO getBoardDetail(int bo_num);

	boolean updateBoard(BoardVO board);

	boolean deleteBoard(BoardVO board, MembersVO user);


}
