package com.gachi.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.CmtDTO;
import com.google.gson.Gson;
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

			
			ArrayList<CmtDTO> cmtList = dao.CmtList(post_id);
            Gson g=new Gson();
            String json=g.toJson(cmtList);
            
			//request.setAttribute("cmtList", cmtList);
            response.setContentType("text/json;charset=euc-kr");            
            PrintWriter out=response.getWriter();
            out.println(json);
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;//"Main.jsp";
	}
}
