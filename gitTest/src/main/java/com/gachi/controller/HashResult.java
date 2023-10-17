package com.gachi.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.BoardDAO;
import com.gachi.model.LikeBoardDTO;

public class HashResult implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
			
			String hashtag_name=request.getParameter("hashtag_name");
			
			
			// BoardDAO에 접근할 수 있는 객체생성
			BoardDAO dao = new BoardDAO();
			List<LikeBoardDTO> hashList = dao.HashList(hashtag_name); // BoardDTO -> LikeBoardDTO

			request.setAttribute("HashList", hashList);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "HashResult.jsp";

	}

}
