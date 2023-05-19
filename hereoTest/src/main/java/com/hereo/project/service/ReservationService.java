package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.ReservationVO;
import com.hereo.project.vo.StadiumScheduleVO;
import com.hereo.project.vo.StadiumTimetableVO;
import com.hereo.project.vo.StadiumVO;

public interface ReservationService {

	ArrayList<StadiumVO> getStadiumTimetable(int stadium);

	StadiumTimetableVO getStadiumTimetableForPay(int st_num);

	ArrayList<StadiumVO> getStadiumList(Integer region);

	ArrayList<StadiumScheduleVO> checkStadiumSchedule(int st_num, String date, String state);

	void insertReservation(ReservationVO reservation, String date, int st_num);

	ReservationVO selectReservation(int rv_num);

	void updateSchedule(String receipt_id);

	void deleteReservation(int rv_num);

	boolean checkInventory(int rv_num);

	void updateState(String receipt_id, int rv_num);

	ArrayList<StadiumScheduleVO> getReservationList(String me_id);

	double getTotalPrice(String receipt_id);

	void updateState(String receipt_id);





}
