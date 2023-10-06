package com.gachi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoMainController implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String url = "BoardService.do";
		return url;
	}

}
