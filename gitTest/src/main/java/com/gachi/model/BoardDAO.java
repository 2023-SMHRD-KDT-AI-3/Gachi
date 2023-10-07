package com.gachi.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;
import com.gachi.model.BoardDTO;

public class BoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 게시글 전체 조회 메소드
	ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

	public ArrayList<BoardDTO> AllList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("AllList");

		sqlSession.close();

		return list;
	}

	// 게시글 하나만 내용을 확인 할 수 있는 기능
	public BoardDTO detail(String num) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		BoardDTO board = sqlSession.selectOne("detail", num);

		sqlSession.close();

		return board;
	}
	// 게시글 작성 기능
	public int write(BoardDTO board) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);

		int cnt = sqlsession.insert("write", board);

		sqlsession.close();

		return cnt;

	}
}
