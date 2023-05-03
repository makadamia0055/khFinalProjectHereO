package com.hereo.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	public ModelAndView reservationMainPage(ModelAndView mv) {
		RegionVO[]regionList = regionDao.selectAllRegion();
		
		mv.addObject("regionList", regionList);
		mv.setViewName("/reservation/reservation-main");
		return mv;
	}
	//임시로 만들어 놓은 스타디움 인포 메서드
	@GetMapping(value={"/reservation/stadium-info"})
	public String reserveInfo(Model model) {
		int st_num = 1;
		ArrayList<StadiumVO> sd= reservationService.getStadiumTimetable(st_num);
		model.addAttribute("sd",sd);
		return "/reservation/reservation-stadium_info";
	}
	//임시로 만들어 놓은 결제 정보창
	@GetMapping(value= {"/reservation/payment_info"})
	public String reservePayment_info(Model model, @RequestParam("st_num") int st_num, HttpSession session) {
		MembersVO user=(MembersVO)session.getAttribute("loginUser");
		StadiumTimetableVO st=reservationService.getStadiumTimetableForPay(st_num);
		ArrayList<TeamVO> teamList = teamService.getAllTeamList();
		System.out.println("팀"+teamList);
		int tm_num = reservationService.getUserTeamNum(user.getMe_id());
		
		System.out.println("플레이어"+player);
		model.addAttribute("teamList", teamList);
		model.addAttribute("st", st);
		model.addAttribute("user", user);
		return "/reservation/reservation-stadium";
	}
	//임시로 만들어 놓은 결제창 메서드
	@GetMapping(value= {"/reservation/payment"})
	public String reservePayment(HttpSession session, @RequestParam("stadium") int st_num, Model model) {
		MembersVO user=(MembersVO)session.getAttribute("loginUser");
		StadiumTimetableVO st=reservationService.getStadiumTimetableForPay(st_num);
		model.addAttribute("st", st);
		model.addAttribute("user", user);
		return "/reservation/reservation-stadium_payment";
	}

}
	
