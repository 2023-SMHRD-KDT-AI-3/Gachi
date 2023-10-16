package com.gachi.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gachi.db.SqlSessionManager;

public class FollowDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 팔로우 유무 체크
	public int FollowCheck(FollowDTO follow) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int result = sqlSession.selectOne("FollowCheck", follow);

		sqlSession.close();

		return result;
	}

	// 팔로우 추가
	public void FollowUpdate(FollowDTO follow) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		sqlSession.insert("FollowUpdate", follow);
		sqlSession.close();
	}

	// 팔로우 삭제
	public void FollowDelete(FollowDTO follow) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		sqlSession.delete("FollowDelete", follow);
		sqlSession.close();
	}

	// 팔로워 카운트
	public int FollowUserCount(String count) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int Followers = sqlSession.selectOne("FollowUserCount", count);
		sqlSession.close();
		return Followers;
	}

	// 팔로잉 카운트
	public int FollowingUserCount(String count) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int Followers = sqlSession.selectOne("FollowingUserCount", count);
		sqlSession.close();
		return Followers;
	}

	// 팔로워리스트 가져오기
	public List<FollowDTO> FollowerUser(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<FollowDTO> follower = sqlSession.selectList("FollowerList", user_id);
		sqlSession.close();
		return follower;
	}

	// 팔로잉리스트 가져오기
	public List<FollowDTO> FollowingUser(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<FollowDTO> following = sqlSession.selectList("FollowingList", user_id);
		sqlSession.close();
		return following;
	}

}
