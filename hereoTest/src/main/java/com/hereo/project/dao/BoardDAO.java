package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.CommuCriteria;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.BoardVoteVO;
import com.hereo.project.vo.MembersVO;

public interface BoardDAO {

	ArrayList<BoardTypeVO> selectBoardType(@Param("auth")int me_siteauth);

	ArrayList<BoardTypeVO> selectAllBoardType();

	ArrayList<BoardCategoryVO> selectBoardCategoryRegion(@Param("bt_num")int bt_num);

	ArrayList<BoardCategoryVO> selectBoardCategoryName(@Param("bt_num")int bt_num);


	BoardTypeVO getBoardTypeBtNum(@Param("bt_num") int bt_num);

	void enrollBoard(@Param("bo") BoardVO board);

	BoardVO selectBoardDetail(@Param("bo_num") int bo_num);

	void updateBoardViews(int bo_num);

	void updateBoard(@Param("bo") BoardVO board);

	void deleteBoard(@Param("bo") BoardVO board);

	ArrayList<BoardVO> getBoardList(@Param("cri") CommuCriteria cri, @Param("bt_num") int bt_num);

	int getBoardTotalCount(@Param("cri") CommuCriteria cri, @Param("bt_num") int bt_num);

	BoardVoteVO getBoardVote(@Param("user")MembersVO user, @Param("bo_num")int bo_num);



}
