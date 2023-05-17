package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hereo.project.dao.StadiumDAO;
import com.hereo.project.vo.ReservationVO;
import com.hereo.project.vo.StadiumScheduleVO;
import com.hereo.project.vo.StadiumTimetableVO;
import com.hereo.project.vo.StadiumVO;

@Service
public class ReservationServiceImp implements ReservationService{

	@Autowired
	StadiumDAO stadiumDao;
	

	@Override
	public ArrayList<StadiumVO> getStadiumTimetable(int stadium) {
		


		return stadiumDao.selectStadiumTimetable(stadium);
	}
	
	@Override
	public StadiumTimetableVO getStadiumTimetableForPay(int st_num) {
		
		return stadiumDao.getStadiumTimetableForPay(st_num);
	}
	
	@Override
	public ArrayList<StadiumVO> getStadiumList(Integer region) {
		

		return stadiumDao.selectStadiumList(region);
	}
	
	//스타디움 스케쥴에 예약된 항목이 있는지 우선 체크하는 메서드
	@Override
	public ArrayList<StadiumScheduleVO> checkStadiumSchedule(int st_num, String date, String state) {
		ArrayList<StadiumScheduleVO> check = stadiumDao.checkStadiumSchedule(st_num, date, state);
		return check;
	}
	//reservation 및 스타디움 스케쥴 insert하는 메서드
	@Override
	public void insertReservation(ReservationVO reservation, String date, int st_num) {
		stadiumDao.insertReservation(reservation);
		stadiumDao.insertStadiumSchedule(reservation.getRv_num(), date, st_num);
	}

	@Override
	public ReservationVO selectReservation(int rv_num) {
		
		return stadiumDao.selectReservation(rv_num);
	}

	//결제영수증 아이디 추가 및 결제 상태 변경 작업
	@Override
	public void updateSchedule(String receipt_id) {	
	}

	@Override
	public void deleteReservation(int rv_num) {
		
		stadiumDao.deleteReservation(rv_num);
	}

	@Override
	public boolean checkInventory(int rv_num) {
		StadiumScheduleVO s = stadiumDao.searchStadiumSchedule(rv_num);
		System.out.println("인벤체크"+s);
		String state = "결제완료";
		ArrayList<StadiumScheduleVO> list = stadiumDao.checkCompletePayList(s.getSs_game_date(), s.getSs_st_num(), state);
		if(list.isEmpty()) {
			return false;
		}else return true;
	}

	@Override
	public void updateState(String receipt_id, int rv_num) {
		String state="결제완료";
		stadiumDao.updateState(receipt_id, state, rv_num);
	}

	@Override
	public ArrayList<StadiumScheduleVO> getReservationList(String me_id) {
		
		String state = "결제완료";
		ArrayList<StadiumScheduleVO> list = stadiumDao.getReservationList(me_id,state);
		
		return list;
	}
}
