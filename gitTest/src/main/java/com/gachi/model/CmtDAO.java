package com.gachi.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;

public class CmtDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 댓글작성 기능
	public int write(CmtDTO cmt) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);

		int cnt = sqlsession.insert("writeCmt", cmt);

		sqlsession.close();

		return cnt;
	}
	
	// 댓글 전체 조회
	ArrayList<CmtDTO> cmtList = new ArrayList<CmtDTO>();

	public ArrayList<CmtDTO> CmtList(int post_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		cmtList = (ArrayList) sqlSession.selectList("CmtList",post_id);

		sqlSession.close();

		return cmtList;
	}
}
