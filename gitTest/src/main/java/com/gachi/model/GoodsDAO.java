package com.gachi.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;

public class GoodsDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 상품리스트 조회 
	ArrayList<GoodsDTO> goodsList = new ArrayList<GoodsDTO>();


	public ArrayList<GoodsDTO> GoodsList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		goodsList = (ArrayList) sqlSession.selectList("GoodsList");

		sqlSession.close();

		return goodsList;
	}
}
