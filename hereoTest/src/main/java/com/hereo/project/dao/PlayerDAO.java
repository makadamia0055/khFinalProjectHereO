package com.hereo.project.dao;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.TeamPlayerVO;

public interface PlayerDAO {

	PlayerVO selectPlayerByTP(@Param("tp")TeamPlayerVO tmp);

	PlayerVO selectPlayerByNum(@Param("pl_num")Integer player);


}
