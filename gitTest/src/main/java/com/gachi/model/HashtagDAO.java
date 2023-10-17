package com.gachi.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;

public class HashtagDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 해시태그 추가
		public void AddHashtag(HashtagDTO hashtag) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			sqlSession.insert("AddHashtag", hashtag);
			sqlSession.close();
		}
}
