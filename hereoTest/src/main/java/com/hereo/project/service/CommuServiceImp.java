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
		return selectBoardCategory;


	}

	@Override
	public ArrayList<BoardCategoryVO> getBoardCategory02(int bt_num) {
		ArrayList<BoardCategoryVO> selectBoardCategory = boardDao.selectBoardCategoryName(bt_num);
		return selectBoardCategory;
	}

	@Override
	public ArrayList<BoardVO> getBoard(int bt_num) {
		ArrayList<BoardVO> selectBoard=boardDao.selectBoard(bt_num);
		return selectBoard;
	}

	@Override
	public BoardTypeVO getBoardTypebyBtNum(int bt_num) {
		BoardTypeVO bt = boardDao.getBoardTypeBtNum(bt_num);
		return bt;
	}

	@Override
	public boolean enrollBoard(BoardVO board, MembersVO user, int boardType) {
		if(user==null)
			return false;
		board.setBo_me_id(user.getMe_id());
		board.setBo_bt_num(boardType);
		boardDao.enrollBoard(board);
		
		return true;
		
	}

	@Override
	public BoardVO getBoardDetail(int bo_num) {
		boardDao.updateBoardViews(bo_num);
		BoardVO boardDetail = boardDao.selectBoardDetail(bo_num);
		return boardDetail;
	}

	@Override
	public boolean updateBoard(BoardVO board) {		
		
		boardDao.updateBoard(board);
		System.out.println(board);
		return true;
	}

	@Override
	public void deleteBoard(BoardVO board) {
		//삭제 구현중임.
		
	}
}


