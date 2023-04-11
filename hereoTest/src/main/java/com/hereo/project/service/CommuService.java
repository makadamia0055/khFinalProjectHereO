package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.BoardTypeVO;

public interface CommuService {

	ArrayList<BoardTypeVO> getBoardType(int me_siteauth);

}
