package com.gachi.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;


public class RecDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 게시글 추천여부 검사
	public int RecCheck(RecDTO rec) {

		SqlSession sqlSession  =sqlSessionFactory.openSession(true);
		
		int result  = sqlSession.selectOne("RecCheck", rec);
		sqlSession.close();
		
		return result;
	}
	
	// 게시글 추천
	public void RecUpdate(RecDTO rec) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		sqlSession.insert("RecUpdate", rec);
		sqlSession.close();
	}

	
	// 게시글 추천 제거
	public void RecDelete(RecDTO rec) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		sqlSession.insert("RecDelete", rec);
		sqlSession.close();
	}

	//


}
