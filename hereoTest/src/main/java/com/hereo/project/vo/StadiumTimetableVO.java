package com.hereo.project.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StadiumTimetableVO {
	private int st_num;
	private int st_sd_num;
	private int st_start_time;
	private int st_use_time;
	private int st_rent_cost;
	private int st_daytype;
	
}
