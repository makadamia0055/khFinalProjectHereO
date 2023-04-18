package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.BoardDAO;
import com.hereo.project.dao.MembersDAO;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.MembersVO;

@Service
public class CommuServiceImp implements CommuService {
	
	@Autowired
	BoardDAO boardDao;
	
	
	@Override
	public ArrayList<BoardTypeVO> getBoardType(int me_siteauth) {
		// 확인용 System.out.println(boardDao.selectBoardType(me_siteauth));
		return boardDao.selectBoardType(me_siteauth);
	}

	@Override
	public ArrayList<BoardTypeVO> getBoardType() {

		return boardDao.selectAllBoardType();
	}

	@Override
	public ArrayList<BoardCategoryVO> getBoardCategory01(int bt_num) {
		ArrayList<BoardCategoryVO> selectBoardCategory = boardDao.selectBoardCategoryRegion(bt_num);
		System.out.println("서비스1"+selectBoardCategory);
		return selectBoardCategory;


	}

	@Override
	public ArrayList<BoardCategoryVO> getBoardCategory02(int bt_num) {
		ArrayList<BoardCategoryVO> selectBoardCategory = boardDao.selectBoardCategoryName(bt_num);
		System.out.println("서비스1"+selectBoardCategory);
		return selectBoardCategory;
	}

	@Override
	public ArrayList<BoardVO> getFreeBoard(int bt_num) {
		ArrayList<BoardVO> selectFreeBoard=boardDao.selectFreeBoard(bt_num);
		return selectFreeBoard;
	}

	@Override
	public BoardTypeVO getBoardTypebyBtNum(int bt_num) {
		BoardTypeVO bt = boardDao.getBoardTypeBtNum(bt_num);
		return bt;
	}

	@Override
	public boolean enrollBoard(BoardVO board, MembersVO user) {
		if(user==null)
			return false;
		board.setBo_me_id(user.getMe_id());
		boardDao.enrollBoard(board);
		
		return true;
		
	}
}


