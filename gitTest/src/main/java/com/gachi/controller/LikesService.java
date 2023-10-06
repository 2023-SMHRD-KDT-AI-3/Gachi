package com.gachi.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gachi.model.MemberDTO;
import com.mysql.cj.Session;

public class LikesService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
            HttpSession session = request.getSession();
 
            
            //MemberDTO likes_m = session.getAttribute("info");
		} catch (UnsupportedEncodingException e) { 
			e.printStackTrace();
		}
		return null;
	}

}
