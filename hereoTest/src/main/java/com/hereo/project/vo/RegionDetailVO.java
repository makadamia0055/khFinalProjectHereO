package com.hereo.project.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RegionDetailVO {
	private int rd_num;
	private String rd_zipcode;
	private String rd_address;
	private String rd_detail_address;
	private int rd_rs_num;
}
