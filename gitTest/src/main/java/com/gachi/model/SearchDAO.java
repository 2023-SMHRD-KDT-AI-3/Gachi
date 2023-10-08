package com.gachi.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;

public class SearchDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	SearchDTO search = new SearchDTO();

	// 게시글 검색
	ArrayList<BoardDTO> boardResult = new ArrayList<BoardDTO>();

	public ArrayList<BoardDTO> searchBoard(SearchDTO search) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		boardResult = (ArrayList) sqlSession.selectList("SearchBoard",search);

		sqlSession.close();

		return boardResult;
	}

	// 닉네임 검색
	ArrayList<MemberDTO> nickResult = new ArrayList<MemberDTO>();

	public ArrayList<MemberDTO> searchNick(SearchDTO search) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		nickResult = (ArrayList) sqlSession.selectList("SearchNick",search);

		sqlSession.close();

		return nickResult;
	}
}
