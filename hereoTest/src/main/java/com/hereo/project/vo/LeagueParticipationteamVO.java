package com.hereo.project.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LeagueParticipationteamVO {
	private int lp_num;
	private int lp_tm_num;
	private int lp_le_num;
	private int lp_approval;
	private TeamVO lp_team;
	private LeagueScheduleVO lp_leagueSchedule;
	
	public LeagueParticipationteamVO(int lp_tm_num, int lp_le_num) {
		this.lp_tm_num = lp_tm_num;
		this.lp_le_num = lp_le_num;
	}
	
	public LeagueParticipationteamVO(int lp_num, int lp_approval, int lp_tm_num) {
		this.lp_num = lp_num;
		this.lp_approval = lp_approval;
		this.lp_tm_num = lp_tm_num;
	}
	
	
}
