package com.gachi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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

	}

}
