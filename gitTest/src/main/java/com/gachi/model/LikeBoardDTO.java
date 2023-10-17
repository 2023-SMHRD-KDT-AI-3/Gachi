package com.gachi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LikeBoardDTO {
	private int post_id;
	private int post_idx;
	private String post_content;
	private String post_img;
	private int goods_id;
	private String created_at;
	private String user_id;
	private String kuser_id;
	private String user_pic;
	private int like_id;
	private int liked; // 1, 0
	private String hashtag_name;
}
