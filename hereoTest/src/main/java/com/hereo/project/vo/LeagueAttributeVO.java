package com.hereo.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LeagueAttributeVO {
	private int la_num;
	private String la_name;
	private String la_match_type;
	private Date la_start_date;
	private int la_whole_period;
	private String la_team_state;
	private int la_lg_num;
	
	public String getLa_start_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		if(la_start_date == null) {
			return "";
		}
		return format.format(la_start_date);	
	}
}
