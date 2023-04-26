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

	public BoardVoteVO(int bv_bo_num, String bv_me_id, int bv_state) {
		this.bv_bo_num=bv_bo_num;
		this.bv_me_id=bv_me_id;
		this.bv_state=bv_state;
	}
}
