package com.hereo.project.vo;

import java.util.ArrayList;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PlayerVO {
	private int pl_num;
	private String pl_me_id;
	private String pl_hitting_hand;
	private String pl_pitching_hand;
	private String pl_ispro;
	private String pl_introduct;
	private String pl_player_img;
	private ArrayList<TeamPlayerVO> teamList;
	private ArrayList<Position_HopeVO> positionList;
//	닉네임 임시로 넣긴 했는데 계속 여기 넣어야하나 고민중
	private String me_nickname;
	
	public TeamPlayerVO getMainTeam() {
		for(TeamPlayerVO tmp : teamList) {
			if(tmp.getTp_auth()>=3) 
				return tmp;
		}
		return null;
	}
}
