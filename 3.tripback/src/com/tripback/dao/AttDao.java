package com.tripback.dao;

import java.sql.SQLException;
import java.util.List;

import com.tripback.dto.Att;
import com.tripback.dto.AttDetail;

public interface AttDao {
	List<Att> selectAllBySido(int sido) throws SQLException;

	List<Att> selectAllByWord(String word) throws SQLException;

	List<Att> selectAllBySidoAndGugun(int sido, String gugun) throws SQLException;

	List<Att> selectAllBySidoAndGugunAndContentTypeId(int sido, String gugun, int type) throws SQLException;

	List<Att> selectAllBySidoAndContentTypeIdAndWord(int sido, int type, String word) throws SQLException;

	AttDetail selectByContentId(int contentId) throws SQLException;
}
