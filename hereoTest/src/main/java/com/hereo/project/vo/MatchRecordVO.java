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
	private int mr_startTeam;
	
	private ArrayList<MatchInningVO> inningList = new ArrayList<>();
}
