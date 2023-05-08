package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.StadiumTimetableVO;
import com.hereo.project.vo.StadiumVO;

public interface ReservationService {

	ArrayList<StadiumVO> getStadiumTimetable(int stadium);

	StadiumTimetableVO getStadiumTimetableForPay(int st_num);

	ArrayList<StadiumVO> getStadiumList(Integer region);





}
