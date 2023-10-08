package com.gachi.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.CmtDTO;
import com.gachi.model.CmtDAO;

public class CmtService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");

			int post_id = Integer.parseInt(request.getParameter("post_id"));

			// CmtDAO에 접근할 수 있는 객체생성
			CmtDAO dao = new CmtDAO();
			CmtDTO cmt = new CmtDTO();

			cmt.setPost_id(post_id);
			ArrayList<CmtDTO> cmtList = dao.CmtList(cmt);

			request.setAttribute("cmtList", cmtList);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "BoardService.do";
	}
}
