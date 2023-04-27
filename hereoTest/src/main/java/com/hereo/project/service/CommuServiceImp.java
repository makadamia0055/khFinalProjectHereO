package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.BoardDAO;
import com.hereo.project.dao.MembersDAO;
import com.hereo.project.pagination.CommuCriteria;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.BoardVoteVO;
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
		return true;
	}

	@Override
	public boolean deleteBoard(BoardVO board, MembersVO user) {
		if(user==null)
			return false;
		
		boardDao.deleteBoard(board);
		return true; 
		
	}

	@Override
	public ArrayList<BoardVO> getBoard(int bt_num, CommuCriteria cri) {
		 if(cri==null)
			 cri= new CommuCriteria();
		return boardDao.getBoardList(cri, bt_num);
	}

	@Override
	public int getBoardTotalCount(CommuCriteria cri, int bt_num) {
		
		return boardDao.getBoardTotalCount(cri, bt_num);
	}

	@Override
	public BoardVoteVO getBoardVote(MembersVO user, int bo_num) {
		if(user==null)
			return null;
		BoardVoteVO voteVo = boardDao.getBoardVote(user.getMe_id(), bo_num);
		return voteVo;
	}

	@Override
	public int updateUpdown(int bv_bo_num, int bv_state, MembersVO user) {
		if(user==null)
			return -100;
		
		int res=0;
		BoardVoteVO voteVo = boardDao.getBoardVote(user.getMe_id(), bv_bo_num);
		
		if(voteVo == null) {
			BoardVoteVO updownVo = new BoardVoteVO(bv_bo_num, user.getMe_id(), bv_state);
			boardDao.insertUpdown(updownVo);
			res=bv_state;
		}else if (voteVo.getBv_state()==bv_state) {
			BoardVoteVO updownVo= new BoardVoteVO(bv_bo_num,user.getMe_id(),0);
			boardDao.updateUpdown(updownVo);
			res=0;
		}else {
			BoardVoteVO updownVo= new BoardVoteVO(bv_bo_num,user.getMe_id(),bv_state);
			boardDao.updateUpdown(updownVo);
			res=bv_state;
		}

		boardDao.updateBoardUpDown(bv_bo_num);
		return res;
	}

	@Override
	public ArrayList<BoardVO> getTopFiveBoard(int bt_num) {
		
		return boardDao.getTopFiveBoard(bt_num);
	}

	@Override
	public ArrayList<BoardVO> getAllBoardForHot() {
		
		return boardDao.getAllBoardForHot();
	}
}


