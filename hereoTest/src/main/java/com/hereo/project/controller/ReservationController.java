package com.hereo.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.service.ReservationService;


@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	//예약 메인 페이지
	@RequestMapping(value = "/reservation/main", method = RequestMethod.GET)
	public ModelAndView reservationMainPage(ModelAndView mv) {
		mv.setViewName("/reservation/reservation-main");
		return mv;
	}
	//
	@RequestMapping(value = "/reservation/stadium-insert", method = RequestMethod.GET)
	public ModelAndView reservationStadiumInsert(ModelAndView mv) {
		mv.setViewName("/reservation/reservation-stadium_insert");
		return mv;
	}
//	@RequestMapping(value = "/reservation/stadium-insert", method=RequestMethod.POST)
//	public ModelAndView reservationStadiumInsertPost(ModelAndView mv,
//			BoardVO board, 
//			HttpSession session, MultipartFile []files) {
//		//세션에 있는 회원 정보 가져옴. 작성자에 넣어주려고
//		MemberVO user = (MemberVO)session.getAttribute("user");
//		//게시글 정보와 회원 정보를 이용하여 게시글 등록하라고 시킴
//		boardService.insertBoard(board, user, files);
//		mv.setViewName("redirect:/board/list");
//		return mv;
//	}
	@RequestMapping(value = "/reservation/stadium-list", method = RequestMethod.GET)
	public ModelAndView reservationStadiumList(ModelAndView mv) {
		mv.setViewName("/reservation/reservation-stadium_list");
		return mv;
	}
	
	@RequestMapping(value = "/reservation/stadium-info", method = RequestMethod.GET)
	public ModelAndView stadiumInfo(ModelAndView mv) {
		mv.setViewName("/reservation/reservation-stadium_info");
		return mv;
	}
	@RequestMapping(value = "/reservation/stadium-detail", method = RequestMethod.GET)
	public ModelAndView stadiumDetail(ModelAndView mv) {
		mv.setViewName("/reservation/reservation-stadium_detail");
		return mv;
	}
	@RequestMapping(value = "/reservation/reservation-stadium", method = RequestMethod.GET)
	public ModelAndView stadiumReserve(ModelAndView mv) {
		mv.setViewName("/reservation/reservation-stadium");
		return mv;
	}
	
}
	
