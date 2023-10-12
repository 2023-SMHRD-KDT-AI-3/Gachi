package com.gachi.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;

public class SearchDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	SearchDTO search = new SearchDTO();

	// 게시글 검색
	List<BoardDTO> boardResult;// = new ArrayList<BoardDTO>();

	public List<BoardDTO> searchBoard(SearchDTO search) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		boardResult = (List) sqlSession.selectList("SearchBoard",search);

		sqlSession.close();

		return boardResult;
	}

	// 닉네임 검색
	List<MemberDTO> nickResult;

	public List<MemberDTO> searchNick(SearchDTO search) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		nickResult = (List) sqlSession.selectList("SearchNick",search);

		sqlSession.close();

		return nickResult;
	}
}