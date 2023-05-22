package com.hereo.project.service;

import java.util.List;

import com.hereo.project.vo.RegionDetailVO;
import com.hereo.project.vo.RegionSubVO;
import com.hereo.project.vo.RegionVO;

public interface RegionService {

	List<RegionVO> getRegion();

	RegionSubVO getRegionSub(RegionSubVO regionSub);

	void insertRegionDetail(RegionDetailVO regionDetail);

	void insertRegion(RegionVO region);

	List<RegionSubVO> getRegionSubList(int re_num);

	void insertRegionSub(RegionSubVO regionSub);

	List<RegionDetailVO> getRegionDetail(int rd_num);

	RegionSubVO checkRegionSub(RegionVO region, RegionSubVO regionSub);

	RegionDetailVO checkRegionDetail(RegionDetailVO regionDetail);


	
}
