package com.tripback.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tripback.dto.Att;
import com.tripback.dto.AttDetail;
import com.tripback.util.DBUtil;

public class AttDaoImpl implements AttDao {
	private static AttDao instance = new AttDaoImpl();

	private AttDaoImpl() {
	}

	public static AttDao getInstance() {
		return instance;
	}

	private DBUtil util = DBUtil.getInstance();

	@Override
	public List<Att> selectAllBySido(int sido) throws SQLException {
		List<Att> att = new ArrayList<>();
		String sql = "select ai.content_id, ai.content_type_id, ai.title, ai.addr1, ai.first_image, ai.sido_code, ai.gugun_code from attraction_info ai, sido where sd.sido_code=? and ai.sido_code=sd.sido_code";
		try (Connection con = util.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, sido);
			try (ResultSet rs = ps.executeQuery();) {
				while (rs.next()) {
					att.add(new Att(rs.getInt("content_id"), rs.getInt("content_type_id"), rs.getString("title"),
							rs.getString("addr1"), rs.getString("first_image"), rs.getInt("sido_code"),
							rs.getInt("gugun_code")));
				}
			}
		}
		return att;
	}

	@Override
	public List<Att> selectAllByWord(String word) throws SQLException {
		List<Att> att = new ArrayList<>();
		String sql = "select * from attraction_info where title like %?%";
		try (Connection con = util.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setString(1, word);
			try (ResultSet rs = ps.executeQuery();) {
				while (rs.next()) {
					att.add(new Att(rs.getInt("content_id"), rs.getInt("content_type_id"), rs.getString("title"),
							rs.getString("addr1"), rs.getString("first_image"), rs.getInt("sido_code"),
							rs.getInt("gugun_code")));
				}
			}
		}
		return att;
	}

	@Override
	public List<Att> selectAllBySidoAndGugun(int sido, String gugun) throws SQLException {
		List<Att> att = new ArrayList<>();
		String sql = "select ai.content_id, ai.content_type_id, ai.title, ai.addr1, ai.first_image, ai.sido_code, ai.gugun_code from attraction_info ai, sido s, gugun g where s.sido_code=? and ai.sido_code=s.sido_code and g.gugun_name=? and ai.gugun_code=g.gugun_code";
		try (Connection con = util.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, sido);
			ps.setString(2, gugun);
			try (ResultSet rs = ps.executeQuery();) {
				while (rs.next()) {
					att.add(new Att(rs.getInt("content_id"), rs.getInt("content_type_id"), rs.getString("title"),
							rs.getString("addr1"), rs.getString("first_image"), rs.getInt("sido_code"),
							rs.getInt("gugun_code")));
				}
			}
		}
		return att;
	}

	@Override
	public List<Att> selectAllBySidoAndGugunAndContentTypeId(int sido, String gugun, int type) throws SQLException {
		List<Att> att = new ArrayList<>();
//		int content_type_id = 0;
//		switch (type) {
//		case "관광지":
//			content_type_id = 12;
//			break;
//		case "문화시설":
//			content_type_id = 14;
//			break;
//		case "축제공연행사":
//			content_type_id = 15;
//			break;
//		case "여행코스":
//			content_type_id = 25;
//			break;
//		case "레포츠":
//			content_type_id = 28;
//			break;
//		case "숙박":
//			content_type_id = 32;
//			break;
//		case "쇼핑":
//			content_type_id = 38;
//			break;
//		case "음식점":
//			content_type_id = 39;
//			break;
//		}
		String sql = "select ai.content_id, ai.content_type_id, ai.title, ai.addr1, ai.first_image, ai.sido_code, ai.gugun_code from attraction_info ai, sido s, gugun g where s.sido_code=? and ai.sido_code=s.sido_code and g.gugun_name=? and ai.gugun_code=g.gugun_code and ai.content_type_id=?";
		try (Connection con = util.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, sido);
			ps.setString(2, gugun);
			ps.setInt(3, type);
			try (ResultSet rs = ps.executeQuery();) {
				while (rs.next()) {
					att.add(new Att(rs.getInt("content_id"), rs.getInt("content_type_id"), rs.getString("title"),
							rs.getString("addr1"), rs.getString("first_image"), rs.getInt("sido_code"),
							rs.getInt("gugun_code")));
				}
			}
		}
		return att;
	}

	@Override
	public List<Att> selectAllBySidoAndContentTypeIdAndWord(int sido, int type, String word) throws SQLException {
		List<Att> att = new ArrayList<>();
		String sql = "select content_id, content_type_id, title,addr1, first_image, sido_code, gugun_code from attraction_info where sido_code=? and content_type_id=? and title like ?";
		try (Connection con = util.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, sido);
			ps.setInt(2, type);
			ps.setString(3, "%" + word + "%");
			try (ResultSet rs = ps.executeQuery();) {
				while (rs.next()) {
					att.add(new Att(rs.getInt("content_id"), rs.getInt("content_type_id"), rs.getString("title"),
							rs.getString("addr1"), rs.getString("first_image"), rs.getInt("sido_code"),
							rs.getInt("gugun_code")));
				}
			}
		}
		return att;
	}

	@Override
	public AttDetail selectByContentId(int contentId) throws SQLException {
		AttDetail attdetail = null;
		String sql = "SELECT ai.content_id, ai.content_type_id, ai.title, ai.first_image2, ai.latitude, ai.longitude, ad.overview FROM attraction_info ai, attraction_description ad where ai.content_id=ad.content_id and ai.content_id=?";
		try (Connection con = util.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, contentId);
			try (ResultSet rs = ps.executeQuery();) {
				if (rs.next()) {
					attdetail = new AttDetail(rs.getInt("content_id"), rs.getInt("content_type_id"),
							rs.getString("title"), rs.getString("first_image2"), rs.getDouble("latitude"),
							rs.getDouble("longitude"), rs.getString("overview"));
				}
			}
		}
		return attdetail;
	}

}
