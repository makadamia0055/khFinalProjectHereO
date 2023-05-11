package com.hereo.project.dao;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.TeamPlayerVO;

public interface PlayerDAO {

	PlayerVO selectPlayerByTpPlNum(@Param("tp_pl_num")Integer tmp);

	PlayerVO selectPlayerByNum(@Param("pl_num")Integer player);

	PlayerVO selectPlayerByMeId(String me_id);

	int updatePlayer(@Param("pl")PlayerVO player);



}
