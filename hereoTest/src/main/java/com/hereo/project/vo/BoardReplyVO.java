package com.hereo.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardReplyVO {
	private int br_num;
	private int br_bo_num;
	private String br_me_id;
	private String br_contents;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date br_register_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date br_update_date;
	private int br_ori_num;
	private int br_groupOrd;
	private int br_groupLayer;
	private int br_toward_num;
	private String br_state;
	
	public String getBr_register_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(br_register_date);
	}
	public String getBr_register_date_str2() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String nowDate = format.format(date);
		
		String regDate =  format.format(br_register_date);
		if(nowDate.equals(regDate)) {
			format = new SimpleDateFormat("HH:mm:ss");
		}else {
			format = new SimpleDateFormat("yyyy-MM-dd");
		}
		return format.format(br_register_date);
	}
	
	public String getBr_update_date_str() {
		if(br_update_date==null)
			return null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(br_update_date);
	}
	public String getBr_update_date_str2() {
		if(br_update_date==null)
			return null;
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String nowDate = format.format(date);
		
		String regDate =  format.format(br_update_date);
		if(nowDate.equals(regDate)) {
			format = new SimpleDateFormat("HH:mm:ss");
		}else {
			format = new SimpleDateFormat("yyyy-MM-dd");
		}
		return format.format(br_update_date);
	}
}
