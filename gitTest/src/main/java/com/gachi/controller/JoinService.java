package com.gachi.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gachi.model.MemberDAO;
import com.gachi.model.MemberDTO;

public class JoinService implements Command {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
         
         // 데이터 수집
         String id = request.getParameter("id");
         String pw = request.getParameter("pw");
         String name = request.getParameter("name");
         String nick = request.getParameter("nick");
         String email = request.getParameter("email");
         String gender = request.getParameter("gender");
         String birth = request.getParameter("birth");
         
         
         // 기능처리작업(DB전달)
         MemberDAO dao = new MemberDAO();
         
         MemberDTO m = new MemberDTO();
         m.setUser_id(id);
         m.setUser_pw(pw);
         m.setUser_name(name);
         m.setUser_nick(nick);
         m.setUser_email(email);
         m.setUser_gender(gender);
         m.setUser_birthdate(birth);
         
         dao.join(m);

      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      

      return "Login.jsp";
   }

}