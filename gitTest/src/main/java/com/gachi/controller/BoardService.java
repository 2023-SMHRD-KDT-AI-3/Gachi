package com.gachi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.gachi.model.BoardDAO;

public class BoardService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// BoardDAO에 접근할 수 있는 객체생성
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardDTO> list = dao.AllList();
		
		// web_Board에 있는 모든 내용 가져오기
		request.setAttribute("list",list);
		
		//RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
		//rd.forward(request, response);
		return "Main.jsp";

		
//		String path = request.getServletContext().getRealPath("file");
//		int maxSize = 1024*1024;  // (1024*1024=1MB)
//		String encoding = "utf-8";
//
//		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
//
//		// 데이터 수집
//		int post_id = Integer.valueOf( multi.getParameter("post_id"));
//		String user_id = multi.getParameter("user_id");
//		String post_content = multi.getParameter("post_content");
//		String post_img = multi.getParameter("post_img");
//		int goods_id = Integer.valueOf( multi.getParameter("post_content"));
//		String created_at = multi.getParameter("created_at");
//		int post_view = Integer.valueOf(multi.getParameter("post_view"));
//
//
//		// DB에 추가하고자 하는 내용 연결하기
//		BoardDAO dao = new BoardDAO();
//
//		// 여러개 데이터를 Board타입으로 사용할 수 있는 객체 생성
//		BoardDTO board = new BoardDTO();
//		board.setPost_id(post_id);
//		board.setUser_id(user_id);
//		board.setGoods_id(goods_id);
//		board.setPost_img(post_img);
//
//		int cnt = dao.write(board); // -> insert 작업
//
//		String url = "";
//
//		if (cnt > 0) {
//			// 게시글 등록 성공 -> goBoard 이동
//			url = "Main.jsp";
//		} else {
//			// 게시글 등록 실패 -> "WEB-INF/BoardWrite.jsp" 이동
//			url = "Write.jsp";
//		}
//
		//return null;
	}

}
