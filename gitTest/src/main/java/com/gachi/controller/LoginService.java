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

		try {
			request.setCharacterEncoding("utf-8");

			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			MemberDAO dao = new MemberDAO();

			// Member 타입에 입력받은 email, pw 담아서 한번에 전달
			MemberDTO m = new MemberDTO();
			m.setUser_id(id);
			m.setUser_pw(pw);

			// 로그인이라고 하는 메소드가 성공적으로 실행되면 해당회원의 모든 정보를 리턴값으로 받아올 것

			MemberDTO info = dao.login(m);

			if (info != null) {
				// 로그인 성공
				// request.setAttribute("info", info);
				// 세션영역을 서블릿에서 사용하기 위해서는 객체 선언부터 필요하다
				// 클라이언트가 요청한 값과 응답에 대하여 공유하기 위해서는 해당 session을
				// request값으로부터 받아와야 한다.
				HttpSession session = request.getSession();
				session.setAttribute("info", info);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return "Main.jsp";
	}

}
