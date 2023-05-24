package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.RegionDetailVO;
import com.hereo.project.vo.StadiumImageVO;
import com.hereo.project.vo.StadiumTimetableVO;
import com.hereo.project.vo.StadiumVO;

public interface StadiumService {

	ArrayList<StadiumVO> getStadiumList(Criteria cri);

	int getStadiumTotalCount(Criteria cri);
	
	StadiumVO getStadium(int sd_num, MembersVO user);

	ArrayList<StadiumImageVO> getFileList(int sd_num);

	void insertStadium(StadiumVO stadium, MembersVO user, MultipartFile[] files, String sido);

	RegionDetailVO getRegionDetail(int rd_num);

	ArrayList<StadiumTimetableVO> getStadiumTimetableList(MembersVO user);

	StadiumVO selectStadiumByStnum(int stadium);

	

	




}
