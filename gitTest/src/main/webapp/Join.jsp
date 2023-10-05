<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물팔레트</title>
</head>
<body>
	<!-- 회원가입 페이지 -->
	<form action="JoinService.do" method="post">
		<li>아이디<input type="text" placeholder="ID를 입력하세요" name="id"></li>
		<li>비밀번호<input type="password" placeholder="PW를 입력하세요" name="pw"></li>
		<li>이름<input type="text" placeholder="이름을 입력하세요" name="name"></li>
		<li>닉네임<input type="text" placeholder="닉네임을 입력하세요" name="nick"></li>
		<li>이메일<input type="text" placeholder="이메일을 입력하세요" name="email"></li>
		<li>성별 <span>남</span> <input type="radio" name="gender" value="male">
			<span>여</span> <input type="radio" name="gender" value="female"></li>
		<li>생년월일 <input type="date" name="birthday"></li>
		<li><input type="submit" value="회원가입"></li>
	</form>
	
</body>
</html>