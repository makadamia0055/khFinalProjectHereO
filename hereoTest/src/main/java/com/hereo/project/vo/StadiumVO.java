package com.hereo.project.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StadiumVO {
	private int sd_num;
	private int sd_rd_num;
	private String sd_name;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date sd_register_date;
	private int sd_confirm;
	private String sd_contact;
	private String sd_me_id;
	private int sd_price;
	private String sd_intro;

}
