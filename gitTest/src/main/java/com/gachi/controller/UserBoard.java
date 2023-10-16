package com.gachi.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.BoardDAO;
import com.gachi.model.BoardDTO;
import com.gachi.model.FollowDAO;

public class UserBoard implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");

			String user_id = request.getParameter("user_id");
//			String login_id = request.getParameter("login_id");

			// BoardDAO에 접근할 수 있는 객체생성
			BoardDAO dao = new BoardDAO();
			FollowDAO follow=new FollowDAO();
//			follow.setUser_id(login_id);
//			follow.setFollowing_id(user_id);
			ArrayList<BoardDTO> userList = dao.MyList(user_id);


			// 상대방프로필 게시글 수 카운트
			int postCount = dao.MypostCount(user_id);
			request.setAttribute("postCount", postCount);
			
			//팔로우 카운트
			int FollowerCount = follow.FollowUserCount(user_id);
			request.setAttribute("FollowerCount", FollowerCount);
//			System.out.println("FollowerCount: "+FollowerCount);

			//팔로잉 카운트
			int FolloingCount = follow.FollowingUserCount(user_id);
			request.setAttribute("FolloingCount", FolloingCount);
//			System.out.println("FolloingCount: "+FolloingCount);
			
			
//			//팔로우 체크
//			int followCheck =dao.FollowCheck(follow);
//			
//			if (followCheck == 1) {
//	            // 이미 팔로우 중 
//	            HttpSession session3 = request.getSession();
//	            session3.setAttribute("FollowCheck",followCheck);
//	         } 

			request.setAttribute("userList", userList);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return "UserPage.jsp";

	}

}
