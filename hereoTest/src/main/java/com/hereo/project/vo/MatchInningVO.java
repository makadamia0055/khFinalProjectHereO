package com.hereo.project.vo;

import java.util.ArrayList;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MatchInningVO {
	private int mi_num;
	private int mi_inning;
	private int mi_isFirstLast;
	private int mi_point;
	private int mi_mr_num;
	
	private ArrayList<MatchBatterBoxEventVO> batterBoxList  = new ArrayList<>();
}
