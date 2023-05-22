package com.hereo.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.RegionDetailVO;
import com.hereo.project.vo.RegionVO;

public interface RegionDAO {
	
	RegionVO getRegionByNum(@Param("rs_re_num")int rs_re_num);

	void insertRegionDetail(@Param("regionDetail")RegionDetailVO regionDetail);

	void saveRegionDetail(@Param("regionDetail")RegionDetailVO regionDetail);

	List<RegionVO> selectRegion();

	void insertRegion(@Param("region")RegionVO region);

	RegionVO[] selectAllRegion();

	RegionVO selectRegionBySido(String re_sido);

}
