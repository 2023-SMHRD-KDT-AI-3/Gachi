package com.gachi.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.BoardDTO;
import com.gachi.model.MemberDTO;
import com.gachi.model.SearchDAO;
import com.gachi.model.SearchDTO;

public class GetSearch implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			
		String keyword=request.getParameter("keyword");
		
		
		// SearchDAO에 접근할 수 있는 객체생성
		SearchDAO dao = new SearchDAO();
		
		SearchDTO search = new SearchDTO();
		search.setKeyword(keyword);
		
		// 닉네임검색
		if(keyword.equals("nick")) {
		ArrayList<MemberDTO> searchResult = dao.searchNick(search);
		request.setAttribute("SearchResult", searchResult);
		}
		// 게시글 검색
		else if(keyword.equals("content")) {
		ArrayList<BoardDTO> searchResult = dao.searchBoard(search);
		request.setAttribute("SearchResult", searchResult);
		}
		

	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

		return "Search.jsp";

	}

}
