package com.gachi.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.GoodsDAO;
import com.gachi.model.GoodsDTO;

public class GoodsService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// BoardDAO에 접근할 수 있는 객체생성
		GoodsDAO dao = new GoodsDAO();
		ArrayList<GoodsDTO> goodsList = dao.GoodsList();
		

		request.setAttribute("goodsList",goodsList);

		return "Search.jsp";
	}

}
