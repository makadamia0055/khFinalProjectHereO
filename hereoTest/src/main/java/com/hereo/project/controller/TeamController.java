package com.hereo.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hereo.project.dao.RegionDAO;
import com.hereo.project.pagination.Criteria;
import com.hereo.project.pagination.PageMaker;
import com.hereo.project.service.AuthService;
import com.hereo.project.service.LineUpService;
import com.hereo.project.service.MembersService;
import com.hereo.project.service.PlayerService;
import com.hereo.project.service.RecordService;
import com.hereo.project.service.ScheduleService;
import com.hereo.project.service.TeamBoardService;
import com.hereo.project.service.TeamService;
import com.hereo.project.vo.BatterBoxEventVO;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardFileVO;
import com.hereo.project.vo.BoardReplyVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.BoardVoteVO;
import com.hereo.project.vo.MatchLineUpVO;
import com.hereo.project.vo.MatchParticipateVO;
import com.hereo.project.vo.MatchRecordVO;
import com.hereo.project.vo.MatchScheduleVO;
import com.hereo.project.vo.MembersVO;
import com.hereo.project.vo.PlayerRecordHitterVO;
import com.hereo.project.vo.PlayerRecordPitcherVO;
import com.hereo.project.vo.PlayerRecordYearHitterVO;
import com.hereo.project.vo.PlayerRecordYearPitcherVO;
import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.RegionVO;
import com.hereo.project.vo.TeamApprovalListVO;
import com.hereo.project.vo.TeamPlayerVO;
import com.hereo.project.vo.TeamVO;
import com.hereo.project.vo.TeamWTJoinVO;

@Controller
public class TeamController {
	@Autowired
	TeamService teamService;
	@Autowired
	MembersService membersService;
	@Autowired
	ScheduleService scheduleService;
	@Autowired
	TeamBoardService teamBoardService;
	@Autowired
	AuthService authService;
	@Autowired
	LineUpService lineUpService;
	@Autowired
	RecordService recordService;
	
	@Autowired
	PlayerService playerService;
	@Autowired
	RegionDAO regionDao;
	
//	팀 메인 페이지 
	@RequestMapping(value = "/team/main", method = RequestMethod.GET)
	public ModelAndView teamMainPage(ModelAndView mv, Criteria cri, HttpSession session) {
//		페이지 네이션 코드
		int totalCount = teamService.countTeams("활동중", cri);
		if(cri==null) {
			cri = new Criteria();
		}
		cri.setPerPageNum(10);
		PageMaker pm = new PageMaker(totalCount, 10, cri);
//		팀 리스트 
		ArrayList<TeamVO> teamList = teamService.selectTeamsByCriAndState(pm.getCri(), "활동중");
		for(TeamVO tmp : teamList) {
			tmp.setTm_teamCnt(teamService.countTeamMember(tmp.getTm_num()));
		}
//		지역 코드 보내기
		RegionVO[] regionArr = regionDao.selectAllRegion();
		
//		현재 조회 팀 정보 삭제
		session.removeAttribute("currentTeam");
		
		mv.addObject("region", regionArr);
		mv.addObject("teamList", teamList);
		mv.addObject("pm", pm);
		mv.setViewName("/team/team-main");
		return mv;
	}
//	팀 메인 페이지 ajax 팀 정보 받기
	@ResponseBody
	@RequestMapping(value="/team/main/teamInfo", method=RequestMethod.POST)
	public Map<String, Object>teamGetInfo(@RequestBody TeamVO tmp) {
		Map<String, Object> map = new HashMap<String, Object>();
//		팀장 선택 코드
		ArrayList<PlayerVO> playerList = playerService.selectPlayerByTm_Num(tmp.getTm_num(), 4);
//		팀장 없는 팀 (버그때문에 있을까봐) 처리 코드
		map.put("teamLeader", null);
		if(playerList!= null && playerList.size()>=1) {
			PlayerVO leader = playerList.get(0);
			map.put("teamLeader", leader);
			
		}
		int memberCnt = teamService.countTeamMember(tmp.getTm_num());
		map.put("memberCnt", memberCnt);

		return map;
		
		
	}
//	팀 메인페이지 팀 가입 백넘버 중복체크
	@ResponseBody
	@RequestMapping(value="/team/main/backNumDupCheck", method=RequestMethod.POST)
	public Map<String, Object>teamCheckBackNum(@RequestBody TeamPlayerVO tp) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res= playerService.checkBackNum(tp.getTp_tm_num(), tp.getTp_backnum());
		map.put("res", res);
		return map;
	}
//	팀 메인 페이지 팀 가입 요청
	@RequestMapping(value="/team/main/wtjoin", method=RequestMethod.POST)
	public ModelAndView teamMainWTJoin(ModelAndView mv, TeamPlayerVO tmp, HttpSession session) {
//		가입 선수 객체 만들기 (입력 들어온 객체 그대로 쓰되 매퍼에서 num리턴받기)
//		유저 객체 받기
		MembersVO user = (MembersVO)session.getAttribute("loginUser");
		if(isUserNull(user, mv)) {
			return mv;
		}
		
		PlayerVO player = playerService.selectPlayerByMeId(user.getMe_id());
		if(player == null) {
			mv.addObject("msg", "선수 정보가 없습니다. \n선수 정보를 입력 해주십시오.");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			return mv;
		}
//		가져온 player 객체의 num을 tmp에 넣어줌 
		tmp.setTp_pl_num(player.getPl_num());
		
//		이미 가입 되어 있는지 체크
		if(!playerService.hasNoTeam(tmp.getTp_pl_num())) {
			System.out.println("이미 팀이 있는 회원입니다.");
			mv.addObject("msg", "이미 팀이 있는 회원입니다");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			return mv;
		}
		
//		auth 1 = 가입 대기
		tmp.setTp_auth(1);
		boolean res1 = playerService.insertNewTeamPlayer(tmp);
		boolean res2 = false;
		if(res1) {
			 res2 = teamService.insertTeamWTJ(tmp);
		}
		mv.setViewName("redirect:/team/main");
		return mv;
	}	

