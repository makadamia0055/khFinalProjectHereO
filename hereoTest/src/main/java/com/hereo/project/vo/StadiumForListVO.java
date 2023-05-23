package com.hereo.project.vo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class StadiumForListVO extends StadiumVO {

	ArrayList<StadiumTimetableVO> timeList;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date choiceDate;
	
	public String getChoiceDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(choiceDate);
	}
	public Date getChoiceDate_toDate() {
		return choiceDate;
	}
}
