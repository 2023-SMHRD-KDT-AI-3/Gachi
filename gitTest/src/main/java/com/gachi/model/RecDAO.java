package com.gachi.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;


public class RecDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 게시글 추천여부 검사
	public int RecCheck(RecDTO m) {

		SqlSession sqlSession  =sqlSessionFactory.openSession(true);
		
		int result  = sqlSession.selectOne("RecCheck", m);
		sqlSession.close();
		
		return result;
	}
	
	// 게시글 추천
	public void RecUpdate(RecDTO m) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		sqlSession.insert("RecUpdate", m);
		sqlSession.close();
	}
	
	// 게시글 추천 제거
	public void RecDelete(RecDTO m) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		sqlSession.insert("RecDelete", m);
		sqlSession.close();
	}
}
