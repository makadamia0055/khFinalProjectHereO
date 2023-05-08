package com.hereo.project.vo;

import java.util.ArrayList;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MatchInningVO implements Comparable<MatchInningVO>{
	private int mi_num;
	private int mi_inning;
	private boolean mi_isFirstLast;
	private int mi_point;
	private int mi_mr_num;
	
	private ArrayList<MatchBatterBoxEventVO> batterBoxList  = new ArrayList<>();

	@Override
	public int compareTo(MatchInningVO o) {
		if(this.mi_inning==o.mi_inning) {
			if(this.mi_isFirstLast!=o.mi_isFirstLast) {
				if(this.mi_isFirstLast) {
					return -1;
				}else {
					return 1;
				}
				
			}else {
				return 0;
			}
		}else {
			return this.mi_inning-o.mi_inning;
		}
		
	}
}
