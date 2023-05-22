package com.hereo.project.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class MatchBatterBoxEventVO implements Comparable<MatchBatterBoxEventVO>{
	private int mb_num;
	private int mb_inning_order;
	private int mb_be_num;
	private int mb_mi_num;
	private int mb_mp_hitter_num;
	private int mb_mp_pitcher_num;
	
	private String be_type;
	private int hitOrder;
	
	@Override
	public int compareTo(MatchBatterBoxEventVO o) {
		return this.mb_inning_order-o.mb_inning_order;
	}
}
