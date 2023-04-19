
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
	private boolean bt_hasbc;
	
	
	public String getBt_namebyEnglish() {
		
		switch(bt_num) {
		case 1 :
			return "free";
		case 2 :
			return "eventAcid";
		case 3 :
			return "findHero";
		case 4 :
			return "market";
					
		}
		return "free";
	}
	
}