//	팀 개별 페이지
	@RequestMapping(value = "/team/sep", method = RequestMethod.GET)
	public ModelAndView teamMainPage(ModelAndView mv, Integer teamNum, HttpSession session) {
		TeamVO tmpTeam = teamService.selectTeamByTm_Num(teamNum);
		int memberCnt = teamService.countTeamMember(teamNum);
//		팀장 선택 코드
		int auth = 4;
		ArrayList<PlayerVO> playerList = playerService.selectPlayerByTm_Num(teamNum, auth);
		if(playerList!= null && playerList.size()>=1) {
			PlayerVO leader = playerList.get(0);
			mv.addObject("teamLeader", leader);
			
		}
//		팀 스케쥴 보내기
		ArrayList<MatchScheduleVO> scheduleList = scheduleService.selectTeamScheduleByTeamAfterToday(teamNum);
		mv.addObject("scList", scheduleList);
		MatchScheduleVO nextMatch= scheduleService.selectNextTeamSchedule(teamNum);
		mv.addObject("nextMatch", nextMatch);
		
//		지역 코드 보내주기
		RegionVO[] regionArr = regionDao.selectAllRegion();
		
//		current팀 객체 보내주기
		session.setAttribute("currentTeam", tmpTeam);
		
		mv.addObject("region", regionArr);
		mv.addObject("memberCnt", memberCnt);
		mv.addObject("team", tmpTeam);
		mv.setViewName("/team/team-sep");
		return mv;
	}
//	팀 전체 선수 페이지
	@RequestMapping(value = "/team/wholeplayer", method = RequestMethod.GET)
	public ModelAndView teamWholePlayer(ModelAndView mv, Integer teamNum, Criteria cri) {
		ArrayList<PlayerVO> playerList = playerService.selectPlayerByTm_Num(teamNum);
//		일반 팀원 선택 및 카운팅
		int auth = 3;
		int totalCount = playerService.countTeamPlayers(teamNum, auth, cri);
		if(cri==null) {
			cri = new Criteria();
		}
		cri.setPerPageNum(10);
		PageMaker pm = new PageMaker(totalCount, 10, cri);
		mv.addObject("pm", pm);

		mv.addObject("playerList", playerList);
		mv.setViewName("/team/team-wholeplayer");
		return mv;
	}
//	선수 디테일 페이지(일단 이걸로 구현)
	@RequestMapping(value = "/team/pdetail", method = RequestMethod.GET)
	public ModelAndView teamPlayerDetail(ModelAndView mv, Integer player) {
		PlayerVO tmpPlayer = playerService.selectPlayerByPl_Num(player);
//		소속 팀 찾기
		ArrayList<TeamVO> teamList= teamService.selectTeamByPlNumAndAuth(tmpPlayer.getPl_num(), 3);
		if(teamList!=null && teamList.size()!=0) {
			TeamVO team = teamList.get(0);
			mv.addObject("team", team);
		}
		ArrayList<PlayerRecordHitterVO> pHList = playerService.selectPlayerRecordHitter(tmpPlayer.getPl_num());
		ArrayList<PlayerRecordPitcherVO> pPList = playerService.selectPlayerRecordPitcher(tmpPlayer.getPl_num());
		ArrayList<PlayerRecordYearHitterVO> yHList = playerService.selectPlayerRecordYearHitter(tmpPlayer.getPl_num());
		ArrayList<PlayerRecordYearPitcherVO> yPList = playerService.selectPlayerRecordYearPitcher(tmpPlayer.getPl_num());
		mv.addObject("pHList", pHList);
		mv.addObject("pPList", pPList);
		mv.addObject("yHList", yHList);
		mv.addObject("yPList", yPList);
		mv.addObject("player", tmpPlayer);
		mv.setViewName("/team/team-playerdetail");
		return mv;
	}
//	팀 신청 페이지
	@RequestMapping(value = "/team/create", method = RequestMethod.GET)
	public ModelAndView teamCreate(ModelAndView mv, HttpSession session) {
		MembersVO user = (MembersVO)session.getAttribute("user");
		if(user==null) {
		}

		mv.setViewName("/team/team-create");
		return mv;
	}
