package com.hereo.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hereo.project.vo.PlayerVO;
import com.hereo.project.vo.Position_HopeVO;

public interface PositionDAO {

	ArrayList<Position_HopeVO> selectPlayerPosition_H(@Param("player")PlayerVO player);

}
