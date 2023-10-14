package com.gachi.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;


public class FollowDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int FollowCheck(FollowDTO follow) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int result = sqlSession.selectOne("FollowCheck",follow);
		
		sqlSession.close();
		
		return result;
	}

	public void FollowUpdate(FollowDTO follow) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		sqlSession.insert("FollowUpdate",follow);
		sqlSession.close();
	}

	public void FollowDelete(FollowDTO follow) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		sqlSession.delete("FollowDelete", follow);
		sqlSession.close();
	}

	


}
