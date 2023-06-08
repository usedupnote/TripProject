package com.ssafy.enjoytrip.model.repo;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.dto.Star;

@Mapper
public interface StarRepo {
	/**Create*/
	int createStar(Star star) throws SQLException;

	/**Select By user_email*/
	Star selectUserByIdandEmail(int board_id, String user_email) throws SQLException;

	/**Read All*/
	List<Star> selectAll() throws SQLException;

	/**Read All by Board*/
	List<Star> selectAllByBoardId(int board_id) throws SQLException;
	
	/**Read All by Email*/
	List<Star> selectAllByEmail(String email) throws SQLException;

	
	/**Delete*/
	int deleteStar(Star star) throws SQLException;
}
