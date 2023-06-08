package com.ssafy.enjoytrip.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.enjoytrip.dto.Star;

public interface StarService {
	/**Create*/
	int createStar(Star star) throws SQLException;
	
	/**Select By user_email*/
	Star selectUserByIdandEmail(int board_id, String user_email) throws SQLException;

	/**Read All by Email*/
	List<Star> selectAll() throws SQLException;
	
	/**Read All by Board*/
	List<Star> selectAllByBoardId(int board_id) throws SQLException;
	
	/**Read All by Email*/
	List<Star> selectAllByEmail(String email) throws SQLException;
	
	/**Delete*/
	int deleteStar(Star star) throws SQLException;
}
