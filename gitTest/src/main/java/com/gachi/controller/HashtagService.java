package com.gachi.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.HashtagDAO;


public class HashtagService implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			
			String hashtag= request.getParameter("hashtag");
			
			HashtagDAO dao = new HashtagDAO();
			dao.AddHashtag(hashtag);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

}
