package com.gachi.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;


public class MemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int join(MemberDTO m) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		// 받아온 데이터를 연결
		int cnt = sqlSession.insert("join",m);
		sqlSession.close();
		return cnt;
	}
	
	public MemberDTO login(MemberDTO m) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		MemberDTO info = sqlSession.selectOne("login",m);
		sqlSession.close();
		return info;
		
	}

	public int fixProfile(MemberDTO member) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int resultProfile = sqlSession.update("updateProfile", member);
		return resultProfile;
	}


}
