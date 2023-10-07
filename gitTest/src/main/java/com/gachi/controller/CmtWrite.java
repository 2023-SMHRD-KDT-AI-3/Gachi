package com.gachi.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.CmtDAO;
import com.gachi.model.CmtDTO;

public class CmtWrite implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			
			int post_id = Integer.valueOf(request.getParameter("post_id"));
			String cmt_content = request.getParameter("cmt_content");
			String user_id = request.getParameter("user_id");
			
			CmtDAO dao = new CmtDAO();
			
			CmtDTO cmt = new CmtDTO();
			
			cmt.setPost_id(post_id);
			cmt.setCmt_content(cmt_content);
			cmt.setUser_id(user_id);
			
			int result = dao.write(cmt);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

}
