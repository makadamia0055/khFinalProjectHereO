package com.hereo.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.dao.RegionDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.pagination.PageMaker;
import com.hereo.project.service.RegionService;
import com.hereo.project.service.StadiumService;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.RegionDetailVO;
import com.hereo.project.vo.RegionSubVO;
import com.hereo.project.vo.RegionVO;
import com.hereo.project.vo.StadiumImageVO;
import com.hereo.project.vo.StadiumTimetableVO;
import com.hereo.project.vo.StadiumVO;


	@Controller
	public class StadiumController {
		@Autowired
		StadiumService stadiumService;
		@Autowired
		RegionService regionService;
		@Autowired
		RegionDAO regionDao;
	
	//	구장 등록 리스트 
	@RequestMapping(value = "/reservation/stadium/list", method=RequestMethod.GET)
	public ModelAndView stadiumList(ModelAndView mv, Criteria cri) {
		ArrayList<StadiumVO> list = stadiumService.getStadiumList(cri);
		int totalCount = stadiumService.getStadiumTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 3, cri);
		mv.addObject("list",list);
		mv.addObject("pm", pm);
		mv.setViewName("/reservation/reservation-stadium_list");
	
		return mv;
	}
	@RequestMapping(value = "/reservation/stadium/info", method=RequestMethod.GET)
	public ModelAndView stadiumInfo(ModelAndView mv) {
		
		mv.setViewName("/reservation/reservation-stadium_info");
	
		return mv;
	}
	@RequestMapping(value = "/reservation/stadium/timetable", method=RequestMethod.GET)
	public ModelAndView stadiumTimetable(ModelAndView mv,HttpSession session) {
		MembersVO user = (MembersVO)session.getAttribute("user");
		ArrayList<StadiumTimetableVO> stList = stadiumService.getStadiumTimetableList(user);
		mv.addObject("stList", stList);
		mv.setViewName("/reservation/reservation-stadium_timetable");
	
		return mv;
	}
	//	구장 등록 정보
	@RequestMapping(value = "/reservation/stadium/detail/{sd_num}", method = RequestMethod.GET)
	public ModelAndView stadiumDetail(ModelAndView mv,@PathVariable("sd_num")int sd_num,HttpSession session) {
		MembersVO user = (MembersVO)session.getAttribute("user");
		StadiumVO stadium = stadiumService.getStadium(sd_num,user);
		ArrayList<StadiumImageVO> stadiumImg = stadiumService.getFileList(sd_num);
		
		mv.addObject("stadiumImg", stadiumImg);
		mv.addObject("stadium",stadium);	
		
		mv.setViewName("/reservation/reservation-stadium_detail");			
	
			return mv;
		}
		
	@RequestMapping(value="/address", method = RequestMethod.GET)
	public ModelAndView regionInsert(ModelAndView mv) {
	        mv.setViewName("/main/address");
	        return mv;
	  }
	  
	@RequestMapping(value = "/address", method = RequestMethod.POST)
	@ResponseBody
	public RegionDetailVO insertRegion(
			@RequestParam("sample6_postcode") String sample6_postcode,
			@RequestParam("sample6_address") String sample6_address,
			@RequestParam(required = true, name = "sample6_detailAddress") String sample6_detailAddress) {
		// 우편번호와 주소 정보로 지역 정보를 조회하고 저장
		RegionVO region = new RegionVO();
		RegionSubVO regionSub = new RegionSubVO();
		RegionDetailVO regionDetail = new RegionDetailVO();
		boolean hasRegionDetail = false;
		boolean hasRegion = false;
		boolean hasRegionSub = false;
		String si = null;
		String gu = null;		      
		String[] addressSplit = sample6_address.trim().split(" ");
		      
		   
		    // "시 구 동" 형식의 주소에서 "시"와 "구" 추출
		if (addressSplit.length >= 2) {
		    si = addressSplit[0];
		    gu = addressSplit[1];
		}
		 // "시" 값이 null이거나 비어있는 경우 예외 처리
		if (si == null || si.isEmpty()) {
		    throw new IllegalArgumentException("주소 정보가 올바르지 않습니다.");
		}
		 // 지역 정보 조회
		List<RegionVO> regionList = regionService.getRegion();
		for (RegionVO regionVO : regionList) {
		    if (regionVO.getRe_sido() != null && regionVO.getRe_sido().equals(si)) {
		        region = regionVO;
		        System.out.println("이미 존재하는 지역: " + region.getRe_sido() + " " + region.getRe_num());
		        hasRegion = true;
		        break;
		    }
		}
		// 지역 정보가 없으면 추가
		if (!hasRegion) {
		    System.out.println("새로운 지역 추가: " + si);
		    region = new RegionVO();
		    region.setRe_sido(si);
		    regionService.insertRegion(region);
		}
		 //구,군 정보 조회
		List<RegionSubVO> regionSubList = regionService.getRegionSubList(region.getRe_num());
		for (RegionSubVO subVO : regionSubList) {
		    if (subVO.getRs_gu().equals(gu)) {
		        regionSub = subVO;
		        System.out.println("이미 존재하는 구,군 정보: " + regionSub.getRs_gu() + " (" + regionSub.getRs_num() + ")");
		        hasRegionSub = true;
		        break;
		    }
		}
		 // 구,군 정보가 없으면 추가
		if (!hasRegionSub) {
		 System.out.println("새로운 구,군 정보 추가: " + gu);
		 regionSub = new RegionSubVO();
		 regionSub.setRs_gu(gu);
		    regionSub.setRs_re_num(region.getRe_num());
		    regionService.insertRegionSub(regionSub);
		}
		// 지역 상세 정보와 사용자 입력 상세 주소 정보를 저장
		List<RegionDetailVO> regionDetailList = regionService.getRegionDetail(regionDetail.getRd_num());		      
		for (RegionDetailVO DetailVO : regionDetailList) {
		 if(DetailVO.getRd_zipcode() != null && DetailVO.getRd_address() != null && DetailVO.getRd_detail_address() !=null) {
		 regionDetail  = DetailVO;
		 System.out.println("이미 추가된 주소입니다." + regionDetail.getRd_zipcode() + " " + regionDetail.getRd_address() + " " +regionDetail.getRd_detail_address());
		 hasRegionDetail = true;
		 break;
		 }		          
		}
		  
		if(!hasRegionDetail) {
		 System.out.println("우편번호 : "+sample6_postcode +" "+"새로운 주소 추가 : "+ sample6_address + sample6_detailAddress);
		  	  regionDetail = new RegionDetailVO();
		  	  regionDetail.setRd_zipcode(sample6_postcode);
		  	  regionDetail.setRd_address(sample6_address);
		  	  regionDetail.setRd_detail_address(sample6_detailAddress);
		  	  regionDetail.setRd_rs_num(regionSub.getRs_num());
		  	  regionService.insertRegionDetail(regionDetail);
		    }
		    return regionDetail;
	}
		//	여기까진 됨 
	@RequestMapping(value = "/reservation/stadium/insert", method = RequestMethod.GET)
	public ModelAndView StadiumInsert(ModelAndView mv, HttpSession session) {
		MembersVO user = (MembersVO)session.getAttribute("loginUser");
		if(user==null) {
			mv.addObject("msg", "로그인된 유저만 구장을 등록할 수 있습니다.");
			mv.addObject("url", "/reservation/main");
			mv.setViewName("/common/message");
			return mv;
		}
		
		mv.setViewName("/reservation/reservation-stadium_insert");
		return mv;
	}
	
	@RequestMapping(value = "/reservation/stadium/insert", method = RequestMethod.POST)
	public ModelAndView StadiumInsertPost(ModelAndView mv, HttpSession session,
	        StadiumVO stadium, RegionDetailVO regionDetail,
	        @RequestParam("file") MultipartFile[] files) {
	    MembersVO user = (MembersVO)session.getAttribute("loginUser");
	    stadium.setRegionDetail(regionDetail); 
	    stadiumService.insertStadium(stadium, user, files);
	
	    mv.setViewName("redirect:/reservation/stadium/list");
	    return mv;
	}

}
	
