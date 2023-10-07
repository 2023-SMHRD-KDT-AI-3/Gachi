package com.gachi.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;

public class CmtDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 댓글작성 기능
	public int write(CmtDTO cmt) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);

		int cnt = sqlsession.insert("write", cmt);

		sqlsession.close();

		return cnt;

	}
}
