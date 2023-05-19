package com.hereo.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StadiumScheduleVO {
	private int ss_num;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ss_game_date;
	private int ss_st_num;
	private int ss_rv_num;
	private String ss_state;
	private String ss_receipt_id;
	private StadiumTimetableVO st;
	
	public String getSs_game_date() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(ss_game_date);
	}
	public Date getSs_game_date_toDate() {
		return ss_game_date;
	}
}
