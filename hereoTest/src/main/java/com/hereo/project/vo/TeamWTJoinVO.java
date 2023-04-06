package com.hereo.project.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TeamWTJoinVO {
	private int tj_num;
	private int tj_tm_num;
	private int tj_pl_num;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date tj_register_date;
	private String tj_state;
	private int tj_bo_num;
	private PlayerVO tj_player;
}
