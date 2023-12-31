package com.gachi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HashtagDTO {
	private int hashtag_id;
	private int post_id;
	private String hashtag_name;
}
