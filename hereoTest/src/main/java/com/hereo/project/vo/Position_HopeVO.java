package com.hereo.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Position_HopeVO {
	private int ph_num;
	private int ph_pl_num;
	private int ph_po_num;
	private String ph_po_ko_name;
	
	public void setPh_po_num(int ph_po_num) {
		this.ph_po_num = ph_po_num;
		setPh_po_ko_name();
	}
	
	public void setPh_po_ko_name() {
		this.ph_po_ko_name = Position.getPositionName(ph_po_num);
		
	}
	


	@Getter
	public enum Position{
//		포지션네임(포지션 넘버)
		catcher(1, "포수"),
		pitcher(2, "투수");
		
		private final int po_num;
		private final String po_ko_name;
		Position(int po_num, String po_ko_name){
			this.po_num = po_num;
			this.po_ko_name = po_ko_name;
		}
		
		private static Position[] list = Position.values();
		public static String getPositionName(int po_num) {
			Position tmp = list[(po_num - 1)];
			return tmp.getPo_ko_name();
		}
		
	}
}
