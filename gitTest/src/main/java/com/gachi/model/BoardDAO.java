package com.gachi.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;
import com.gachi.model.BoardDTO;
import com.gachi.model.LikeBoardDTO;

public class BoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	// 게시글 전체 조회 메소드
	ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

	public ArrayList<LikeBoardDTO> AllList(String user_id) { // BoardDTO -> LikeBoardDTO
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ArrayList<LikeBoardDTO> list = (ArrayList) sqlSession.selectList("AllList", user_id);
		// BoardDTO -> LikeBoardDTO
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
		
//		for(int i = 0;i<tagList.length;i++) {
//			sqlSession.insert("AddHashtag", tagList[i]);
//		}
		sqlsession.close();
		return cnt;
	}
	
	// 마지막에 작성한 게시물 번호 불러오기
	public int LastPostID() {
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		int lastID = sqlsession.selectOne("LastPostID");
		sqlsession.close();
		return lastID;
	}

	ArrayList<BoardDTO> myList = new ArrayList<BoardDTO>();
    // 내가 작성한 글 목록 불러오기
	public ArrayList<BoardDTO> MyList(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		myList = (ArrayList) sqlSession.selectList("MyList", user_id);
		sqlSession.close();
		return myList;

	}

	ArrayList<BoardDTO> myLikeList = new ArrayList<BoardDTO>();
	// 내가 좋아요 누른 리스트 불러오기
	public ArrayList<BoardDTO> MyLikeList(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		myLikeList = (ArrayList) sqlSession.selectList("MyLikeList", user_id);
		sqlSession.close();
		return myLikeList;
	}

	// 상대방 프로필 게시글 수 카운트
	public int MypostCount(String count) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int resultCount = sqlSession.selectOne("MypostCount", count);
		sqlSession.close();
		return resultCount;
	}

	// 검색 상품 리스트 출력
	public List<LikeBoardDTO> GoodsBoard(int goods_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<LikeBoardDTO> goodsBoard = sqlSession.selectList("GoodsBoard", goods_id);
		sqlSession.close();
		return goodsBoard;
	}

	// 해당 해시태그의 내용을 가진 게시글 출력
	public List<LikeBoardDTO> HashList(String hashtag_name) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<LikeBoardDTO> hashBoard = sqlSession.selectList("HashBoard", hashtag_name);
		sqlSession.close();
		return hashBoard;
	}

	

	

//	// 팔로우 체크
//	public int FollowCheck(FollowDTO follow) {
//		SqlSession sqlSession = sqlSessionFactory.openSession(true);
//		int followCheck = sqlSession.selectOne("FollowCheck",follow);
//		sqlSession.close();
//		return followCheck;
//	}

}
