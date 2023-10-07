package com.gachi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CmtDTO {
	private int cmt_id;
	private int post_id;
	private String cmt_content;
	private String created_at;
	private String user_id;

}