//	팀 신청 페이지 - POST 신청 받기
	@RequestMapping(value = "/team/create", method = RequestMethod.POST)
	public ModelAndView teamCreatePost(ModelAndView mv, TeamVO team, MultipartFile imgFile, HttpSession session, Integer tm_backnum) {
		MembersVO user = (MembersVO)session.getAttribute("user");
		mv.setViewName("/team/team-create");
		if(isUserNull(user, mv)) {
			return mv;
		}
		team.setTm_me_id(user.getMe_id());
		PlayerVO player = playerService.selectPlayerByMeId(user.getMe_id());
		if(playerService.hasNoTeam(player.getPl_num())) {
//			이미 가입된 팀이 있는 경우
			mv.addObject("msg", "가입된 팀이 있는 회원은 팀을 창설 할 수 없습니다.");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			return mv;
		}
		
		int teamNum = teamService.insertTeam(team, imgFile);
		
		if(teamNum!=0) {
//		팀장 등록
			int auth = 4;
			boolean res2 = playerService.insertPlayerToTeam(team, player, auth);
			if(res2) {
				boolean res3 = playerService.updateBackNum(team, player, tm_backnum);
				mv.setViewName("redirect:/team/main");
				}
		}
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/team/create_dupCheck", method = RequestMethod.POST)
	public Map<String, Object>teamCreateDuplicateCheck(@RequestBody TeamVO tmp) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = teamService.selectTeamByName(tmp.getTm_name());
		map.put("res", res);
		return map;
		
		
	}
//	팀 정보 수정 페이지
	@RequestMapping(value = "/team/modify", method = RequestMethod.GET)
	public ModelAndView teamModify(ModelAndView mv, HttpSession session) {
		TeamVO team = (TeamVO)session.getAttribute("userTeam");
		team = teamService.selectTeamByTm_Num(team.getTm_num());
		mv.addObject("team", team);

		mv.setViewName("/team/team-create_modify");
		return mv;
	}
//	팀 정보 수정 페이지POST

	@RequestMapping(value = "/team/modify", method = RequestMethod.POST)
	public ModelAndView teamModifyPOST(ModelAndView mv, TeamVO team, Boolean currentLogoDelete, MultipartFile imgFile) {
		if(currentLogoDelete==null) {
			currentLogoDelete= false;
		}
		boolean res = teamService.updateTeam(team, currentLogoDelete, imgFile);
		if(!res) {
			mv.addObject("msg", "팀 정보가 변경되지 않았습니다.");
			mv.addObject("url", "/team/modify");
			
		}else {
			mv.addObject("msg", "팀 정보가 변경 되었습니다.");
			mv.addObject("url", "/team/main");
		}

		mv.setViewName("/common/message");
		return mv;
	}
	
//	팀 정보 수정 페이지
	@RequestMapping(value = "/team/updatePl", method = RequestMethod.GET)
	public ModelAndView updatePl(ModelAndView mv, HttpSession session) {
		
		
		mv.setViewName("/team/team-updatePl");
		return mv;
	}
	
//	팀 정보 수정 페이지POST

	@RequestMapping(value = "/team/updatePl", method = RequestMethod.POST)
	public ModelAndView updatePlPOST(ModelAndView mv, HttpSession session, PlayerVO player, MultipartFile imgFile, String hopePositionStr) {
		System.out.println(hopePositionStr);
		boolean res = playerService.updatePlayer(player, imgFile);
		if(!res) {
			mv.addObject("msg", "플레이어 정보가 변경되지 않았습니다.");
			mv.addObject("url", "/team/updatePl");
			
		}else {
			mv.addObject("msg", "플레이어 정보가 변경 되었습니다.");
			mv.addObject("url", "/team/main");
			session.removeAttribute("userPlayer");

		}

		mv.setViewName("/common/message");
		return mv;
	}
	
//	팀 가입 페이지 -get
	@RequestMapping(value = "/team/join", method = RequestMethod.GET)
	public ModelAndView teamJoin(ModelAndView mv) {
		
		mv.setViewName("/team/team-join");
		return mv;
	}
//	팀 기록 페이지 -get
	@RequestMapping(value = "/team/record", method = RequestMethod.GET)
	public ModelAndView teamRecord(ModelAndView mv, Integer teamNum) {
		TeamVO tmpTeam = teamService.selectTeamByTm_Num(teamNum);
		HashMap<String, Object> totalMatch = teamService.countTeamTotalMatch(teamNum);
		ArrayList<MatchScheduleVO> msList = scheduleService.selectMatchScheduleByTmNum(teamNum);
		mv.addObject("msList", msList);
		mv.addObject("totalMatch", totalMatch);
		mv.addObject("team", tmpTeam);
		mv.setViewName("/team/team-record");
		return mv;
	}
//	팀 기록 페이지 해당 경기의 정보를 ajax로 가져오는 메서드
	@ResponseBody
	@RequestMapping(value="/team/ajax/record", method=RequestMethod.POST)
	public Map<String, Object>teamRecordAjax(@RequestBody MatchScheduleVO matchSchedule, Integer tm_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		MatchRecordVO matchRecord = recordService.selectMatchRecordByMsNum(matchSchedule.getMs_num());
		if(matchRecord !=null) {
			ArrayList<MatchParticipateVO> homeTeamPartInList = recordService.selectMatchPartInHome(matchRecord.getMr_num());
			ArrayList<MatchParticipateVO> awayTeamPartInList = recordService.selectMatchPartInAway(matchRecord.getMr_num());
			map.put("homePartInList", homeTeamPartInList);
			map.put("awayPartInList", awayTeamPartInList);
			map.put("matchRecord", matchRecord);
				
		}
		return map;
	}
	
