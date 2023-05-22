package com.hereo.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MatchScheduleVO {
	private int ms_num;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date ms_datetime;
	private String ms_match_sort;
	private int ms_tm_home_num;
	private int ms_tm_away_num;
	private int ms_rv_num;
//	기록 예정자 아이디
	private String ms_me_id;
//	구장 넣어두기
	private StadiumVO ms_stadium;
	
	private TeamVO homeTeam;
	private TeamVO awayTeam;
	
	public String getMs_datetime_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(ms_datetime);
	}
}
