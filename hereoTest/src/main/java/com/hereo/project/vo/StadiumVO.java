package com.hereo.project.vo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StadiumVO {
	private int sd_num;
	private int sd_rd_num;
	private String sd_name;
	private Date sd_register_date;
	private int sd_confirm;
	private String sd_contact;
	private String sd_me_id;
	private int sd_price;
	private String sd_intro;
	private String sd_sido;
	
	private ArrayList<StadiumImageVO> imgList;
	
	public StadiumVO(String sd_name, String sd_contact, String sd_intro) {
		this.sd_name = sd_name;
		this.sd_contact = sd_contact;
		this.sd_intro = sd_intro;
	}
	
	public String getSd_register_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(sd_register_date);
	}

	private RegionDetailVO regionDetail;
	
	
}
