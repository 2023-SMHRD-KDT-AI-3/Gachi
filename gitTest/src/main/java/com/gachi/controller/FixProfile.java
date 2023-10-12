package com.gachi.controller;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.compiler.ast.Member;

import com.gachi.controller.Command;
import com.gachi.model.MemberDAO;
import com.gachi.model.MemberDTO;

public class FixProfile implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String url = "";
		try {
			request.setCharacterEncoding("utf-8");
			
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			String user_nick = request.getParameter("user_nick");
			String user_email = request.getParameter("user_email");
			String user_pic = request.getParameter("user_pic");
			String user_introduction = request.getParameter("user_introduction");
			
			MemberDAO dao = new MemberDAO();
			
			MemberDTO member = new MemberDTO();
			
			member.setUser_id(user_id);
			member.setUser_pw(user_pw);
			member.setUser_nick(user_nick);
			member.setUser_email(user_email);
			member.setUser_pic(user_pic);
			member.setUser_introduction(user_introduction);
			
			int resultProfile = dao.fixProfile(member);
			
			url = "MyBoard.do";
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return url;
	}

}