//	팀 라인업 짜기 페이지
	@RequestMapping(value = "/team/lineup", method = RequestMethod.GET)
	public ModelAndView teamLineup(ModelAndView mv, Integer teamNum, Integer ms_num, HttpSession session) {
//		라인업 짜기 권한 체크 필요(팀장)
		MembersVO user = (MembersVO)session.getAttribute("loginUser");
		if(user== null) {
			mv.addObject("msg", "로그인된 팀 관리자만 이용할 수 있는 메뉴입니다.");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			return mv;
		}
		
		TeamVO team =  (TeamVO)session.getAttribute("userTeam");
		if(team== null) {
			mv.addObject("msg", "팀이 없는 회원입니다.");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			return mv;
		}
		teamNum = 1;
		if(teamNum != team.getTm_num()) {
			mv.addObject("msg", "해당 팀의 관리자만 이용할 수 있는 메뉴입니다.");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			return mv;
		}
			
//		권한 체크 필요
		
		if(!teamService.checkIsLeader(teamNum, user.getMe_id())) {
			mv.addObject("msg", "팀 관리자만 이용할 수 있는 메뉴입니다.");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			return mv;
		}
		
//		임시 팀번호 및 예약번호 세팅
		ms_num = 1;
		ArrayList<MatchLineUpVO> existLineUpList = lineUpService.selectLineUpByTmNumAndMsNum(teamNum, ms_num);
		
		
//		새로운 메서드 필요한 듯 용병이나 팀원 불러오는 메서드
//		모두 가져간 다음 미가입 팀원은 프론트 페이지에서 거르기로 했음
		ArrayList<TeamPlayerVO> tPlayerList = playerService.selectTPByTmNum(team.getTm_num());
		
//		기존의 플레이어도 보내주기로 함. 나중에 ajax로 읽어오나 미리 보내주나
		ArrayList<PlayerVO> playerList = playerService.selectPlayerByTm_Num(team.getTm_num());
		
		mv.addObject("team", team);
		mv.addObject("tPlayerList", tPlayerList);
		mv.addObject("playerList", playerList);
		mv.addObject("existLineUpList",existLineUpList);
		mv.setViewName("/team/team-lineup");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/ajax/lineup_save", method = RequestMethod.POST)
	public Map<String, Object> teamLineupSave(@RequestBody ArrayList<MatchLineUpVO> lineupList, Integer teamNum, Integer ms_num) {
		Map<String, Object> map = new HashMap<String, Object>();
//		0 실패 1 성공
//		임시로 넣어준 ms_num
		ms_num = 1;
		ArrayList<MatchLineUpVO> existLineUpList = lineUpService.selectLineUpByTmNumAndMsNum(teamNum, ms_num);
		if(existLineUpList!=null&&existLineUpList.size()>0) {
			lineUpService.deleteLineUpByTmNumAndMsNum(teamNum, ms_num);
		}

		int res = lineUpService.insertMatchLineUp(lineupList);
		map.put("res", res);
		return map;
	}
//	팀 가입 관리 페이지(팀의 가입 관리)
	@RequestMapping(value = "/team/wtjPage", method = RequestMethod.GET)
	public ModelAndView teamWTJPage(ModelAndView mv,Criteria cri, HttpSession session) {
		MembersVO user = (MembersVO)session.getAttribute("loginUser");
		if(user== null) {
			mv.addObject("msg", "로그인된 팀 관리자만 이용할 수 있는 메뉴입니다.");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			return mv;
		}
		
		TeamVO team =  (TeamVO)session.getAttribute("userTeam");
		if(team== null) {
			mv.addObject("msg", "팀이 없는 회원입니다.");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			return mv;
		}
		int teamNum = team.getTm_num();
//		권한 체크 필요
		
		if(!teamService.checkIsLeader(teamNum, user.getMe_id())) {
			mv.addObject("msg", "팀 관리자만 이용할 수 있는 메뉴입니다.");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			return mv;
		}
		
//		페이지네이션 코드
		int wtjCnt = teamService.countWholeWTJ(teamNum, "신청대기");
		if(cri==null) {
			cri = new Criteria();
		}
		cri.setPerPageNum(10);
		PageMaker pm = new PageMaker(wtjCnt, 10, cri);
		
		ArrayList<TeamWTJoinVO> list = teamService.selectWTJByTeam(teamNum, "신청대기");
		for(TeamWTJoinVO tmp : list) {
			PlayerVO tmpPlayer = playerService.selectPlayerByPl_Num(tmp.getTj_pl_num());
			tmp.setTj_player(tmpPlayer);
		}
		mv.addObject("pm", pm);
		mv.addObject("WTJList", list);
		mv.setViewName("/team/team_wtj");
		return mv;
	}
	//팀 가입 게시판 
	@RequestMapping(value = "/team/wtjBoard/{tj_num}", method = RequestMethod.GET)
	public ModelAndView teamWTJBoard(ModelAndView mv, @PathVariable("tj_num") int tjNum, HttpSession session) {
//		session.getAttribute("myTeam");
//		session.getAttribute("teamAuth");
		
		TeamWTJoinVO wtj = teamService.selectWTJByTjNum(tjNum);
		if(wtj!=null) {
			PlayerVO tmpPlayer = playerService.selectPlayerByPl_Num(wtj.getTj_pl_num());
			wtj.setTj_player(tmpPlayer);
		}
		MembersVO members = membersService.selectMembersByMeId(wtj.getTj_player().getPl_me_id());
		mv.addObject("members", members);
		mv.addObject("WTJ", wtj);
		mv.setViewName("/team/team_wtjBoard");
		return mv;
	}
	@RequestMapping(value = "/team/wtjBoard/*", method = RequestMethod.POST)
	public ModelAndView teamWTJBoardPost(ModelAndView mv, TeamWTJoinVO wtj, HttpServletRequest req) {
//		session.getAttribute("myTeam");
//		session.getAttribute("teamAuth");
		
		boolean res = teamService.updateTeamWTJList(wtj.getTj_num(), wtj.getTj_state());
		if(res) {
			mv.setViewName("redirect:/team/wtjPage");
		}else {
			mv.setViewName("redirect:"+req.getRequestURI());
		}
		return mv;
	}
	
	
	
	@RequestMapping(value = "/team/admin", method = RequestMethod.GET)
	public ModelAndView adminMain(ModelAndView mv) {
		mv.setViewName("/team/team_admin_main");
		return mv;
	}
	@RequestMapping(value = "/team/adteam_create", method = RequestMethod.GET)
	public ModelAndView adminTeamCreate(ModelAndView mv, Criteria cri) {
		if(cri==null) {
			cri = new Criteria();
		}
		int totalCount = teamService.countTeams("심사중", cri);
		cri.setPerPageNum(10);
		PageMaker pm = new PageMaker(totalCount, 10, cri);
		
		ArrayList<TeamVO> teamList = teamService.selectTeamsByCriAndState(cri, "심사중");
		ArrayList<TeamApprovalListVO> TAppList = new ArrayList<TeamApprovalListVO>();
		for(TeamVO tmpTeam: teamList) {
			TeamApprovalListVO tmpApp= teamService.selectTeamAppListByTeam(tmpTeam);
			if(tmpApp !=null) {
			tmpApp.setTeam(tmpTeam);
			TAppList.add(tmpApp);
			}
		}
		mv.addObject("pm", pm);
		mv.addObject("TAList", TAppList);
		mv.setViewName("/team/team_admin_teamcreate");
		return mv;
	}
//	현재 팀 관리 페이지
	@RequestMapping(value = "/team/adteam_manage", method = RequestMethod.GET)
	public ModelAndView adminTeamManage(ModelAndView mv, Criteria cri) {
		if(cri==null) {
			cri = new Criteria();
		}
		int totalCount = teamService.countTeams("활동중", cri);
		cri.setPerPageNum(10);
		PageMaker pm = new PageMaker(totalCount, 10, cri);
		
		ArrayList<TeamVO> teamList = teamService.selectTeamsByCriAndState(cri, "활동중");
		
		mv.addObject("pm", pm);
		mv.addObject("teamList", teamList);
		mv.setViewName("/team/team_admin_currentteammanage");
		return mv;
	}
	
//	관리자 보드 팀 신청 관리 보드 GET
	@RequestMapping(value = "/team/adteam_createBoard", method = RequestMethod.GET)
	public ModelAndView adminTeamCreateBoard(ModelAndView mv, Integer teamNum) {
		TeamVO tmpTeam = teamService.selectTeamByTm_Num(teamNum);
		TeamApprovalListVO tmpApp= teamService.selectTeamAppListByTeam(tmpTeam);
		if(tmpApp !=null) {
			tmpApp.setTeam(tmpTeam);
		}
		if(tmpApp.getTa_state()==0) {
			boolean res = teamService.updateTeamAppListState(teamNum, 1);
			
		}
		mv.addObject("TAL", tmpApp);
		mv.setViewName("/team/team_admin_teamcreateboard");
		return mv;
	}
	
//	관리자 보드 팀 신청 관리 보드 POST
	@RequestMapping(value = "/team/adteam_createBoard", method = RequestMethod.POST)
	public ModelAndView adminTeamCreateBoardPost(ModelAndView mv, Integer teamNum, Integer teamState) {
		boolean res = teamService.updateTeamAppListState(teamNum, teamState);
		if(res) {
			teamService.deleteTeamAppListState(teamNum, teamState);
			
		}
		
		mv.setViewName("redirect:/team/adteam_create");
		return mv;
	}
//	관리자 현행 팀 관리
	@RequestMapping(value = "/team/adteam_currentBoard", method = RequestMethod.GET)
	public ModelAndView adminTeamCurrentBoard(ModelAndView mv, Integer teamNum) {
		TeamVO tmpTeam = teamService.selectTeamByTm_Num(teamNum);
		
		mv.addObject("team", tmpTeam);
		mv.setViewName("/team/team_admin_currentteamboard");
		return mv;
	}
//	팀 게시판
	@RequestMapping(value="/team/board_list", method = RequestMethod.GET)
	public ModelAndView TeamBoardMain(ModelAndView mv,Integer teamNum, TeamVO team, Criteria cri) {
		if(cri ==null) {
			cri = new Criteria();
		}
//		임시 팀번호 지정
		team = teamService.selectTeamByTm_Num(teamNum);
		if(team==null) {
			mv.addObject("msg", "유효하지 않은 팀번호입니다.");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			return mv;
		}
		int totalCnt = teamBoardService.countTeamBoardTotalCnt(team, cri);
		ArrayList<BoardVO> boardList = teamBoardService.selectTeamBoardByTeam(team, cri);
		ArrayList<BoardCategoryVO> categoryList = teamBoardService.selectTeamBoardCategory(team.getTm_num());
		
		PageMaker pm = new PageMaker(totalCnt, 10, cri);
		mv.addObject("team", team);
		mv.addObject("pm", pm);
		mv.addObject("categoryList", categoryList);
		mv.addObject("boardList", boardList);
		mv.setViewName("/team/board/team-board_list");
		return mv;
	}
	@RequestMapping(value="/team/board_write", method = RequestMethod.GET)
	public ModelAndView TeamBoardWrite(ModelAndView mv, Integer teamNum) {
		
//		임시 팀번호 지정
		TeamVO team = teamService.selectTeamByTm_Num(teamNum);
		
		ArrayList<BoardCategoryVO> categoryList = teamBoardService.selectTeamBoardCategory(team.getTm_num());
		mv.addObject("team", team);
		mv.addObject("categoryList", categoryList);
		mv.setViewName("/team/board/team-board_create");
		return mv;
	}
	@RequestMapping(value="/team/board_write", method = RequestMethod.POST)
	public ModelAndView TeamBoardWritePOST(ModelAndView mv, Integer teamNum, BoardVO board,
			MultipartFile[] files, String resArr, String tmpArr) {
		
		boolean res = teamBoardService.insertBoardFromTeamBoard(board, teamNum, files);
		teamBoardService.updateSummerNoteImg(board.getBo_num(), resArr, tmpArr);
		mv.addObject("msg", "게시글이 등록되었습니다.");
		mv.addObject("url", "/team/board_list?teamNum="+teamNum);
		
		mv.setViewName("/common/message");
		return mv;
	}
	@RequestMapping(value="/team/board_update", method = RequestMethod.GET)
	public ModelAndView TeamBoardUpdate(ModelAndView mv, Integer boNum, Integer teamNum, HttpServletRequest req) {
//		일단 여기서 자격 검증 1회
		MembersVO user = (MembersVO)req.getSession().getAttribute("loginUser");
		BoardVO tmpBoard = teamBoardService.selectTeamBoardByBoNum(boNum);
		String url = req.getHeader("referer");

		if(!user.getMe_id().equals(tmpBoard.getBo_me_id())) {
			mv.addObject("msg", "잘못된 접근입니다.(사유: 자격 없는 수정)");
			mv.addObject("url", url);
			mv.setViewName("/common/message");
		}
		
		
//		팀 가져오기
		TeamVO team = teamService.selectTeamByTm_Num(teamNum);
//		카테고리 가져오기
		ArrayList<BoardCategoryVO> categoryList = teamBoardService.selectTeamBoardCategory(team.getTm_num());
//		보드 가져오기
		
		ArrayList<BoardFileVO> fileList = teamBoardService.selectTeamBoardFiles(boNum);

		
		mv.addObject("board", tmpBoard);
		mv.addObject("team", team);
		mv.addObject("categoryList", categoryList);
		mv.addObject("fileList", fileList);
		mv.setViewName("/team/board/team-board_update");
		return mv;
	}
	
	@RequestMapping(value="/team/board_update", method = RequestMethod.POST)
	public ModelAndView TeamBoardUpdatePOST(ModelAndView mv, Integer teamNum, BoardVO board,
			MultipartFile[] files, String resArr, String tmpArr, HttpServletRequest req, Integer[] removeFileNums) {
		MembersVO user = (MembersVO)req.getSession().getAttribute("loginUser");
		String url = req.getHeader("referer");

		if(!user.getMe_id().equals(board.getBo_me_id())) {
			mv.addObject("msg", "잘못된 접근입니다.(사유: 자격 없는 수정)");
			mv.addObject("url", url);
			mv.setViewName("/common/message");
		}
		boolean res = teamBoardService.UpdateBoardFromTeamBoard(board, teamNum, files);
		teamBoardService.updateSummerNoteImg(board.getBo_num(), resArr, tmpArr);
		if(removeFileNums!=null) {
			for(Integer reFile : removeFileNums) {
				teamBoardService.deleteBoardFilesByBFNum(reFile);
			}
		}
		
		if(res) {
			mv.addObject("msg", "게시글이 수정되었습니다.");
		}else {
			mv.addObject("msg", "게시글 수정에 실패하였습니다.");
		}
		mv.addObject("url", "/team/board_list?teamNum="+teamNum);
		mv.setViewName("/common/message");
		return mv;
	}
	
	
	@RequestMapping(value="/team/board_detail", method = RequestMethod.GET)
	public ModelAndView TeamBoardDetail(ModelAndView mv, Integer teamNum, Integer boNum, HttpSession session) {
	 
		TeamVO team = teamService.selectTeamByTm_Num(teamNum);
		BoardVO board = teamBoardService.selectTeamBoardByBoNum(boNum);
//		조회수 올리기
		int viewCnt = board.getBo_view();
		viewCnt++;
		board.setBo_view(viewCnt);
		teamBoardService.updateTeamBoard(board);
//		카테고리 리스트
		ArrayList<BoardCategoryVO> categoryList = teamBoardService.selectTeamBoardCategory(team.getTm_num());
		
//		파일 리스트 
		ArrayList<BoardFileVO> fileList = teamBoardService.selectTeamBoardFiles(boNum);
		BoardFileVO tmp;
		mv.addObject("board", board);
		
		mv.addObject("team", team);
		mv.addObject("categoryList", categoryList);
		mv.addObject("fileList", fileList);
		mv.setViewName("/team/board/team-board_detail");
		return mv;
	}
//	게시판 댓글 작업
	@RequestMapping(value="/team/board_reply_insert", method = RequestMethod.POST)
	public ModelAndView TeamBoardReplyPOST(ModelAndView mv, BoardReplyVO reply, HttpServletRequest req) {
		
		String url = req.getHeader("referer");
		boolean res = teamBoardService.insertReply(reply);
		if(res) {
			mv.addObject("msg", "댓글이 등록되었습니다.");
			
		}else {
			mv.addObject("msg", "댓글 등록에 실패하였습니다.");
		}
		mv.addObject("url", url);
		mv.setViewName("/common/message");
		return mv;
	}
//	게시판 댓글 수정
	@RequestMapping(value="/team/board_reply_update", method = RequestMethod.POST)
	public ModelAndView TeamBoardReplyUpdatePOST(ModelAndView mv, BoardReplyVO reply, HttpServletRequest req) {
		String url = req.getHeader("referer");
		
		int br_num = reply.getBr_num();
		reply.setBr_num(br_num);
		
		boolean res = teamBoardService.updateReply(reply);
		if(res) {
			mv.addObject("msg", "댓글이 수정되었습니다.");
			
		}else {
			mv.addObject("msg", "댓글 수정에 실패하였습니다.");
		}
		mv.addObject("url", url);
		mv.setViewName("/common/message");
		return mv;
	}
	@RequestMapping(value="/team/board_delete", method = RequestMethod.POST)
	public ModelAndView TeamBoardDeletePOST(ModelAndView mv, Integer teamNum, BoardVO board) {
		
		boolean res = teamBoardService.deleteTeamBoard(board.getBo_num(), board.getBo_me_id());
		
		mv.addObject("msg", "게시글이 삭제되었습니다.");
		mv.addObject("url", "/team/board_list?teamNum="+teamNum);
		
		mv.setViewName("/common/message");
		return mv;
	}
	@RequestMapping(value="/team/board_deleteAuth", method = RequestMethod.POST)
	public ModelAndView TeamBoardDeleteAuthPOST(ModelAndView mv, Integer teamNum, Integer auth, BoardVO board) {
		
		boolean res = teamService.checkIsLeader(teamNum, board.getBo_me_id());
		mv.addObject("msg", "잘못된 접근입니다..");
		mv.addObject("url", "/team/board_list?teamNum="+teamNum);
		mv.setViewName("/common/message");
		if(!res) {
			return mv;
		}
		
		res = teamBoardService.deleteTeamBoardByAuth(board.getBo_num());
		if(!res) {
			return mv;
			
		}else {
			mv.addObject("msg", "관리자 권한으로 게시글이 삭제되었습니다.");
			mv.addObject("url", "/team/board_list?teamNum="+teamNum);
		}
		
		return mv;
	}
	

// 공용 ajax 맵핑 코드
//	팀넘버 가져오기
	@ResponseBody
	@RequestMapping(value="/team/ajax/teamNum", method=RequestMethod.POST)
	public Map<String, Object>getTeamByNumAjax(@RequestBody TeamVO team) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		TeamVO tmp = teamService.selectTeamByTm_Num(team.getTm_num());
		map.put("team", tmp);
		return map;
	}
