package com.hereo.project.controller;


import java.text.SimpleDateFormat;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.dao.RegionDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.service.PlayerService;
import com.hereo.project.service.ReservationService;
import com.hereo.project.service.StadiumService;
import com.hereo.project.service.TeamService;
import com.hereo.project.utils.MessageUtils;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.RegionVO;
import com.hereo.project.vo.ReservationVO;
import com.hereo.project.vo.StadiumScheduleVO;
import com.hereo.project.vo.StadiumTimetableVO;
import com.hereo.project.vo.StadiumVO;
import com.hereo.project.vo.TeamVO;

import kr.co.bootpay.Bootpay;
import kr.co.bootpay.model.request.Cancel;


@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	@Autowired
	TeamService teamService;
	@Autowired
	StadiumService stadiumService;
	
	@Autowired
	PlayerService playerService;
	@Autowired
	RegionDAO regionDao;
	//예약 메인 페이지
	@GetMapping(value = {"/reservation/main","/reservation"})
	public ModelAndView reservationMainPage(ModelAndView mv, String game_date, Integer region, Criteria cri) {
		
		ArrayList<StadiumVO> stadiumList = new ArrayList<StadiumVO>();
		RegionVO regi = null;
		
		int totalCount;

		//지역 출력용
		if(game_date==null) {
			LocalDate now = LocalDate.now();
			String nowStr=now.toString();
			game_date=nowStr;
		}
		if(region==null || region==0) {
			if(cri==null) 
				cri = new Criteria();
			stadiumList = reservationService.getStadiumList01(cri);
			totalCount = reservationService.countStadiumList();

		}else {
			stadiumList = reservationService.getStadiumList02(region, cri);
			regi = regionDao.getRegionByNum(region);
			totalCount = reservationService.countStadiumList(region);
		}
		if(game_date==null||game_date.trim().length()==0) {
			SimpleDateFormat format = new SimpleDateFormat("YY-MM-dd"); 
			Date today = new Date();
			game_date = format.format(today);
			
		}
			
			
		

		PageMaker pm = new PageMaker(totalCount, 5, cri);
		RegionVO[]regionList = regionDao.selectAllRegion();

		mv.addObject("pm", pm);
		mv.addObject("regi", regi);
		mv.addObject("game_date", game_date);
		mv.addObject("stadiumList", stadiumList);
		mv.addObject("region", region==null?0 : region);
		mv.addObject("regionList", regionList);
		mv.setViewName("/reservation/reservation-main");
		return mv;
	}
	//임시로 만들어 놓은 스타디움 인포 메서드
	@GetMapping(value={"/reservation/stadium-info"})
	public ModelAndView reserveInfo(ModelAndView mv, int stadium, String game_date) {
		if(stadium==0) {
			mv.addObject("msg", "구장 정보가 없습니다.");
			mv.addObject("url", "/reservation/main");
			mv.setViewName("/common/message");
			return mv;
		}
		if(game_date==null||game_date.trim().length()==0) {
			mv.addObject("msg", "날짜 정보가 없습니다.");
			mv.addObject("url", "/reservation/main");
			mv.setViewName("/common/message");
			return mv;
			
		}
		
		StadiumVO sd = stadiumService.selectStadiumByStnum(stadium);
		ArrayList<StadiumTimetableVO> stList= reservationService.getStadiumTimetable(stadium);
		mv.addObject("sd", sd);
		mv.addObject("sdTimeTable", stList);
		mv.addObject("game_date", game_date);
		mv.setViewName("/reservation/reservation-stadium_info");
		return mv;
	}
	//임시로 만들어 놓은 결제 정보창
	@GetMapping(value= {"/reservation/payment_info"})
	public String reservePayment_info(Model model, @RequestParam("st_num") int st_num, HttpSession session, String date,
			HttpServletResponse response) {
		MembersVO user=(MembersVO)session.getAttribute("loginUser");
		StadiumTimetableVO st=reservationService.getStadiumTimetableForPay(st_num);
		ArrayList<TeamVO> teamList = teamService.getAllTeamList();
		if (user==null) {
			MessageUtils.alertAndGoPage(response, "로그인 기능이 필요한 서비스입니다.", "/hereoTest", "/reservation/main");
		}
		Integer userTeam = teamService.searchUserTeam(user.getMe_id());
		System.out.println(userTeam);
		if(userTeam==null) {
			MessageUtils.alertAndGoPage(response, "팀 소속 선수만 예약을 할 수 있습니다.", "/hereoTest", "/reservation/main");
		}
		model.addAttribute("date", date);
		model.addAttribute("teamList", teamList);
		model.addAttribute("st", st);
		model.addAttribute("user", user);
		return "/reservation/reservation-stadium";
	}
	//임시로 만들어 놓은 결제창 메서드
	@ResponseBody
	@PostMapping(value= {"/reservation/payment_info"})
	public Map<String,Object> reservePayment(HttpSession session, int st_num, Model model, String date,
			HttpServletResponse response, ReservationVO reservation) {
		
		MembersVO user=(MembersVO)session.getAttribute("loginUser");
		String msg="";
		String url="";
		String state="결제완료";
		ArrayList<StadiumScheduleVO> checkSch = reservationService.checkStadiumSchedule(st_num, date,state);
		System.out.println("체크"+checkSch);
		if(checkSch.isEmpty()) {
			reservationService.insertReservation(reservation, date, st_num);
		}else {
			msg="이미 예약이 완료된 게임입니다.";
			url="/reservation/main";
		}
		ReservationVO re = reservationService.selectReservation(reservation.getRv_num());
		HashMap<String,Object> map=new HashMap<String,Object >();
		map.put("reserve",re);
		map.put("user", user);
		map.put("msg", msg);
		map.put("url",url);
		return map;
	}
	//임시로 만들어 놓은 예약확인 
	@GetMapping(value={"/reservation/check"})
	public String reservationCheck(Model model, HttpSession session, Criteria cri) {
		MembersVO user = (MembersVO)session.getAttribute("loginUser");
		if(user==null) {
			return "redirect:/reservation/reservation-main";
		}
		ArrayList<StadiumScheduleVO> reserveList=reservationService.getReservationList(user.getMe_id(), cri);
		int totalCount = reservationService.countReserveCheck(user.getMe_id());
		PageMaker pm = new PageMaker(totalCount, 5, cri);

		System.out.println("리저브리스트"+reserveList);
		model.addAttribute("pm", pm);
		model.addAttribute("reserveList", reserveList);
		return "/reservation/reservation-check";
	}
	@ResponseBody
	@PostMapping(value= {"/reservation/bootPay"})
	public String bootPay(@RequestParam String receipt_id, @RequestParam int rv_num) {

		Bootpay bootpay = new Bootpay("6450af6d755e27001b375f4a", "vt/NZXiLbNOBadm8p2ONHo1ZO+DOfUbpMUC9rDoluQk=");
		try {
		   HashMap<String, Object> token = bootpay.getAccessToken();
		   if(token.get("error_code") != null) { //success
		       return "fail : Is Error";
		   }

		   String receiptId = receipt_id; 
		   HashMap res = bootpay.getReceipt(receiptId);
		  System.out.println("응답"+res);
		   if(res.get("error_code") == null) { //success
		        System.out.println("confirm success: " + res);
		        reservationService.updateSchedule(receipt_id);
		        reservationService.updateState(receipt_id,rv_num);
		        reservationService.insertMatchSchedule(rv_num);
		   } 
		   Integer order_id = (Integer)res.get("order_id");
		   if(order_id == null) {
			   return "fail : Null order_id ";
		   }
		  
		} catch (Exception e) {
		   e.printStackTrace();
		}
		return "/reservation/main";
	}
	//결제 중 취소 버튼을 누를경우에 db에 있는 reservation과 scheudule을 삭제하는 메서드
	@PostMapping(value= {"/reservation/cancelBootPay"})
	public String bootPay(@RequestBody ReservationVO reserve) {
		System.out.println(reserve);
		reservationService.deleteReservation(reserve.getRv_num());		
		return null;
	}
	//결제 완료 전 혹시 같은 스케쥴의 결제 완료가 다시 된 게 있는지 체크하는 메서드 (재고확인메서드)
	@PostMapping(value= {"/reservation/checkBootPay"})
	public boolean checkBootPay(@RequestBody ReservationVO reserve, @RequestParam boolean enable) {
		System.out.println("체크부트페이"+reserve);
		boolean isInventory = reservationService.checkInventory(reserve.getRv_num());
		
		if(isInventory==false) {
			enable = true;
		}else enable=false;
		
		return enable;
	}
	//결제취소 메서드
	@ResponseBody
	@PostMapping(value= {"/reservation/cancel"})
	public String cancelReservation(String receipt_id) {
		System.out.println(receipt_id);
		try {
		    Bootpay bootpay = new Bootpay("6450af6d755e27001b375f4a", "vt/NZXiLbNOBadm8p2ONHo1ZO+DOfUbpMUC9rDoluQk=");
		    HashMap token = bootpay.getAccessToken();
		    if(token.get("error_code") != null) { //failed
		        return null;
		    }
		    
		double rv_total_price=reservationService.getTotalPrice(receipt_id);
		    Cancel cancel = new Cancel();
		    cancel.receiptId = receipt_id;
		    cancel.cancelUsername = "관리자";
		    cancel.cancelMessage = "테스트 결제";
		    cancel.cancelPrice= rv_total_price;

		    HashMap res = bootpay.receiptCancel(cancel);
		    if(res.get("error_code") == null) { //success
		        System.out.println("receiptCancel success: " + res);
		        reservationService.updateState(receipt_id);

		    } else {
		        System.out.println("receiptCancel false: " + res);
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return "success";
	}
}