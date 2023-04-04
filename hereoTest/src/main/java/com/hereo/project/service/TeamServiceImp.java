package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hereo.project.dao.TeamDAO;
import com.hereo.project.dao.TeamPlayerDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.utils.UploadFileUtils;
import com.hereo.project.vo.TeamApprovalListVO;
import com.hereo.project.vo.TeamVO;

@Service
public class TeamServiceImp implements TeamService{
	@Autowired
	TeamDAO teamDao;
	@Autowired
	TeamPlayerDAO teamPlayerDao;

	String uploadPath = "D:\\uploadfiles";

	@Override
	public ArrayList<TeamVO> selectTeamsByCriAndState(Criteria cri, String state) {
		return teamDao.selectTeamsByCriAndState(cri, state);
	}
	
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
	public int countTeams(String state, Criteria cri) {
		return teamDao.countAllTeams(state, cri);
	}


	@Override
	public int insertTeam(TeamVO team, MultipartFile imgFile) {
		if(team==null||team.getTm_name()==null||team.getTm_name().trim().equals("")||
				team.getTm_slogan()==null)
			return 0;
//			team.tm_me_id는 지금 시점에서 구현이 애매해서 뺌
		String tmpImgPath = "";
		if(imgFile!=null&&imgFile.getOriginalFilename().length()!=0) {
			try {
				 tmpImgPath = UploadFileUtils.uploadFile(uploadPath, imgFile.getOriginalFilename(), imgFile.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
//		임시 팀장 아이디
		team.setTm_me_id("asd123");
		team.setTm_team_img(tmpImgPath);
		int teamNum = teamDao.insertTeam(team);
		if(teamNum!=0) {
			teamDao.insertTeamAppList(team);
		}
		return team.getTm_num();
	}

	@Override
	public TeamApprovalListVO selectTeamAppListByTeam(TeamVO tmpTeam) {
		if(tmpTeam==null)
			return null;
		return teamDao.selectTeamAppListByTeam(tmpTeam);
	}

	@Override
	public boolean updateTeamAppListState(Integer teamNum, int i) {
		if(teamNum==null||teamNum<0)
			return false;
		
		return teamDao.updateTeamAppListState(teamNum, i) !=0;
	
	}

	@Override
	public void deleteTeamAppListState(Integer teamNum, Integer teamState) {
		if(teamNum==null||teamNum<0)
			return ;
		if(teamState==null||teamState<0)
			return ;
		if(teamState==3) {
			teamDao.deleteTeamAppList(teamNum);
			teamDao.updateTeamState(teamNum, "활동중");
		}else if(teamState==2) {
			teamDao.deleteTeamAppList(teamNum);
			teamDao.updateTeamState(teamNum, "승인불가");
		}
		
	}

	@Override
	public boolean selectTeamByName(String tm_name) {
		if(tm_name==null||tm_name.trim().equals(""))
			return false;
		ArrayList<TeamVO> tmpList = teamDao.selectTeamByName(tm_name);
		if(tmpList==null||tmpList.size()==0)
			return true;
		return false;
		
	}

	@Override
	public int countTeamMember(Integer teamNum) {
		if(teamNum==null)
			return 0;
		return teamPlayerDao.countTeamMember(teamNum, 3, new Criteria());
	}
	
}
