package com.gachi.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gachi.model.MemberDTO;
import com.gachi.model.MemberDAO;

public class LoginService implements Command {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) {
	   String url = "";
      try {
         request.setCharacterEncoding("utf-8");

         String id = request.getParameter("id");
         String pw = request.getParameter("pw");

         MemberDAO dao = new MemberDAO();

         // Member 타입에 입력받은 id, pw 담아서 한번에 전달
         MemberDTO m = new MemberDTO();
         m.setUser_id(id);
         m.setUser_pw(pw);

         // 로그인이라고 하는 메소드가 성공적으로 실행되면 해당회원의 모든 정보를 리턴값으로 받아올 것
         
         MemberDTO info = dao.login(m);

         if (info != null) {
            // 로그인 성공

            HttpSession session = request.getSession();
            session.setAttribute("info", info);
            url =  "goMain.do";
         } else {
        	 //로그인 실패
             url = "goLoginFail.do";
         }
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      return url;
   }

}