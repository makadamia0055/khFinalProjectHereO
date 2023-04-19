package com.hereo.project.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardCategoryVO {
	private int bc_num;
	private String bc_name;
	private int bc_bt_num;
	private String bc_auth_sort;
	private int bc_w_auth;
	private int bc_r_auth;
}
