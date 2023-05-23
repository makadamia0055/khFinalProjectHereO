package com.hereo.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StadiumTimetableVO {
	private int st_num;
	private int st_sd_num;
	private Date st_start_time;
	private Date st_use_time;
	private int st_rent_cost;
	private int st_daytype;
	private int st_game_num;
	private StadiumVO s;
	
	public String getSt_start_time_str() {
		if(this.st_start_time==null)
			return null;
		SimpleDateFormat format = new SimpleDateFormat("HH:mm");
		return format.format(st_start_time);
	}
	public String getSt_use_time_str() {
		if(this.st_use_time==null)
			return null;
		SimpleDateFormat format = new SimpleDateFormat("HH:mm");
		return format.format(st_use_time);
	}
	
}
