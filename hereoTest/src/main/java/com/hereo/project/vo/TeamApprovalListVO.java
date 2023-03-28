package com.hereo.project.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TeamApprovalListVO {
	private int ta_tm_num;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date ta_register_date;
	private int ta_state;
//	private int ta_bo_num;
	private TeamVO team;
	
	
	
}
