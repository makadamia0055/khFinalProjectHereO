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
import com.hereo.project.service.MembersService;
import com.hereo.project.service.PlayerService;
import com.hereo.project.service.ScheduleService;
import com.hereo.project.service.TeamBoardService;
import com.hereo.project.service.TeamService;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardFileVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.BoardVoteVO;
import com.hereo.project.vo.MatchScheduleVO;
import com.hereo.project.vo.MembersVO;
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
		mv.addObject("Player", tmpPlayer);
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
		mv.addObject("team", tmpTeam);
		mv.setViewName("/team/team-record");
		return mv;
	}
//	팀 가입 관리 페이지(팀의 가입 관리)
	@RequestMapping(value = "/team/wtjPage", method = RequestMethod.GET)
	public ModelAndView teamWTJPage(ModelAndView mv,Criteria cri, HttpSession session) {
//		session.getAttribute("myTeam");
//		session.getAttribute("teamAuth");
		int teamNum = 64;
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
			MultipartFile[] files) {
		
		
		boolean res = teamBoardService.insertBoardFromTeamBoard(board, teamNum, files);
		
		mv.addObject("msg", "게시글이 등록되었습니다.");
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
		if(!res) {
			mv.addObject("msg", "잘못된 접근입니다..");
			mv.addObject("url", "/team/board_list?teamNum="+teamNum);
			mv.setViewName("/common/message");
			return mv;
		}
		
		res = teamBoardService.deleteTeamBoard(board.getBo_num());
		
		mv.addObject("msg", "관리자 권한으로 게시글이 삭제되었습니다.");
		mv.addObject("url", "/team/board_list?teamNum="+teamNum);
		
		mv.setViewName("/common/message");
		return mv;
	}
	

// 공용 ajax 맵핑 코드
	@ResponseBody
	@RequestMapping(value="/team/ajax/teamNum", method=RequestMethod.POST)
	public Map<String, Object>getTeamByNumAjax(@RequestBody TeamVO team) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		TeamVO tmp = teamService.selectTeamByTm_Num(team.getTm_num());
		map.put("team", tmp);
		return map;
	}
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
	@ResponseBody
	@RequestMapping(value="/team/ajax/getUserVote", method=RequestMethod.POST)
	public Map<String, Object>getUserBoardVote(@RequestBody BoardVoteVO vote) {
		Map<String, Object> map = new HashMap<String, Object>();
		BoardVoteVO userVote = teamBoardService.selectBoardVoteByBoNumAndMeId(vote.getBv_bo_num(), vote.getBv_me_id());
		map.put("vote", userVote);
		return map;
	}
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
	
	private boolean isUserNull(MembersVO user, ModelAndView mv) {
		if(user==null) {
			mv.addObject("msg", "로그인을 해주십시오.");
			mv.addObject("url", "/team/main");
			mv.setViewName("/common/message");
			
			return true;
		}	
		return false;
	}
	
}