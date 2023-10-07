package com.gachi.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gachi.model.LikeDAO;
import com.gachi.model.LikeDTO;

public class LikeUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			
			int post_id = Integer.valueOf(request.getParameter("post_id"));
			String user_id = request.getParameter("user_id");
			
			LikeDAO dao = new LikeDAO();
			
			LikeDTO like = new LikeDTO();
			like.setPost_id(post_id);
			like.setUser_id(user_id);
			int resultLike = dao.likeCheck(like);
			
			if(resultLike==0) {	// 좋아요를 하지 않았다면 좋아요 추가 
				dao.likeUpdate(like);				
			}else {		// 좋아요를 하였다면 좋아요 삭제
				dao.likeDelete(like);
			}
			
            HttpSession session = request.getSession();
            session.setAttribute("resultLike", resultLike);
			
			// result 값 확인하기 위해 보내는 기능
//			response.setContentType("text/html");
//            PrintWriter out=response.getWriter();
//		    out.println(resultLike);
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

}
