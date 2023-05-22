package com.hereo.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.RegionSubVO;

public interface RegionSubDAO {

	List<RegionSubVO> getRegionSubList(@Param("re_num")int re_num);
	
	void insertRegionSub(@Param("regionSub")RegionSubVO regionSub);
	
	RegionSubVO selectRegionSub(@Param("regionSub")RegionSubVO regionSub);

	RegionSubVO getRegionSubByNum(@Param("rd_rs_num")int rd_rs_num);

	RegionSubVO selectRegionSubByRsGu(@Param("rs_gu")String rs_gu, @Param("re_num")int re_num);


}
