<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	outline: none;
	border: none;
	text-decoration: none;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	background: #dfe9f5;
}

.myPage .container ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
}

/* 왼쪽 바 */
.heads {
	position: fixed;
	top: 0;
	bottom: 0;
	height: 100%;
	left: 0;
	background: #fff;
	width: 90px;
	overflow: hidden;
	transition: width 0.2s linear;
	box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
}

/* 선물팔레트 모양 예쁘게 만들기 */
.logo {
	display: flex;
	transition: all 0.5s ease;
	margin-top: 1rem;
	margin-bottom: 1rem;
	margin-left: 20px;
	padding-bottom: 20px;
}

/* 선물팔레트 로고 크기 조정 */
.logo img {
	width: 35px;
	height: 35px;
}
/* 선물팔레트 글자 조정 */
.logo span {
	padding-left: 15px;
	font-weight: bold;
	font-size: 20px;
	position: absolute;
}

/* 왼쪽 바 로고랑 글자 조정 */
.headers {
	position: relative;
	color: black;
	font-size: 14px;
	display: table;
	width: 300px;
	padding: 10px;
}
/* 왼쪽 바 로고들 조정 */
.fas {
	position: relative;
	width: 70px;
	height: 40px;
	top: 14px;
	font-size: 20px;
	text-align: center;
	margin-top: 1rem;
	margin-bottom: 1rem;
}
/* 왼쪽 바 글자들만 조정 */
.nav-item {
	position: relative;
	top: 12px;
	margin-left: 10px;
}

a {
	position: relative;
	color: black;
	font-size: 14px;
	display: table;
	width: 300px;
	padding: 10px;
}

/* 커서를 올리면 나타나게 하기 */
.headers:hover {
	background: #eee;
}
/* 왼쪽 바 나타나게 하기 */
nav:hover {
	width: 280px;
	transition: all 0.5s ease;
}

/* 로그아웃을 맨 밑으로 옮기기 */
.logout {
	position: absolute;
	bottom: 0;
}

#userID {
	align-items: right;
}

/* 검색바 */
.search .bar {
   border: 1px solid #bbb;
   width: 500px;
}

.search form {
   height: 35px;
    justify-content: center;
    display: flex;
    margin-top: 15px;
}

input[type="submit"] {
    font-family: FontAwesome;
    width: 45px;
    border: 1px solid #bbb;
}

/* 프로필 흰바탕 */
.myPage {
	background-color: white;
	width: 1100px;
	height: 5000px;
	margin-left: 450px;
	margin-top: 40px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
}
</style>
</head>
<body>
	<!-- 로고 아이콘 링크 -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	<!-- 제이쿼리 로드 -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<nav class="heads">
		<ul>
			<li><a href="BoardService.do" class="logo headers"> <img
					src="./img/logo1.png" alt=""> <span class="nav-item">선물팔레트</span>
			</a></li>
			<li><a href="BoardService.do" class="headers"> <i
					class="fas fa-home"></i> <span class="nav-item">홈</span>
			</a></li>
			<li><a href="GoodsService.do" class="headers"> <i
					class="fas fa-magnifying-glass"></i> <span class="nav-item">검색</span>
			</a></li>
			<li><a href="Write.jsp" class="headers"> <i
					class="fas fa-pen-to-square"></i> <span class="nav-item">게시글작성</span>
			</a></li>
			<li><a href="Mypage.jsp" class="headers"> <i
					class="fas fa-user"></i> <span class="nav-item">프로필</span>
			</a></li>
			<li><a href="LogoutService.do" class="logout headers"> <i
					class="fas fa-sign-out-alt"></i> <span class="nav-item">로그아웃</span>
			</a></li>
		</ul>
	</nav>
	<div align="right">
		<span id="userID">${info.user_id}님 환영합니다.</span>
	</div>
	<div align="center" class="search">
		<!-- 검색창 -->
		<form action="GetSearch.do" autocomplete="" method="post">
			<select name="type" id="searchType">
				<option selected value="">검색내용선택</option>
				<option selected value="hashtag">해시태그</option>
				<option selected value="content">게시글 내용</option>
				<option selected value="goods">상품이름</option>
				<option selected value="nick">닉네임</option>
			</select> 
			<input type="text" name="keyword" class="bar"> 
			<input type="submit" value="&#xf002;">
		</form>

	</div>
	<br>
	<div class="myPage" align=center>
		<c:forEach var="boardRes" items="${contentResult}" varStatus="status">
			
				<p>아이디 : ${boardRes.user_id}</p>
				<p>글 번호 : ${boardRes.post_id}</p>
				<p>이미지 : ${boardRes.post_img}</p>
				<p>게시글 내용 : ${boardRes.post_content}</p>
				<br>
		</c:forEach>
	</div>

</body>
</html>