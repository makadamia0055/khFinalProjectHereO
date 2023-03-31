package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.MembersVO;

public interface MembersDAO {

	int insertUser(@Param("user")MembersVO user);

	MembersVO selectUserId(@Param("user")String me_id);



}
