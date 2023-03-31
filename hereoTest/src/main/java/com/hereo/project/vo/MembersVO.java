package com.hereo.project.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MembersVO {
	private String me_id;
	private String me_pw;
	private String me_name;
	private int me_gender;
	private String me_nickname;
	private String me_tel;
	private String me_mail;
	private int me_siteauth;
	private int me_ma_num;

}
