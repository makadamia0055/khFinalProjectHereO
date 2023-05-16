package com.hereo.project.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.dao.RegionDAO;
import com.hereo.project.service.PlayerService;
import com.hereo.project.service.ReservationService;
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


@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	@Autowired
	TeamService teamService;
	
	@Autowired
	PlayerService playerService;
	@Autowired
	RegionDAO regionDao;
	//예약 메인 페이지
	@RequestMapping(value = "/reservation/main", method = RequestMethod.GET)
	public ModelAndView reservationMainPage(ModelAndView mv, String game_date, Integer region) {
		
		//지역번호에 맞는 스타디움 가져오기
		ArrayList<StadiumVO> stadiumList = reservationService.getStadiumList(region);
		RegionVO[]regionList = regionDao.selectAllRegion();
		
		//지역 출력용
		if(region==null) {
			region = 1;
			} 
		RegionVO regi = regionDao.getRegionByNum(region);
		
		//날짜에 맞는 게임일정을 가져오는 거 아직 미구현
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
	public String reserveInfo(Model model, int stadium, String game_date) {

		ArrayList<StadiumVO> sd= reservationService.getStadiumTimetable(stadium);
		model.addAttribute("sd",sd);
		model.addAttribute("game_date",game_date);
		return "/reservation/reservation-stadium_info";
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
	public String reservationCheck(HttpSession session) {
		MembersVO user=(MembersVO)session.getAttribute("loginUser");
		
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
		   } 
		   Integer order_id = (Integer)res.get("order_id");
		   if(order_id == null) {
			   return "fail : Null order_id ";
		   }
		   //결제상태 변경해줌
		   reservationService.updateState(receipt_id,rv_num);
		} catch (Exception e) {
		   e.printStackTrace();
		}
		return null;
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
}
	
