package com.gachi.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.BoardDAO;
import com.gachi.model.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWrite implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String url = "";
		try {
			request.setCharacterEncoding("utf-8");

			String user_id = request.getParameter("user_id");
			String post_content = request.getParameter("post_content");
			int goods_id = Integer.parseInt(request.getParameter("goods_id"));
			String post_img = request.getParameter("post_img");

			BoardDAO dao = new BoardDAO();

			BoardDTO board = new BoardDTO();

			board.setUser_id(user_id);
			board.setPost_content(post_content);
			board.setGoods_id(goods_id);
			board.setPost_img(post_img);

			int cnt = dao.write(board);

			if (cnt > 0) {
				// 게시글 등록 성공 -> 메인페이지 이동
				url = "BoardService.do";
			} else {
				// 게시글 등록 실패 -> "WriteFail.jsp" 이동
				url = "WriteFail.jsp";
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return url;
	}

}
