package com.gachi.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;


public class LikeDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 게시글 좋아요여부 검사
	public int likeCheck(LikeDTO m) {

		SqlSession sqlSession  =sqlSessionFactory.openSession(true);
		
		int result  = sqlSession.selectOne("likeCheck", m);
		sqlSession.close();
		
		return result;
	}
	
	// 게시글 좋아요
	public void likeUpdate(LikeDTO m) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		sqlSession.insert("likeUpdate", m);
		sqlSession.close();
	}
	
	// 게시글 좋아요 제거
	public void likeDelete(LikeDTO m) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		sqlSession.insert("likeDelete", m);
		sqlSession.close();
	}
	
	
	

}
