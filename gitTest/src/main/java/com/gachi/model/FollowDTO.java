package com.gachi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FollowDTO {
	
	private int follow_id;
	private String user_id;		// 로그인한 사람(나) , 팔로우를 신청한 사람
	private String following_id;	//내가 팔로우 하고 싶은 사람, 팔로우를 받은 사람
}
