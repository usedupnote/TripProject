package com.tripback.service;

import java.sql.SQLException;
import java.util.List;

import com.tripback.dao.AttDao;
import com.tripback.dao.AttDaoImpl;
import com.tripback.dto.Att;
import com.tripback.dto.AttDetail;

public class AttServicempl implements AttService {
	private static AttService instance = new AttServicempl();

	private AttServicempl() {
	}

	public static AttService getInstance() {
		return instance;
	}

	private AttDao dao = AttDaoImpl.getInstance();

	@Override
	public List<Att> selectAllBySido(int sido) throws SQLException {
		return dao.selectAllBySido(sido);
	}

	@Override
	public List<Att> selectAllByWord(String word) throws SQLException {
		return dao.selectAllByWord(word);
	}

	@Override
	public List<Att> selectAllBySidoAndGugun(int sido, String gugun) throws SQLException {
		return dao.selectAllBySidoAndGugun(sido, gugun);
	}

	@Override
	public List<Att> selectAllBySidoAndGugunAndContentTypeId(int sido, String gugun, int type) throws SQLException {
		return dao.selectAllBySidoAndGugunAndContentTypeId(sido, gugun, type);
	}

	@Override
	public List<Att> selectAllBySidoAndContentTypeIdAndWord(int sido, int type, String word) throws SQLException {
		return dao.selectAllBySidoAndContentTypeIdAndWord(sido, type, word);
	}

	@Override
	public AttDetail selectByContentId(int type) throws SQLException {
		return dao.selectByContentId(type);
	}

	public static void main(String[] args) throws SQLException {
		AttService as = AttServicempl.getInstance();
		System.out.println(as.selectByContentId(125683));
	}

}
