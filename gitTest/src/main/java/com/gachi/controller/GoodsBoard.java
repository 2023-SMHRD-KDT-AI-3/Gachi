package com.gachi.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.BoardDAO;
import com.gachi.model.BoardDTO;
import com.gachi.model.LikeBoardDTO;

public class GoodsBoard implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			
			int goods_id=Integer.valueOf(request.getParameter("goods_id"));
			
			BoardDAO dao=new BoardDAO();
						
			List<LikeBoardDTO> goodsBoard = dao.GoodsBoard(goods_id);
			
			request.setAttribute("goodsBoard", goodsBoard);
		
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "GoodsBoard.jsp";
	}

}
