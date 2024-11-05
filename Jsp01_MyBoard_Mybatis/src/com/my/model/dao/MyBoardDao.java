package com.my.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.my.model.dto.MyBoard;

public class MyBoardDao extends SqlMapConfig{
	public List<MyBoard> selectAll(){
		List<MyBoard> res = new ArrayList<>();
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList("com.my.myboard.selectAll");
		
		session.close();
		
		return res;
	}
	
	public MyBoard selectOne(int myno) {
		SqlSession session = null;
		MyBoard res = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne("com.my.myboard.selectOne",myno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}
	
	public int insert(MyBoard dto) {
		//("namespace.id",dto);
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert("com.my.myboard.insert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}
	
	public int update(MyBoard dto) {
		
		return 0;
	}
	public int delete(int myno) {
	
	return 0;
}
}
