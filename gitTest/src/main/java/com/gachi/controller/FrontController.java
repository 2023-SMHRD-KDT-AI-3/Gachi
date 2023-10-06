package com.gachi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.controller.LoginService;
import com.gachi.controller.GoMainController;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String URI = request.getRequestURI();

		// 프로젝트 이름만 찾아오는 기능
		String contextPath = request.getContextPath();

		// 필요한 요청에 대한 내용만 가져오기 substring()
		String result = URI.substring(contextPath.length() + 1);

		// 이동하고자 하는 경로를 담을 수 있는 변수 선언
		String url = "";

		if (result.equals("LoginService.do")) {
			// 로그인 기능 구현

			LoginService loginService = new LoginService();
			url = loginService.execute(request, response);// BoardService.do

		} else if (result.equals("goMain.do")) {
			// 메인으로 이동하는 기능
			GoMainController goMainController = new GoMainController();
			url = goMainController.execute(request, response);
		} else if (result.equals("goLogin.do")) {
			// 로그인페이지로 이동하는 기능
			GoLoginController goLoginController = new GoLoginController();
			url = goLoginController.execute(request, response);
		} else if (result.equals("goLoginFail.do")) {
			// 로그인실패페이지로 이동하는 기능
			GoLoginFailController goLoginFailController = new GoLoginFailController();
			url = goLoginFailController.execute(request, response);
		} else if (result.equals("BoardService.do")) {
			// 피드에 게시글 보여주는 기능
			BoardService boardService = new BoardService();
			url = boardService.execute(request, response);
		} else if (result.equals("JoinService.do")) {
			// 회원가입 기능
			JoinService joinService = new JoinService();
			url = joinService.execute(request, response);
		} else if (result.equals("LogoutSevice.do")) {
			// 로그아웃 기능
			LogoutService logoutService = new LogoutService();
			url = logoutService.execute(request, response);
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
