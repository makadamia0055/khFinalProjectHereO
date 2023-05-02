package com.hereo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.RegionDAO;
import com.hereo.project.dao.RegionDetailDAO;
import com.hereo.project.dao.RegionSubDAO;
import com.hereo.project.vo.RegionDetailVO;
import com.hereo.project.vo.RegionSubVO;
import com.hereo.project.vo.RegionVO;

@Service
public class RegionServiceImp implements RegionService {

    @Autowired
    RegionDAO regionDao;
    @Autowired
    RegionSubDAO regionSubDao;
    @Autowired
    RegionDetailDAO regionDetailDao;
   
	@Override
	public List<RegionDetailVO> getRegionDetail(int rd_num) {
		return regionDetailDao.selectRegionDetail(rd_num);
	}
	@Override
	public List<RegionVO> getRegion() {
	    return regionDao.selectRegion();
	}

	@Override
	public RegionSubVO getRegionSub(RegionSubVO regionSub) {
		return regionSubDao.selectRegionSub(regionSub);
	}
	
	@Override
	public void insertRegion(RegionVO region) {
		if (region == null)
	        regionDao.insertRegion(region);
	}
	
	@Override
	public void insertRegionSub(RegionSubVO regionSub) {
	    RegionVO region = regionDao.getRegionByNum(regionSub.getRs_re_num());
	    if (region == null) {
	        // Region 테이블에 해당하는 re_num이 없는 경우, Region 테이블에 insert 한 후 RegionSub 테이블에 insert
	        region = new RegionVO();
	        region.setRe_num(regionSub.getRs_re_num());
	        regionDao.insertRegion(region);
	    }else {
	    	regionSubDao.insertRegionSub(regionSub);	    	
	    }
	}
	
	@Override
	public void insertRegionDetail(RegionDetailVO regionDetail) {
//		RegionSubVO regionSub = regionSubDao.getRegionSubByNum(regionDetail.getRd_rs_num());
//		if(regionSub == null) {
//			regionSub = new RegionSubVO();
//			regionSub.setRs_num(regionDetail.getRd_rs_num());
//			regionSubDao.insertRegionSub(regionSub);
//		}else {
			regionDetailDao.insertRegionDetail(regionDetail);				
//		}
	}

	@Override
	public List<RegionSubVO> getRegionSubList(int re_num) {
		return regionSubDao.getRegionSubList(re_num);
	}

	


}
