package com.gachi.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.FollowDAO;
import com.gachi.model.FollowDTO;

public class FollowService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			
			String user_id = request.getParameter("user_id");
			String following_id = request.getParameter("following_id");
			
			FollowDAO dao = new FollowDAO();
			
			FollowDTO follow = new FollowDTO();
			follow.setUser_id(user_id);
			follow.setFollowing_id(following_id);
			int resultFollow = dao.FollowCheck(follow);
						
			
			if(resultFollow==0) {
				dao.FollowUpdate(follow);
			}else {
				dao.FollowDelete(follow);
			}
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println(resultFollow); //출력해서 확인
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
