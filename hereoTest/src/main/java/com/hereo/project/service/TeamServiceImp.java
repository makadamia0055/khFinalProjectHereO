package com.hereo.project.service;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hereo.project.dao.TeamDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.utils.UploadFileUtils;
import com.hereo.project.vo.TeamVO;

@Service
public class TeamServiceImp implements TeamService{
	@Autowired
	TeamDAO teamDao;

	String uploadPath = "D:\\uploadfiles";

	
	@Override
	public ArrayList<TeamVO> selectAllTeamsByCri(Criteria cri) {
		return teamDao.selectAllTeamsByCri(cri);
	}

	
	@Override
	public TeamVO selectTeamByTm_Num(Integer teamNum) {
		if(teamNum==null||teamNum<0)
			return null;
		return teamDao.selectTeamByTm_num(teamNum);
	}


	@Override
	public int countTeams() {
		return teamDao.countAllTeams();
	}


	@Override
	public boolean insertTeam(TeamVO team, MultipartFile imgFile) {
		if(team==null||team.getTm_name()==null||team.getTm_name().trim().equals("")||
				team.getTm_slogan()==null)
			return false;
//			team.tm_me_id는 지금 시점에서 구현이 애매해서 뺌
		String tmpImgPath = "";
		if(imgFile!=null) {
			try {
				 tmpImgPath = UploadFileUtils.uploadFile(uploadPath, imgFile.getOriginalFilename(), imgFile.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
//		임시 팀장 아이디
		team.setTm_me_id("asd123");
		team.setTm_team_img(tmpImgPath);
		boolean res = teamDao.insertTeam(team);
		
		return res;
	}
	
}
