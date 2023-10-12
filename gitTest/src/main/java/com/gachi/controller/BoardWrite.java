package com.gachi.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gachi.model.BoardDAO;
import com.gachi.model.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWrite implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String url = "";
		//업로드 파일 사이즈
		
		int maxSize = 5*1024*1024;
		
        //업로드될 폴더 경로
        String path = request.getServletContext().getRealPath("/upload");
        System.out.println("uploadpath는? "+path);
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
					request, 
					path,
					maxSize,
					"utf-8",
					new DefaultFileRenamePolicy()
					  );
			String post_img="";
			Enumeration<String> names = multi.getFileNames();
            
            if(names.hasMoreElements()) {
                String name = names.nextElement();
                post_img = multi.getFilesystemName(name);
            }
			
			String user_id = multi.getParameter("user_id");
			String post_content = multi.getParameter("post_content");
			int goods_id = Integer.parseInt(multi.getParameter("goods_id"));
			//String post_img = multi.getFilesystemName("post_img");
	        
			BoardDAO dao = new BoardDAO();

			BoardDTO board = new BoardDTO();

			board.setUser_id(user_id);
			board.setPost_content(post_content);
			board.setGoods_id(goods_id);
			board.setPost_img(post_img);

			int cnt = dao.write(board);

			if (cnt > 0) {
				// 게시글 등록 성공 -> 메인페이지 이동
				url = "BoardService.do";
			} else {
				// 게시글 등록 실패 -> "WriteFail.jsp" 이동
				url = "WriteFail.jsp";
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return url;
	}

}
