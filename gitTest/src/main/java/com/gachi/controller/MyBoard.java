package com.gachi.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.BoardDAO;
import com.gachi.model.BoardDTO;

public class MyBoard implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");

			String user_id=request.getParameter("user_id");
			
			// BoardDAO에 접근할 수 있는 객체생성
			BoardDAO dao = new BoardDAO();
			ArrayList<BoardDTO> myList = dao.MyList(user_id);
			
			// 상대방프로필 게시글 수 카운트
			int postCount = dao.MypostCount(user_id);
			request.setAttribute("postCountM", postCount);
			
			//팔로우 카운트
			int FollowerCount = dao.FollowUserCount(user_id);
			request.setAttribute("FollowerCountM", FollowerCount);
//			System.out.println("FollowerCountM: "+FollowerCount);

			//팔로잉 카운트
			int FolloingCount = dao.FollowingUserCount(user_id);
			request.setAttribute("FolloingCountM", FolloingCount);
//			System.out.println("FolloingCountM: "+FolloingCount);

			request.setAttribute("myList", myList);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return "Mypage.jsp";

	}

}
