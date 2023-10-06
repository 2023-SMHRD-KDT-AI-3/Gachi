package com.gachi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {
	private int post_id;
	private String post_content;
	private String post_img;
	private int goods_id;
	private String created_at;
	private String user_id;
	private int post_view;

}