//	팀의 다음 경기 
	@ResponseBody
	@RequestMapping(value="/team/ajax/nextMatch", method=RequestMethod.POST)
	public Map<String, Object>getNextMatchByNumAjax(@RequestBody TeamVO team) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(team.getTm_num()>0) {
			MatchScheduleVO nextMatch= scheduleService.selectNextTeamSchedule(team.getTm_num());
			map.put("nextMatch", nextMatch);
			
		}
		return map;
	}
//	좋아요싫어요수
	@ResponseBody
	@RequestMapping(value="/team/ajax/boardVote", method=RequestMethod.POST)
	public Map<String, Object>setBoardVote(@RequestBody BoardVoteVO vote) {
		Map<String, Object> map = new HashMap<String, Object>();
		int res = teamBoardService.insertOrUpdateVote(vote);
//		Board의 추천수는 트리거 혹은 프로시저로 db상에서 변경해보기.(범용성)
		BoardVO board = teamBoardService.selectTeamBoardByBoNum(vote.getBv_bo_num());
		map.put("boardAfter", board);
		map.put("vote", vote);
		map.put("voteRes", res);
		return map;
	}
//	유저 좋아요 싫어요 정보
	@ResponseBody
	@RequestMapping(value="/team/ajax/getUserVote", method=RequestMethod.POST)
	public Map<String, Object>getUserBoardVote(@RequestBody BoardVoteVO vote) {
		Map<String, Object> map = new HashMap<String, Object>();
		BoardVoteVO userVote = teamBoardService.selectBoardVoteByBoNumAndMeId(vote.getBv_bo_num(), vote.getBv_me_id());
		map.put("vote", userVote);
		return map;
	}
