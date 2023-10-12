package com.gachi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.BoardDTO;
import com.gachi.model.LikeBoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.gachi.model.BoardDAO;

public class BoardService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// BoardDAO에 접근할 수 있는 객체생성
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardDTO> list = dao.AllList(); // BoardDTO -> LikeBoardDTO
        
		
		request.setAttribute("list",list);
		
		return "Main.jsp";

	}

}
