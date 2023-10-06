package com.gachi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoLoginController implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String url = "Login.jsp";
		return url;
	}

}
