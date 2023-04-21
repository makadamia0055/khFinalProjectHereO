package com.hereo.project.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVoteVO {
	private int bv_num;
	private int bv_bo_num;
	private String bv_me_id;
	private int bv_state;

}
