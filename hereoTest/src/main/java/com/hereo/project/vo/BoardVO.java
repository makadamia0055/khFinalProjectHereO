package com.hereo.project.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
	private int bo_num;
	private String bo_title;
	private String bo_content;
	private int bo_view;
	private Date bo_register_date;
	private int bo_reply_count;
	private int bo_up;
	private int bo_down;
	private int bo_bt_num;
	private String bo_me_id;
	private int bo_bc_num;

}
