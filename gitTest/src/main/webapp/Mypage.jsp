<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물팔레트 마이페이지</title>
<style>
/* 글씨 크기나 모양 */
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap')
	;

/* 전체 */
* {
	margin: 0;
	padding: 0;
	outline: none;
	border: none;
	text-decoration: none;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

/* 전체 */
body {
	background: #dfe9f5;
}

/* 왼쪽 바 */
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

/* 프로필 흰바탕 */
.myPage {
	background-color: white;
	width: 1100px;
	height: 5000px;
	margin-left: 500px;
	margin-top: 200px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
}

/* 프로필 사진 위치 조정 */
.myPage .container .profile {
	padding: 25px 20px;
	text-align: center;
	max-width: 350px;
	position: relative;
	margin: 0 auto;
}

/* 프로필 사진 위치 조정 */
.myPage .container .profile .profile_img {
	position: absolute;
	top: -50px;
	left: 50%;
	transform: translateX(-50%);
}

/* 프로필 사진 크기 조정 */
.myPage .container .profile .profile_img img {
	width: 120px;
	height: 120px;
	object-fit: cover;
	border-radius: 50%;
	display: block;
	box-shadow: 1px 3px 12px rgba(0, 0, 0, 0.5);
}

/* 프로필 이름 조정 */
.myPage .container .profile h2 {
	margin-top: 60px;
	font-weight: 600;
	font-size: 22px;
	margin-bottom: 5px;
}

/* 프로필 이름 밑에 인사글 조정 */
.myPage .container .profile p {
	font-size: 0.9rem;
	color: #818181;
	margin: 0;
}

/* 팔로워, 팔로잉, 게시글 조정 */
.myPage .container .profile .follows {
	justify-content: space-between;
	position: relative;
	margin: 35px 0;
}

/* 팔로워, 팔로잉, 게시글 글자만 조정 */
.myPage .container .profile .follows li {
	display: flex;
	flex-direction: column;
	color: #818181;
	font-size: 0.9rem;
}

/* 팔로워, 팔로잉, 게시글 숫자 크기 조정 */
.myPage .container .profile .follows li span {
	color: #1d1d1d;
	font-weight: 600;
}

/* 팔로우 버튼 */
.myPage .container .profile .follows::after {
	position: absolute;
	content: "";
	bottom: -16px;
	display: block;
	background: #ccc;
	height: 1px;
	width: 100%;
}

/* 팔로우 버튼 크기 조정 */
.myPage .container .container_cols button {
	margin-left: 490px;
	margin-bottom: 70px;
}

/* 팔로우 버튼을 누르기전 */
.myPage .container .container_cols .container_followBtn button {
	background: blue;
	color: white;
	border: none;
	width: 120px;
	padding: 10px 25px;
	border-radius: 7px;
	transition: all 0.3s ease-in;
}

/* 버튼 아웃라인 없애기 */
.myPage .container .container_cols .container_followBtn button:active {
	outline: none;
}

/* 버튼 아웃라인 없애기 */
.myPage .container .container_cols .container_followBtn button:visited {
	outline: none;
}

/* 팔로우 버튼을 누룬 후 */
.myPage .container .container_cols .container_followBtn .unfollow {
	background: whitesmoke;
	color: black;
	border: none;
	width: 120px;
	padding: 10px 25px;
	border-radius: 7px;
	transition: all 0.3s ease-in;
}

/* 자기 게시글 크기 제한 조정 */
.myPage .container .container_cols .container_board {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(400px, auto));
	gap: 30px;
}

/* 자기 게시글 크기 조정 */
.myPage .container .container_board .board img {
	object-fit: cover;
	width: 400px;
	height: 400px;
	border-radius: 0.5rem;
	margin-left: 360px;
	margin-bottom: 80px; 
	}
	/* 프로필 수정 위한 버튼 생성 */ 
	.myPage .container .profile .profile_img span a	img { 
	position : absolute;
	background-color: white;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	bottom: 0.5px;
	right: 11px;
	border: 2px solid #fff;
}
</style>
</head>
<body>
	<!-- 로고 아이콘 링크 -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

	<!-- 옆에 바 코드 -->
	<nav class="heads">
		<ul>
			<li><a href="BoardService.do" class="logo headers"> <img
					src="./img/logo1.png" alt=""> <span class="nav-item">선물팔레트</span>
			</a></li>
			<li><a href="BoardService.do" class="headers"> <i
					class="fas fa-home"></i> <span class="nav-item">홈</span>
			</a></li>
			<li><a href="Search.jsp" class="headers"> <i
					class="fas fa-magnifying-glass"></i> <span class="nav-item">검색</span>
			</a></li>
			<li><a href="Write.jsp" class="headers"> <i
					class="fas fa-pen-to-square"></i> <span class="nav-item">게시글
						작성</span>
			</a></li>
			<li><a href="Mypage.jsp" class="headers"> <i
					class="fas fa-user"></i> <span class="nav-item">마이페이지</span>
			</a></li>
			<li><a href="LogoutService.do" class="logout headers"> <i
					class="fas fa-sign-out-alt"></i> <span class="nav-item">로그아웃</span>
			</a></li>
		</ul>
	</nav>

	<!-- 마이페이지 코드 -->
	<div class="myPage">
		<div class="container">
			<div class="profile">
				<!-- 프로필 사진 -->
				<div class="profile_img">
					<img src="./img/앵무새.jpg" alt="profile"> <span><a
						href="#"><img src="./img/plus.png" alt=""></a></span>
				</div>
				<!-- 이름 -->
				<h2>앵무새</h2>
				<!-- 인사말/소개 -->
				<p>조류</p>

				<!-- 팔로우 및 게시글 -->
				<ul class="follows">
					<li><span>5,000</span>팔로워</li>
					<li><span>500</span>팔로잉</li>
					<li><span>10</span>게시글</li>
				</ul>
			</div>

			<div class="container_cols">
				
				<div class="container_followBtn">
					<!-- 팔로우 버튼 -->
					<div class="follow">
						<button>팔로우</button>
					</div>
				</div>

				<!-- 마이페이지 본인 게시글 -->
				<article class="container_board">
					<div>
						<div>
							<div>
								<a href="#" class="board"><img src="./img/앵무새.jpg" alt="게시글"></a>
								<a href="#" class="board"><img src="./img/앵무새.jpg" alt="게시글"></a>
								<a href="#" class="board"><img src="./img/앵무새.jpg" alt="게시글"></a>
							</div>
						</div>
					</div>
				</article>


			</div>
		</div>
	</div>

	<!-- JS 코드를 쓸 수 있게 해주는 코드 -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script>
		// 팔로우 버튼을 클릭을 하면 팔로잉으로 바뀜(왔다갔다함)
		$('button').click(function() {
			$(this).text(function(_, text) {
				return text === "팔로우" ? "팔로잉" : "팔로우";
			});
			if ($(this).text() == "팔로우") {
				$(this).removeClass('unfollow');
			} else if ($(this).text() == "팔로잉") {
				$(this).addClass('unfollow');
			}
		});
	</script>

</body>
</html>