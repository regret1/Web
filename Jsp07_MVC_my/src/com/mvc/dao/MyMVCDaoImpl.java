package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.dto.MyMVCDto;
import static common.JDBCTemplate.*;

public class MyMVCDaoImpl implements MyMVCDao {

	@Override
	public List<MyMVCDto> selectAll(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MyMVCDto> res = new ArrayList<MyMVCDto>();
		
		String sql = selectAllSql;
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			while(rs.next()) {
				MyMVCDto tmp = new MyMVCDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));
				res.add(tmp);
			}
		}catch(SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		return res; 
	}

	@Override
	public MyMVCDto selectOne(Connection con, int seq) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MyMVCDto res = null;
		
		String sql = selectOneSql;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			if(rs.next()) {
				res = new MyMVCDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}

	@Override
	public boolean insert(Connection con, MyMVCDto dto) {
		
		return false;
	}

	@Override
	public boolean update(Connection con, MyMVCDto dto) {
		return false;
	}

	@Override
	public boolean delete(Connection con, int seq) {
		return false;
	}

}
