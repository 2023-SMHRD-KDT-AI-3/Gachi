package com.gachi.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.BoardDTO;
import com.gachi.model.CmtDTO;
import com.gachi.model.GoodsDTO;
import com.gachi.model.MemberDTO;
import com.gachi.model.SearchDAO;
import com.gachi.model.SearchDTO;
import com.google.gson.Gson;

public class GetSearch implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String url = "";
		try {
			request.setCharacterEncoding("utf-8");

			String keyword = request.getParameter("keyword");
			String type = request.getParameter("type");

			// SearchDAO에 접근할 수 있는 객체생성
			SearchDAO dao = new SearchDAO();

			SearchDTO search = new SearchDTO();
			search.setKeyword(keyword);

//		List<BoardDTO> searchResult = dao.searchBoard(search);
//		request.setAttribute("SearchResult", searchResult);

			// 닉네임검색
			if (type.equals("nick")) {
				List<MemberDTO> nickResult = dao.searchNick(search);
				request.setAttribute("nickResult", nickResult);
				url = "SearchResultN.jsp";
			}
			// 게시글 검색
			else if (type.equals("content")) {
				List<BoardDTO> contentResult = dao.searchBoard(search);
				request.setAttribute("contentResult", contentResult);
				url = "SearchResult.jsp";
			} else if (type.equals("goods")) {
				List<GoodsDTO> goodsResult = dao.searchGoods(search);
				request.setAttribute("goodsResult", goodsResult);
				url = "SearchResultG.jsp";
			} else if (type.equals("goodsS")) {
				List<GoodsDTO> goodsSResult = dao.searchGoods(search);

	            Gson g=new Gson();
	            String json=g.toJson(goodsSResult);
	            
	            //request.setAttribute("goodsSResult", goodsSResult);
	
	            response.setContentType("text/json;charset=euc-kr");            
	            PrintWriter out=response.getWriter();
	            out.println(json);
				url = null;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;

	}

}
