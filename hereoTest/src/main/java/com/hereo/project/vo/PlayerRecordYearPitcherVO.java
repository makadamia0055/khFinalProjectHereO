package com.hereo.project.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PlayerRecordYearPitcherVO {
	private int yp_num;
	private int yp_tp_num;
	private int yp_year;
	private String yp_sort;
	private int yp_innings;
	private int yp_hits;
	private int yp_homeRuns;
	private int yp_hitters;
	private int yp_shutOuts;
	private int yp_completeGame;
	private int yp_saves;
	private int yp_holds;
	private int yp_fourBalls;
	private int yp_hitByPitches;
	private int yp_strikeOuts;
	private int yp_losePoints;
	private int yp_earnedRuns;
	private int yp_balks;
	private int yp_wildPitchs;
	private int yp_pitches;
}