//	리플 가져오기
	@ResponseBody
	@RequestMapping(value="/team/ajax/getReply", method=RequestMethod.POST)
	public Map<String, Object>getBoardReply(@RequestBody Criteria cri, Integer boNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int replyCnt = teamBoardService.countReply(boNum);
		ArrayList<BoardReplyVO> list = teamBoardService.selectReplyByBoNumAndCri(cri, boNum);
		PageMaker pm = new PageMaker(replyCnt, 10, cri);
		
		map.put("replyList", list);
		map.put("pm", pm);
		return map;
	}
//	리플 지우기
	@ResponseBody
	@RequestMapping(value="/team/ajax/deleteReply", method=RequestMethod.POST)
	public Map<String, Object>deleteBoardReply(@RequestParam("br_num") Integer br_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = teamBoardService.deleteReply(br_num);
		map.put("res", res);
		
		return map;
	}
//	me_id로 플레이어 이름과 계급 가져오기
	@ResponseBody
	@RequestMapping(value="/team/ajax/playerNameAndRank", method=RequestMethod.POST)
	public Map<String, Object>getPlayerNameAndRank(@RequestParam("me_id")String me_id, @RequestParam("teamNum")Integer teamNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		MembersVO user = membersService.selectMembersByMeId(me_id);
		PlayerVO player = playerService.selectPlayerByMeId(me_id);
		TeamPlayerVO tp= playerService.selectTeamPlayerByPlNumAndTmNum(player.getPl_num(), teamNum);
		
		map.put("userMember", user);
		map.put("userPlayer", player);
		map.put("userTP", tp);		
		return map;
	}
