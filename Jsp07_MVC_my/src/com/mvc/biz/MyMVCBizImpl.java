package com.mvc.biz;

import java.sql.Connection;
import java.util.List;

import com.mvc.dao.MyMVCDao;
import com.mvc.dao.MyMVCDaoImpl;
import com.mvc.dto.MyMVCDto;
import static common.JDBCTemplate.*;

public class MyMVCBizImpl implements MyMVCBiz {
	
	private MyMVCDao dao = new MyMVCDaoImpl();
	
	@Override
	public List<MyMVCDto> selectAll() {
		Connection con = getConnection();
		List<MyMVCDto> res =dao.selectAll(con);
		close(con);
		System.out.println("05.db종료");
		return res;
	}

	@Override
	public MyMVCDto selectOne(int seq) {
		Connection con = getConnection();
		MyMVCDto res = dao.selectOne(con, seq);
		close(con);
		System.out.println("05. db 종료");
		
		return res;
	}

	@Override
	public boolean insert(MyMVCDto dto) {
		Connection con = getConnection();
		boolean res = dao.insert(con, dto);
		
		return false;
	}

	@Override
	public boolean update(MyMVCDto dto) {
		return false;
	}

	@Override
	public boolean delete(int seq) {
		return false;
	}

}
