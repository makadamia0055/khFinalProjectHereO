package com.hereo.project.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.dao.RegionDAO;
import com.hereo.project.service.PlayerService;
import com.hereo.project.service.ReservationService;
import com.hereo.project.service.TeamService;
import com.hereo.project.utils.MessageUtils;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.RegionVO;
import com.hereo.project.vo.StadiumScheduleVO;
import com.hereo.project.vo.StadiumTimetableVO;
import com.hereo.project.vo.StadiumVO;
import com.hereo.project.vo.TeamVO;


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
		System.out.println("팀"+teamList);
		model.addAttribute("date", date);
		model.addAttribute("teamList", teamList);
		model.addAttribute("st", st);
		model.addAttribute("user", user);
		return "/reservation/reservation-stadium";
	}
	//임시로 만들어 놓은 결제창 메서드
	@PostMapping(value= {"/reservation/payment_info"})
	public String reservePayment(HttpSession session, int st_num, Model model) {
		MembersVO user=(MembersVO)session.getAttribute("loginUser");
		StadiumScheduleVO checkSch = reservationService.checkStadiumSchedule(st_num);
		StadiumTimetableVO st=reservationService.getStadiumTimetableForPay(st_num);
		model.addAttribute("st", st);
		model.addAttribute("user", user);
		return "/reservation/main";
	}

}
	
