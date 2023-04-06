package com.hereo.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TeamVO {
	private int tm_num; 
	private String tm_name;
	private Date tm_startday;
	private String tm_slogan;
	private int tm_re_num;
	private boolean tm_openformatch;
	private int tm_teamgender;
	private String tm_me_id;
	private String tm_teamstate;
	private String tm_team_img;
	private int tm_teamCnt;
	
	public void setTm_startday(String dateStr) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			this.tm_startday = format.parse(dateStr);
		} catch (ParseException e) {
			tm_startday = null;
		} 
	}
	
	public String getTm_startday_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(tm_startday);
	}
	
	
}
