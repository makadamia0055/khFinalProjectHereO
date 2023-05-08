package com.hereo.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReservationVO {
	private int rv_num;
	private int rv_payment_amount;
	private String rv_me_id;
	private Date rv_date;
	private boolean rv_isReferee;
	private boolean rv_isRecoder;
	private int rv_total_price;
	private String rv_game_type;
	private int rv_home_num;
	private int rv_away_num;

	public String getSd_register_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(rv_date);
	}

	private RegionDetailVO regionDetail;
	
	
}