//	tp_num로 플레이어 이름가져오기
	@ResponseBody
	@RequestMapping(value="/team/ajax/playerNameByTpNum", method=RequestMethod.POST)
	public Map<String, Object>getPlayerNameByTpNum(@RequestParam("tp_num")Integer tp_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		PlayerVO player = playerService.selectPlayerByTpNum(tp_num);
		map.put("player", player);
		return map;
	}
	
//	tp_num과 mr_num을 보내면 해당 게임 정보를 찾아와주는 메소드(위에꺼에서 더 보충)
	@ResponseBody
	@RequestMapping(value="/team/ajax/playerRecord", method=RequestMethod.POST)
	public Map<String, Object>getPlayerRecord(@RequestParam("tp_num")Integer tp_num, @RequestParam("mr_num")Integer mr_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		PlayerVO player = playerService.selectPlayerByTpNum(tp_num);
		TeamPlayerVO tp = playerService.selectTeamPlayerByTpNum(tp_num);
		PlayerRecordHitterVO pRHitter = recordService.selectPlayerRecordHitterByTpNumAndMrNum(tp_num, mr_num);
		PlayerRecordHitterVO pRPitcher = recordService.selectPlayerRecordPitcherByTpNumAndMrNum(tp_num, mr_num);
		map.put("pRHitter", pRHitter);
		map.put("pRPitcher", pRPitcher);
		map.put("tp", tp);
		map.put("player", player);
		return map;
	}
