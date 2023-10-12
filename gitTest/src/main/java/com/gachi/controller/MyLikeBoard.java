package com.gachi.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.BoardDAO;
import com.gachi.model.BoardDTO;

public class MyLikeBoard implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");

			String user_id=request.getParameter("user_id");
			
			// BoardDAO에 접근할 수 있는 객체생성
			BoardDAO dao = new BoardDAO();
			ArrayList<BoardDTO> myLikeList = dao.MyLikeList(user_id);

			request.setAttribute("myLikeList", myLikeList);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return "Mypage2.jsp";

	}

}