package com.hereo.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.RegionDetailVO;

public interface RegionDetailDAO {

	RegionDetailVO getRegionDetailByNum(@Param("rd_num")int rd_num);
	
	void insertRegionDetail(@Param("regionDetail")RegionDetailVO regionDetail);

	RegionDetailVO getRegionDetailByCode(@Param("rs_num")int rs_num, @Param("rd_zipcode")String rd_zipcode);

	List<RegionDetailVO> selectRegionDetail(@Param("rd_num")int rd_num);

	RegionDetailVO selectRegionDetailByPostOrAddress(@Param("rd")RegionDetailVO regionDetail);
	
}
