package com.hereo.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
	private int bo_num;
	private String bo_title;
	private String bo_content;
	private int bo_view;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date bo_register_date;
	private int bo_reply_count;
	private int bo_up;
	private int bo_down;
	private int bo_bt_num;
	private String bo_me_id;
	private int bo_bc_num;
	private String bo_region;
	private String bo_state;

	public String getBo_register_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(bo_register_date);
	}
	public String getBo_register_date_str2() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String nowDate = format.format(date);
		
		String regDate =  format.format(bo_register_date);
		if(nowDate.equals(regDate)) {
			format = new SimpleDateFormat("HH:mm:ss");
		}else {
			format = new SimpleDateFormat("yyyy-MM-dd");
		}
		return format.format(bo_register_date);
	}
}
