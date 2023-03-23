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
	
}
