package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.TeamVO;

public interface TeamBoardDAO {

	ArrayList<BoardVO> selectTeamBoardByTeam(@Param("tm")TeamVO team, @Param("cri")Criteria cri);

	int countTeamBoardTotalCnt(@Param("tm")TeamVO team, @Param("cri")Criteria cri);

	ArrayList<BoardCategoryVO> selectTeamBoardCategory(@Param("tm")TeamVO team);

}
