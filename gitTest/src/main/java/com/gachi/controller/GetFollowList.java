package com.gachi.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.BoardDAO;
import com.gachi.model.FollowDAO;
import com.gachi.model.FollowDTO;
import com.google.gson.Gson;

public class GetFollowList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("utf-8");

			BoardDAO dao = new BoardDAO();
			FollowDAO follow = new FollowDAO();
			String user_id = request.getParameter("user_id");
			String type = request.getParameter("type");

			if (type.equals("follower")) {
				// 팔로워 리스트
				List<FollowDTO> follower = follow.FollowerUser(user_id);
				Gson g = new Gson();
				String json = g.toJson(follower);
				response.setContentType("text/json;charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println(json);
			} else if (type.equals("following")) {
				// 팔로잉 리스트
				List<FollowDTO> following = follow.FollowingUser(user_id);
				Gson g = new Gson();
				String json = g.toJson(following);
				response.setContentType("text/json;charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println(json);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
