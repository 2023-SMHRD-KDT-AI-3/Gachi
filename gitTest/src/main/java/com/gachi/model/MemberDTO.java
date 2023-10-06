package com.gachi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // 필드를 사용한 getter/setter 메소드 생성
@AllArgsConstructor // 모든 필드를 사용한 생성자 메소드 생성
@NoArgsConstructor // 매개변수가 없는 기본생성자 메소드 생성

public class MemberDTO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_nick;
	private String user_email;
	private String user_gender;
	private String user_birth;
	private String user_pic;
	private String created_at;
	
}
