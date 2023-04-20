package com.hereo.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.pagination.Criteria;
import com.hereo.project.pagination.PageMaker;
import com.hereo.project.service.ReservationService;
import com.hereo.project.service.StadiumService;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.RegionDetailVO;
import com.hereo.project.vo.StadiumImageVO;
import com.hereo.project.vo.StadiumVO;


@Controller
public class StadiumController {
	@Autowired
	StadiumService stadiumService;

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
//	여기까진 됨 
	@RequestMapping(value = "/reservation/stadium/insert", method = RequestMethod.GET)
	public ModelAndView StadiumInsert(ModelAndView mv, HttpSession session) {
		MembersVO user = (MembersVO)session.getAttribute("loginUser");
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
	
