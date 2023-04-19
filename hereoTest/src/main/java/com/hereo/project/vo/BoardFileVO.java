package com.hereo.project.vo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardFileVO {
	private int bf_num;
	private String bf_filename;
	private String bf_ori_filename;
	private int bf_bo_num;
	private String fileType;
	
	public void setBf_filename(String bf_filename) {
		this.bf_filename = bf_filename;
		setFileType(bf_filename);
		
	}
	
	
//	파일 타입을 구해주는 메소드
	public void setFileType(String fileType) {
		String sourceStr = "D:\\uploadfiles" + fileType;
		Path source = Paths.get(sourceStr);
		try {
			String[] type = Files.probeContentType(source).split("/");
			
			this.fileType = type[0];
		} catch (IOException e) {
			e.printStackTrace();
		} 
			
		
		
	}
}
