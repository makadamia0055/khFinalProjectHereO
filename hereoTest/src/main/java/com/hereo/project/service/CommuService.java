package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;

public interface CommuService {

	ArrayList<BoardTypeVO> getBoardType(int me_siteauth);

	ArrayList<BoardTypeVO> getBoardType();

	ArrayList<BoardCategoryVO> getBoardCategory01(int bt_num);

	ArrayList<BoardCategoryVO> getBoardCategory02(int bt_num);

	ArrayList<BoardVO> getFreeBoard(int bt_num);

	BoardTypeVO getBoardTypebyBtNum(int bt_num);


}
