package com.gachi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CountDTO {
	private int LikeCnt;
	private int RecCnt;
	private int CommentCnt;
}
