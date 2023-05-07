package com.hereo.project.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MatchBatterBoxEventVO {
	private int mb_num;
	private int mb_inning_order;
	private int mb_be_num;
	private int mb_mi_num;
	private int mb_mp_hitter_num;
	private int mb_mp_pitcher_num;
}
