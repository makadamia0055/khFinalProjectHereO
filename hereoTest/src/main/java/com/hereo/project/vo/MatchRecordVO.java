package com.hereo.project.vo;

import java.util.ArrayList;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MatchRecordVO {
	private int mr_num;
	private int mr_ms_num;
	private int mr_point_home;
	private int mr_point_away;
//	홈팀이 스타트 팀인가?
	private boolean mr_startteam;
	private int endInning;
	
	private ArrayList<MatchInningVO> inningList = new ArrayList<>();
	private MatchScheduleVO matchSchedule;
	
	public void setInningList(ArrayList<MatchInningVO> list) {
		this.inningList = list;
		setEndInning();
	}
	
	public void setEndInning() {
		this.endInning = 0;
		for(MatchInningVO tmp : inningList) {
			if(tmp.getMi_inning()>endInning)
				endInning = tmp.getMi_inning();
		}
	}
	
}
