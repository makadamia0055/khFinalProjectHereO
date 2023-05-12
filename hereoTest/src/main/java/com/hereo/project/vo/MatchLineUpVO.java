package com.hereo.project.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MatchLineUpVO {
	private int ml_num;
	private int ml_ms_num;
	private int ml_battingorder;
	private String ml_type;
	private int ml_tp_num;
	private int ml_po_num;
//	팀 번호도 여기 넣는게 좋을듯?
	private int tp_tm_num;
}
