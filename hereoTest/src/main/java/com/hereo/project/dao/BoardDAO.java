package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.BoardTypeVO;

public interface BoardDAO {

	ArrayList<BoardTypeVO> selectBoardType(@Param("auth")int me_siteauth);

}
