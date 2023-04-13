package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;
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

	

}
