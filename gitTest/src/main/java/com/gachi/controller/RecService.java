package com.gachi.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.LikeDAO;
import com.gachi.model.LikeDTO;
import com.gachi.model.RecDAO;
import com.gachi.model.RecDTO;

public class RecService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			
			int goods_id = Integer.valueOf(request.getParameter("goods_id"));
			String user_id = request.getParameter("user_id");
			
			RecDAO dao = new RecDAO();
			
			// ArrayList<RecBoardDTO> recList = dao.RecBoard(); //
			// request.setAttribute("recList", recList); //
			
			RecDTO rec = new RecDTO();
			rec.setGoods_id(goods_id);
			rec.setUser_id(user_id);
			System.out.println("goods_id : "+goods_id);
			System.out.println("user_id : "+user_id);
			int result = dao.RecCheck(rec);
			System.out.println("0/1 : "+result);
			
			if(result==0) {	// 좋아요를 하지 않았다면 좋아요 추가 
				dao.RecUpdate(rec);				
			}else {		// 좋아요를 하였다면 좋아요 삭제
				dao.RecDelete(rec);
			}
			
			
			response.setContentType("text/html");
            PrintWriter out=response.getWriter();
		    out.println(result);
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

}
