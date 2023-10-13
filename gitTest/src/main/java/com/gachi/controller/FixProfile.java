package com.gachi.controller;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gachi.model.MemberDAO;
import com.gachi.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FixProfile implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String url = "";
		//업로드 파일 사이즈
		int maxSize = 5*1024*1024;
		
		//업로드될 폴더 경로
		String path = request.getServletContext().getRealPath("/upload");
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, 
					path,
					maxSize,
					"utf-8",
					new DefaultFileRenamePolicy()
					  );
			String user_pic="";
			Enumeration<String> names = multi.getFileNames();
			
			 if(names.hasMoreElements()) {
	                String name = names.nextElement();
	                user_pic = multi.getFilesystemName(name);
	            }

			
			String user_id = multi.getParameter("user_id");
			String user_pw = multi.getParameter("user_pw");
			String user_nick = multi.getParameter("user_nick");
			String user_email = multi.getParameter("user_email");
			String user_introduction = multi.getParameter("user_introduction");

			
			MemberDAO dao = new MemberDAO();
			
			MemberDTO member = new MemberDTO();
			
			member.setUser_id(user_id);
			member.setUser_pw(user_pw);
			member.setUser_nick(user_nick);
			member.setUser_email(user_email);
			member.setUser_pic(user_pic);
			member.setUser_introduction(user_introduction);
			
			int resultProfile = dao.fixProfile(member);
			
			HttpSession session = request.getSession();
			// session의 데이터 삭제하기
			session.invalidate();
			
	         MemberDTO m = new MemberDTO();
	         m.setUser_id(user_id);
	         m.setUser_pw(user_pw);
	         
	         MemberDTO info = dao.login(m);

	         if (info != null) {
	            // 로그인 성공
	 			HttpSession session2 = request.getSession();
	            session2.setAttribute("info", info);
	            url = "MyBoard.do";
	         } else {
	        	 //로그인 실패
	             url = "goLoginFail.do";
	         }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return url;
	}

}