//	batterBoxEvent type 보내기
	@ResponseBody
	@RequestMapping(value="/team/ajax/batterBoxEvent", method=RequestMethod.POST)
	public Map<String, Object>getBatterBoxEvent() {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<BatterBoxEventVO> batterBoxEventList = recordService.getAllBatterBoxEventList();
		map.put("batterBoxEventList", batterBoxEventList);
		return map;
	}
	
//	lineUp보내기
	@ResponseBody
	@RequestMapping(value="/team/ajax/sendLineUp", method=RequestMethod.POST)
	public Map<String, Object>sendLineUp(@RequestParam("ms_num")Integer ms_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<MatchLineUpVO> homeLineUp = lineUpService.selectLineUpOfMatchHome(ms_num);
		ArrayList<MatchLineUpVO> awayLineUp = lineUpService.selectLineUpOfMatchAway(ms_num);
		map.put("homeLineUp", homeLineUp);
		map.put("awayLineUp", awayLineUp);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/team/ajax/getAuth", method=RequestMethod.POST)
	public Map<String, Object>getAuth(@RequestParam("me_id")String me_id, @RequestParam("tm_num")Integer teamNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("siteAuth", false);
		if(authService.isSiteManager(me_id)) {
			map.put("siteAuth", true);
		}
		PlayerVO player = playerService.selectPlayerByMeId(me_id);
		TeamPlayerVO tp= playerService.selectTeamPlayerByPlNumAndTmNum(player.getPl_num(), teamNum);
		map.put("tp_auth", 0);
		if(tp!=null) {
			int tp_auth = tp.getTp_auth();
			map.put("tp_auth", tp_auth);
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/team/ajax/getOriMeId", method=RequestMethod.POST)
	public Map<String, Object>getOriReplyMeId(@RequestParam("br_ori_num") Integer br_ori_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String me_id = teamBoardService.selectMeIdByBrOriNum(br_ori_num);
		map.put("me_id", me_id);
		return map;
	}
	private boolean isUserNull(MembersVO user, ModelAndView mv) {
		if(user==null) {
			mv.addObject("msg", "로그인을 해주십시오.");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			
			return true;
		}	
		return false;
	}
	@ResponseBody
	@RequestMapping(value="/ajax/image", method=RequestMethod.POST)
	public Map<String, Object>handleFileUpload(@RequestParam("file") MultipartFile file) {
		Map<String, Object> map = new HashMap<String, Object>();
		BoardFileVO tmpFile = teamBoardService.uploadSummerNoteImg(file);
		String uploadFile = tmpFile.getBf_filename();
		int fileNum = tmpFile.getBf_num();
		map.put("fileNum", fileNum);
		map.put("uploadFile", uploadFile);
		return map;
	}
	
}