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
	List<LikeBoardDTO> boardResult;// = new ArrayList<BoardDTO>();

	public List<LikeBoardDTO> searchBoard(String keyword) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		boardResult = (List) sqlSession.selectList("SearchBoard",keyword);

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

	// 상품 검색
	List<GoodsDTO> goodsResult;
	
	public List<GoodsDTO> searchGoods(SearchDTO search) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		goodsResult = (List) sqlSession.selectList("SearchGoods",search);

		sqlSession.close();

		return goodsResult;
	}
	
	// 해시태그 검색
		List<LikeBoardDTO> hashResult;
		
		public List<LikeBoardDTO> searchHash(String keyword) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);

			hashResult = (List) sqlSession.selectList("SearchHash",keyword);

			sqlSession.close();

			return hashResult;
		}
}
