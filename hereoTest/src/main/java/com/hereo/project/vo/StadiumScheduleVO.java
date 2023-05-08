package com.hereo.project.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StadiumScheduleVO {
	private int ss_num;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date ss_game_date;
	private int ss_st_num;
	private int ss_rv_num;
	private String ss_state;
}
