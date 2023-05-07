package com.hereo.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PlayerRecordPitcherVO {
	private int pp_num;
	private int pp_tp_num;
	private int pp_mr_num;
	private int pp_innings;
	private int pp_hits;
	private int pp_homeRuns;
	private int pp_hitters;
	private int pp_shutOuts;
	private int pp_completeGame;
	private int pp_saves;
	private int pp_holds;
	private int pp_fourBalls;
	private int pp_hitByPitches;
	private int pp_strikeOuts;
	private int pp_losePoints;
	private int pp_earnedRuns;
	private int pp_balks;
	private int pp_wildPitchs;
	private int pp_pitches;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date ms_datetime;
	
	public String getMs_datatime_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(ms_datetime);
	}
}
