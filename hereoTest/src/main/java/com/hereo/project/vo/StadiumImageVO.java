package com.hereo.project.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StadiumImageVO {

	private int si_num;
	private int si_sd_num;
	private String si_filename;

	public StadiumImageVO(int si_num, int si_sd_num, String si_filename) {
		this.si_num = si_num;
		this.si_sd_num = si_sd_num;
		this.si_filename = si_filename;
	}
}
