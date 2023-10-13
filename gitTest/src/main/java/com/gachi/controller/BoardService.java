package com.gachi.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gachi.model.BoardDAO;
import com.gachi.model.LikeBoardDTO;
import com.gachi.model.MemberDTO;

public class BoardService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("info");

		// BoardDAO에 접근할 수 있는 객체생성
		BoardDAO dao = new BoardDAO();
		ArrayList<LikeBoardDTO> list = dao.AllList(dto.getUser_id()); // BoardDTO -> LikeBoardDTO

		request.setAttribute("list", list);

		return "Main.jsp";

	}

}
