<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>검색페이지</title>
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

nav {
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

.logo {
	text-align: center;
	display: flex;
	transition: all 0.5s ease;
	margin-top: 1rem;
	margin-bottom: 1rem;
	margin-left: 20px;
}

.logo img {
	width: 35px;
	height: 35px;
}

.logo span {
	text-align: center;
	font-weight: bold;
	padding-left: 15px;
	font-size: 18px;
	text-transform: uppercase;
}

a {
	position: relative;
	color: black;
	font-size: 14px;
	display: table;
	width: 300px;
	padding: 10px;
}

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

.nav-item {
	position: relative;
	top: 12px;
	margin-left: 10px;
}

a:hover {
	background: #eee;
}

nav:hover {
	width: 280px;
	transition: all 0.5s ease;
}

.logout {
	position: absolute;
	bottom: 0;
}

.boardList {
	background-color: white;
	width: 1100px;
	height: 50000px;
	margin-left: 500px;
	margin-top: 200px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
}

#modal {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	background: rgba(0, 0, 0, 0.5);
}

#goodsSearch {
	position: absolute;
	background-color: #ffffff;
	width: 500px;
	height: 250px;
	padding: 15px;
}

#modal.hidden {
	display: none;
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
	<nav>
		<ul>
			<li><a href="BoardService.do" class="logo"> <img
					src="./img/logo1.png" alt=""> <span class="nav-item">선물팔레트</span>
			</a></li>
			<li><a href="BoardService.do"> <i class="fas fa-home"></i> <span
					class="nav-item">홈</span>
			</a></li>
			<li><a href="Search.jsp"> <i class="fas fa-magnifying-glass"></i>
					<span class="nav-item">검색</span>
			</a></li>
			<li><a href="Write.jsp"> <i class="fas fa-pen-to-square"></i>
					<span class="nav-item">게시글 작성</span>
			</a></li>
			<li><a href="Mypage.jsp"> <i class="fas fa-user"></i> <span
					class="nav-item">마이페이지</span>
			</a></li>
			<li><a href="LogoutService.do" class="logout"> <i
					class="fas fa-sign-out-alt"></i> <span class="nav-item">로그아웃</span>
			</a></li>
		</ul>
	</nav>
	<div align="center">
		<span id="userID">${info.user_id}님 환영합니다.</span><br>

		<div class="boardList" align=center>
			<form action="BoardWrite.do" method="post">
				<div id="board">
					<table id="list">
						<tr>
							<!-- 작성자id -->
							<td colspan="2"><input type="hidden" name="user_id"
								value="${info.user_id}"></td>
						</tr>
						<tr>
							<td colspan="2">내용</td>
						</tr>
						<tr>
							<!-- 내용 입력 -->
							<td border=1px colspan="2"><textarea name="post_content" cols="55"
									rows="5"></textarea></td>
						</tr>
						<tr>
							<!-- 상품 등록(test) -->
							<td><input type="text" name="goods_id"
								placeholder="상품아이디 테스트"></td>
							<td><button type="button" id="modalOpenButton"
									style="float: right;">상품등록</button></td>
						</tr>
						<div id="modal" class="hidden">
							<!-- 상품등록 모달창(test) -->
							<div id="goodsSearch">
								<div>
									<input type="text" name="goods">
								</div>
								<div>상품 리스트 공간</div>
								<button id="modalCloseButton">닫기</button>
							</div>
						</div>
						<tr>
							<!-- 사진등록(test) -->
							<td><input type="text" name="post_img"
								placeholder="사진등록 테스트"></td>
							<td><input type="file" name="filename" style="float: right;"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="작성완료"></td>
						</tr>
					</table>
				</div>
			</form>
		</div>

		<script>
	const modalOpenButton = document.getElementById('modalOpenButton');
	const modalCloseButton = document.getElementById('modalCloseButton');
	const modal = document.getElementById('modal');

	modalOpenButton.addEventListener('click', () => {
	  modal.classList.remove('hidden');
	});

	modalCloseButton.addEventListener('click', () => {
	  modal.classList.add('hidden');
	});
	</script>
</body>

</html>
</body>

</html>