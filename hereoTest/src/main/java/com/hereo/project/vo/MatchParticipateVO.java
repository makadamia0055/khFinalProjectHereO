package com.hereo.project.vo;

import lombok.Data;

import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MatchParticipateVO {
	private int mp_num;
	private int mp_tp_num;
	private int mp_order;
	private String mp_type;
	private int mp_po_num;
	private int mp_inning;
}
