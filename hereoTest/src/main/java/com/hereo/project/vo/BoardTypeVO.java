package com.hereo.project.vo;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardTypeVO {
	private int bt_num;
	private String bt_types;
	private int bt_r_auth;
	private int bt_w_auth;
	private int bt_tm_num;
	private int bt_lg_num;
	private int bt_hasbc;
}
