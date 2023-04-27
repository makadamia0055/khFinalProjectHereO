package com.hereo.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hereo.project.dao.TeamDAO;
import com.hereo.project.dao.TeamPlayerDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.utils.UploadFileUtils;
import com.hereo.project.vo.MatchScheduleVO;
import com.hereo.project.vo.TeamApprovalListVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;
import com.hereo.project.vo.TeamWTJoinVO;

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
	//메인 페이지 new팀 불러오기
	@Override
	public ArrayList<TeamVO> getNewTeam() {
		
		return teamDao.getNewTeam();
	}


	@Override
	public int insertTeam(TeamVO team, MultipartFile imgFile) {
		if(team==null||team.getTm_name()==null||team.getTm_name().trim().equals("")
				)
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

	@Override
	public boolean insertTeamWTJ(TeamPlayerVO tmp) {
		if(tmp==null)
			return false;
		return teamDao.insertTeamWTJList(tmp)!=0;
	}

	@Override
	public ArrayList<TeamWTJoinVO> selectWTJByTeam(int teamNum, String tj_state) {
		return teamDao.selectWTJByTeam(teamNum, tj_state);
	}

	@Override
	public TeamWTJoinVO selectWTJByTjNum(int tjNum) {
		return teamDao.selectWTJByTjNum(tjNum);
	}

	@Override
	public int countWholeWTJ(int teamNum, String tj_state) {
		return teamDao.countWholeWTJ(teamNum, tj_state);
	}

	@Override
	public boolean updateTeamWTJList(int tj_num, String tj_state) {
		boolean res = teamDao.updateTeamWTJList(tj_num, tj_state)!=0;
		if(res) {
			TeamWTJoinVO tmp = teamDao.selectWTJByTjNum(tj_num);
			TeamPlayerVO tmpPlayer = teamPlayerDao.selectTeamPlayerByTeamAndPlayer(tmp.getTj_tm_num(),tmp.getTj_pl_num());
			if(tj_state.equals("승인")) {
				tmpPlayer.setTp_auth(3);
			}else if(tj_state.equals("거절")) {
				tmpPlayer.setTp_auth(0);
			}
			teamPlayerDao.updateTeamPlayer(tmpPlayer);

		}
		
		
		return res;
	}
	@Override
	public ArrayList<TeamVO> selectTeamByPlNumAndAuth(int pl_num, int auth) {
		
		return teamPlayerDao.selectTeamByPlNumAndAuth(pl_num, auth);
	}
	@Override
	public TeamVO selectJoinedTeamByPlNum(int pl_num) {
		
		ArrayList<TeamVO> list = teamPlayerDao.selectTeamByPlNumAndAuth(pl_num, 3);
		
		if(list ==null||list.size()==0) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public boolean updateTeam(TeamVO team, Boolean currentLogoDelete, MultipartFile imgFile) {
		if(team==null)
			return false;
		if(currentLogoDelete&&!team.getTm_team_img().contains("디폴트이미지")) {
			UploadFileUtils.removeFile(uploadPath, team.getTm_team_img());
		}
		
		String tmpImgPath = "";
		if(imgFile!=null&&imgFile.getOriginalFilename().length()!=0) {
			try {
				 tmpImgPath = UploadFileUtils.uploadFile(uploadPath, imgFile.getOriginalFilename(), imgFile.getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		team.setTm_team_img(tmpImgPath);
		return teamDao.updateTeam(team)!= 0;
	}

	@Override
	public boolean checkIsLeader(Integer teamNum, String bo_me_id) {
		if(teamNum == null || bo_me_id == null)
			return false;
		TeamVO team = selectTeamByTm_Num(teamNum);
		if(team.getTm_me_id().equals(bo_me_id)) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public int countTeamTotalMatch(Integer teamNum) {
		if(teamNum==null||teamNum==0)
			return -1;
		return teamDao.countTeamTotalMatch(teamNum);
	}
	
	
}
