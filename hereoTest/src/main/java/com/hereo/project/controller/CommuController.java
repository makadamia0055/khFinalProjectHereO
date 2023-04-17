package com.hereo.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.hereo.project.service.CommuService;
import com.hereo.project.utils.MessageUtils;
import com.hereo.project.vo.BoardCategoryVO;
import com.hereo.project.vo.BoardTypeVO;
import com.hereo.project.vo.BoardVO;
import com.hereo.project.vo.MembersVO;


@Controller
public class CommuController {
	@Autowired
	CommuService boardService;
	
	@GetMapping(value = "/community")
	public String Home01(Model model) {
		ArrayList<BoardTypeVO> bt_list = boardService.getBoardType();
		BoardTypeVO bt=bt_list.get(0);
		int bt_num = bt.getBt_num();
		ArrayList<BoardVO> free_list= boardService.getFreeBoard(bt_num);
		
		model.addAttribute("bt_num",bt_num);
		model.addAttribute("free_board", free_list);
		
		return "/community/free-board";
	}	
	@GetMapping(value = "/community/free")
	public String home02(Model model) {
		
		ArrayList<BoardTypeVO> bt_list = boardService.getBoardType();
		BoardTypeVO bt=bt_list.get(0);
		int bt_num = bt.getBt_num();
		ArrayList<BoardVO> free_list= boardService.getFreeBoard(bt_num);
		
		model.addAttribute("bt_num",bt_num);
		model.addAttribute("free_board", free_list);
		
		return "/community/free-board";
	}	
	
	@GetMapping(value = "/community/eventAcid")
	public String eventAcid(Model model) {
		ArrayList<BoardTypeVO> bt_list = boardService.getBoardType();
		BoardTypeVO bt=bt_list.get(1);
		int bt_num = bt.getBt_num();
		
		ArrayList<BoardVO> acid_list= boardService.getFreeBoard(bt_num);
		model.addAttribute("bt_num",bt_num);
		model.addAttribute("acid_board", acid_list);
		return "/community/eventAcid-board";
	}	
	
	@GetMapping(value = "/community/findHero")
	public String findHero(Model model) {
		ArrayList<BoardTypeVO> bt_list = boardService.getBoardType();
		BoardTypeVO bt=bt_list.get(2);
		int bt_num = bt.getBt_num();
		
		model.addAttribute("bt_num",bt_num);
		return "/community/findHero-board";
	}
	
	@GetMapping(value = "/community/market")
	public String market(Model model) {
		ArrayList<BoardTypeVO> bt_list = boardService.getBoardType();
		BoardTypeVO bt=bt_list.get(3);
		int bt_num = bt.getBt_num();
		
		model.addAttribute("bt_num",bt_num);
		return "/community/market-board";
	}

	@GetMapping(value = "/community/writing/{bt_num}")
	public String writing(
			HttpServletRequest request, 
			HttpServletResponse response,
			Model model,
			@PathVariable("bt_num")int bt_num
			) {
		String referer = request.getHeader("Referer");
		MembersVO user=(MembersVO)request.getSession().getAttribute("loginUser");
		if (user==null) {
			MessageUtils.alertAndGoPrepage(response, "로그인 기능이 필요한 서비스입니다.", referer);
		};
		if (user.getMe_siteauth()<1) {
			MessageUtils.alertAndGoPrepage(response, "이메일 인증이 필요한 서비스입니다.", referer);
		}
		//보드카테고리01은 지역만 가져옴, 보드카테고리02는 지역빼고 가져옴.
		ArrayList<BoardCategoryVO> boardCategory01 = boardService.getBoardCategory01(bt_num);
		ArrayList<BoardCategoryVO> boardCategory02 = boardService.getBoardCategory02(bt_num);
		model.addAttribute("boardCategory01", boardCategory01);
		model.addAttribute("boardCategory02", boardCategory02);
		return "/community/commu-writingboard";
		
	}
}
	
