package com.hereo.project.pagination;

import lombok.Data;

@Data
public class CommuCriteria extends Criteria {
	private String bo_region;
	private String bo_state;
	private String searchType;
	private String searchName;
	
	public CommuCriteria() {
		this.bo_region="";
		this.bo_state="";
		this.searchType="";
		this.searchName="";
	}
	public CommuCriteria (String bo_region, String bo_state) {
		this.bo_state = bo_state;
		this.bo_region=bo_region;
	
	}
}
