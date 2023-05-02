package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.RegionDetailVO;
import com.hereo.project.vo.StadiumImageVO;
import com.hereo.project.vo.StadiumTimetableVO;
import com.hereo.project.vo.StadiumVO;

public interface StadiumDAO {

	void insertFile(@Param("sdImage")StadiumImageVO stadiumImageVo);

	void insertStadium(@Param("stadium")StadiumVO stadium);
	
	ArrayList<StadiumVO> selectBoardList(@Param("cri")Criteria cri);

	int selectStadiumTotalCount(@Param("cri")Criteria cri);

	StadiumVO selectStadium(@Param("sd_num")int sd_num);

	ArrayList<StadiumImageVO> selectFileList(@Param("sd_num")int sd_num);

	void insertStadiumImage(@Param("file")StadiumImageVO file);

	RegionDetailVO selectRegionDetail(@Param("rd_num")int rd_num);

	ArrayList<StadiumTimetableVO> selectStadiumTimetableList(@Param("user")MembersVO user);


}
