package com.hereo.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LeagueVO {
	private int lg_num;
	private String lg_name;
	private String lg_introduce;
	private Date lg_start_date;
	private String lg_state;
	private int lg_approval;
	private String lg_logo;
	private int lg_re_num;
	private String lg_me_id;

	public String getLg_start_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		if(lg_start_date == null) {
			return "";
		}
		return format.format(lg_start_date);	
	}
}
