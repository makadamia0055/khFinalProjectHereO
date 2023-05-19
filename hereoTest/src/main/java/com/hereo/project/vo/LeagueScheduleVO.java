package com.hereo.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LeagueScheduleVO {
	private int ls_num;
	private String ls_match_state;
	private Date ls_match_date;
	private int ls_point_a;
	private int ls_point_b;
	private int ls_lp_num_a;
	private int ls_lp_num_b;
	private int ls_la_num;
	private LeagueAttributeVO ls_leagueAtt;
	private TeamVO ls_team_a;
	private TeamVO ls_team_b;
	
	public String getLs_match_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("MM월dd일(E) HH:mm");
		if(ls_match_date == null) {
			return "";
		}
		return format.format(ls_match_date);	
	}
	public String getLs_match_date_str2() {
		SimpleDateFormat format = new SimpleDateFormat("MM월dd일(E)");
		if(ls_match_date == null) {
			return "";
		}
		return format.format(ls_match_date);	
	}
	public String getLs_match_date_str3	() {
		SimpleDateFormat format = new SimpleDateFormat("HH:mm");
		if(ls_match_date == null) {
			return "";
		}
		return format.format(ls_match_date);	
	}
}
