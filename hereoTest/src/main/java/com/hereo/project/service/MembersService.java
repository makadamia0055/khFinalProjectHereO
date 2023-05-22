package com.hereo.project.service;

import java.util.ArrayList;

import com.hereo.project.vo.MembersVO;

public interface MembersService {

	boolean insertUser(MembersVO user);

	MembersVO login(MembersVO user);

	MembersVO selectMembersByMeId(String pl_me_id);

	void updateAutoLoginSession(MembersVO loginUser);

	MembersVO getLoginSession(String me_session_id);

	MembersVO idCheck(String me_id);




}
