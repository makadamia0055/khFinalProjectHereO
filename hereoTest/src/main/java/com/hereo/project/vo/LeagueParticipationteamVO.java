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
	
	public LeagueParticipationteamVO(int lp_num, int lp_approval) {
		this.lp_num = lp_num;
		this.lp_approval = lp_approval;
	}
}
