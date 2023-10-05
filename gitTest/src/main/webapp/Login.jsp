<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물팔레트</title>
</head>
<body>
	<!-- 로그인 페이지 -->
	<form action="LoginService.do" method='post'>
		ID<input type="text" placeholder="ID를입력하세요" name="id"><br>
		PW<input type="password" placeholder="PW를 입력하세요" name="pw"><br>
		<input type="submit" value="LogIn" class="button fit">
		<button type = "button" onclick = "location.href = 'Join.jsp'" >Join</button>
	</form>

</body>
</html>