package com.hereo.project.vo;



import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PlayerRecordHitterVO {
	private int ph_num;
	private int ph_tp_num;
	private int ph_mr_num;
	private int ph_single_hits;
	private int ph_twobase_hits;
	private int ph_threebase_hits;
	private int ph_homeruns;
	private int ph_errors;
	private int ph_steals;
	private int ph_fail_steals;
	private int ph_fourballs;
	private int ph_strike_outs;
	private int ph_hits;
	private int ph_bats;
	private int ph_doubleplays;
	private int ph_hitbypitches;

	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date ms_datetime;
	
	public String getMs_datetime_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(ms_datetime);
	}
}
