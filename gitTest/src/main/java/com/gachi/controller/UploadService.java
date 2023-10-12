package com.gachi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UploadService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
        String fileName = request.getParameter("fileName");
        System.out.println(fileName);
		return null;
	}

}
