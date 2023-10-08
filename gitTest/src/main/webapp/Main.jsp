<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>선물팔레트</title>
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

a {
	position: relative;
	color: black;
	font-size: 14px;
	display: table;
	width: 300px;
	padding: 10px;
}

* 커서를 올리면 나타나게 하기 * /
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
	align-items: center;
}

/* 프로필 흰바탕 */
.myPage {
	background-color: white;
	width: 1100px;
	height: 5000px;
	margin-left: 500px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
	margin-top: 40px;
}
/* 카테고리 전체 */
.wrap-category {
	display: flex;
	align-items: center;
	margin-left: 570px;
}
/* 카테고리 전체 */
.wrap-category .list-category {
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	list-style: none;
	margin-block-start: 1rem;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	margin-left: 20px;
}
/* 카테고리 사진 */
.wrap-thumb {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100px;
	height: 100px;
	border-radius: 50%;
}
/* 카테고리 간격 */
.wrap-category .list-category .area-thumb {
	margin-left: 200px;
}
/* 카테고리 사진 */
.wrap-thumb img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	object-position: center;
}
/* 카테고리 글자 */
.text-category .text-cate {
	margin-left: 20px;
	font-size: 16px;
	letter-spacing: -.038em;
}

/* 게시글 전체 */
.main-posts {
	grid-template-columns: repeat(auto-fit, minmax(300px, auto));
	gap: 11px;
	margin-left: 300px;
	margin-top: 50px;
}

/* 게시글 박스 크기 */
.post-box {
	width: 480px;
}
/* 게시글 사진 */
.post-box img {
	width: 500px;
	height: 500px;
	object-fit: cover;
	border-radius: 0.5rem;
	margin-right: 10px;
}

/* 프로필이랑 좋아요 댓글 간격 */
.post-info {
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 50px;
}

/* 프로필 위치 */
.post-img {
	height: 50px;
	margin-bottom: 150px;
}

/* 프로필 사진 크기 */
.post-img img {
	margin-top: 80px;
	width: 45px;
	height: 45px;
	border-radius: 50%;
	object-position: center;
}

/* 프로필 사진 위치 */
.post-profile {
	display: flex;
	align-items: center;
	margin-left: 20px;
	height: 50px;
}

/* 사용자 글자 위치 */
.post-profile h3 {
	font-size: 14px;
	font-weight: 600px;
	margin-left: 5px;
}

/* 좋아요, 댓글 조정 */
.likes {
	display: flex;
	align-items: center;
}

/* 좋아요, 댓글 아이콘 조정 */
.likes i {
	font-size: 20px;
	margin-left: 10px;
}

/* 좋아요, 댓글 숫자 크기 */
.likes span {
	font-size: 14px;
	margin-left: 7px;
}

/* 게시글 댓글 */
.detgul {
	margin-top: 10px;
}

/* 게시글이랑 흰바탕 위에 간격 때문에 만듬 */
.myPage1 {
	margin-left: 9000px;
}

/* 카테고리 글자들 설정 */
.text-cate {
	color: black;
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
			<li><a href="BoardService.do" class="headers"> <i class="fas fa-home"></i> <span
					class="nav-item">홈</span>
			</a></li>
			<li><a href="Search.jsp" class="headers"> <i class="fas fa-magnifying-glass"></i>
					<span class="nav-item">검색</span>
			</a></li>
			<li><a href="Write.jsp" class="headers"> <i class="fas fa-pen-to-square"></i>
					<span class="nav-item">게시글 작성</span>
			</a></li>
			<li><a href="Mypage.jsp" class="headers"> <i class="fas fa-user"></i> <span
					class="nav-item">프로필</span>
			</a></li>
			<li><a href="LogoutService.do" class="logout headers"> <i
					class="fas fa-sign-out-alt"></i> <span class="nav-item">로그아웃</span>
			</a></li>
		</ul>
	</nav>
	<div align="center">
		<span id="userID">${info.user_id}님 환영합니다.</span>
	</div>
	<!-- 카테고리들 -->
	<div class="wrap-category">
		<ul class="list-category">
			<!-- 첫번째 줄 1.카테고리 -->
			<li><a href="#" class="link-item"> <span class="area-thumb">
						<span class="wrap-thumb"> <img src="./image/profile.jpg"
							alt="">
					</span>
				</span> <span class="text-category"> <span class="text-cate">카테고리</span>
				</span>
			</a></li>

			<!-- 첫번째 줄 2.카테고리 -->
			<li><a href="#" class="link-item"> <span class="area-thumb">
						<span class="wrap-thumb"> <img src="./image/profile.jpg"
							alt="">
					</span>
				</span> <span class="text-category"> <span class="text-cate">카테고리</span>
				</span>
			</a></li>

			<!-- 첫번째 줄 3.카테고리 -->
			<li><a href="#" class="link-item"> <span class="area-thumb">
						<span class="wrap-thumb"> <img src="./image/profile.jpg"
							alt="">
					</span>
				</span> <span class="text-category"> <span class="text-cate">카테고리</span>
				</span>
			</a></li>

			<!-- 첫번째 줄 4.카테고리 -->
			<li><a href="#" class="link-item"> <span class="area-thumb">
						<span class="wrap-thumb"> <img src="./image/profile.jpg"
							alt="">
					</span>
				</span> <span class="text-category"> <span class="text-cate">카테고리</span>
				</span>
			</a></li>

			<!-- 첫번째 줄 5.카테고리 -->
			<li><a href="#" class="link-item"> <span class="area-thumb">
						<span class="wrap-thumb"> <img src="./image/profile.jpg"
							alt="">
					</span>
				</span> <span class="text-category"> <span class="text-cate">카테고리</span>
				</span>
			</a></li>
		</ul>
	</div>

	<!-- 두번째 줄 1.카테고리 -->
	<div class="wrap-category">
		<ul class="list-category">
			<li><a href="#" class="link-item"> <span class="area-thumb">
						<span class="wrap-thumb"> <img src="./image/profile.jpg"
							alt="">
					</span>
				</span> <span class="text-category"> <span class="text-cate">카테고리</span>
				</span>
			</a></li>

			<!-- 두번째 줄 2.카테고리 -->
			<li><a href="#" class="link-item"> <span class="area-thumb">
						<span class="wrap-thumb"> <img src="./image/profile.jpg"
							alt="">
					</span>
				</span> <span class="text-category"> <span class="text-cate">카테고리</span>
				</span>
			</a></li>

			<!-- 두번째 줄 3.카테고리 -->
			<li><a href="#" class="link-item"> <span class="area-thumb">
						<span class="wrap-thumb"> <img src="./image/profile.jpg"
							alt="">
					</span>
				</span> <span class="text-category"> <span class="text-cate">카테고리</span>
				</span>
			</a></li>

			<!-- 두번째 줄 4.카테고리 -->
			<li><a href="#" class="link-item"> <span class="area-thumb">
						<span class="wrap-thumb"> <img src="./image/profile.jpg"
							alt="">
					</span>
				</span> <span class="text-category"> <span class="text-cate">카테고리</span>
				</span>
			</a></li>

			<!-- 두번째 줄 5.카테고리 -->
			<li><a href="#" class="link-item"> <span class="area-thumb">
						<span class="wrap-thumb"> <img src="./image/profile.jpg"
							alt="">
					</span>
				</span> <span class="text-category"> <span class="text-cate">카테고리</span>
				</span>
			</a></li>
		</ul>
	</div>

	<div class="myPage" align=center>
		<div class="myPage1">1</div>
		<!-- 게시글 전체 -->
		<c:forEach var="board" items="${list}" varStatus="status">
			<div class="main-posts">
				<div class="post-box">
					<!-- 게시글 사진 -->
					<img src="${board.post_img}" alt="postbox">
					<div class="post-info">
						<div class="post-profile">
							<div class="post-img">
								<!-- 프로필 사진 -->
								<img src="${info.user_pic}" alt="postprofile">
							</div>
							<!-- 사용자 아이디 -->
							<h3>${board.user_id}</h3>
						</div>
						<div class="likes">
							<!-- 좋아요 -->
							<i class="fa-regular fa-heart"></i>
							<!-- 좋아요 버튼 -->
							<button type="button" id="BtnLike"
								onclick="goLove('${board.post_id}','${info.user_id}')">
								좋아요
								<!--<c:if test="${resultLike==1}">
						좋아요X
					</c:if>
					<c:if test="${resultLike==0}">
						좋아요O
					</c:if>-->
							</button>
							<!-- 좋아요 숫자 -->
							<span>1.1k</span>
							<!-- 추천 버튼 -->
							<button type="button" id="btn2"
								onclick="goRec('${board.goods_id}','${info.user_id}')">추천</button>
						</div>
						<!-- 댓글 -->
						<i class="fa-regular fa-message"></i>
						<!-- 댓글 숫자 -->
						<span>10</span>
					</div>
				</div>
				<!-- 게시글 글 -->
				<div class="detgul">
					${board.post_content}


					<!-- 댓글 입력, 입력버튼 -->
					<div>
						<textarea id="cmt_content" name="cmt_content" cols="35" rows="1"
							placeholder="댓글 내용" autocomplete="off"></textarea>
						<button type="button"
							onclick="writeCmt('${board.post_id}', '${cmt_content}', '${info.user_id}')">입력</button>
					</div>
					<!-- 댓글 출력 반복문 -->
					<button type="button" onclick="goCmt('${board.post_id}')">댓글보기</button>
					<c:forEach var="cmt" items="${cmtList}" varStatus="status">
						<div>${cmt.cmt_content}</div>
					</c:forEach>
					<br>
				</div>
		</c:forEach>
	</div>
	<script type="text/javascript">
		// 좋아요 ajax
		function goLove(post_id, user_id) {
			//alert(post_id+":"+user_id);
			$.ajax({
				url : "LikeUpdate.do",
				type : "post",
				dataType : "text",
				data : {
					post_id : post_id,
					user_id : user_id
				},
				success : function(resultLike) {
					if (resultLike == 1) {
						console.log("좋아요X"); //1:좋아요삭제 ,0:좋아요추가
						$('#BtnLike').html("좋아요O");
					} else if (resultLike == 0) {
						console.log("좋아요O");
						$('#BtnLike').html("좋아요X");
					}
				},
				error : function() {
					console.log('요청실패 ㅜㅜ');
				}
			})
		}

		// 추천 ajax
		function goRec(goods_id, user_id) {
			// alert("goods_id: "+goods_id+" / user_id: "+user_id);
			$.ajax({
				url : "RecService.do",
				type : "post",
				dataType : "text",
				data : {
					goods_id : goods_id,
					user_id : user_id
				},
				success : function(result) {
					console.log(result); //1:추천삭제 ,0:추천추가
				},
				error : function() {
					console.log('요청실패 ..');
				}
			})
		}

		// 댓글 보기 ajax
		function goCmt(post_id) {
			// alert("goods_id: "+goods_id+" / user_id: "+user_id);
			$.ajax({
				url : "CmtService.do",
				type : "post",
				data : {
					post_id : post_id
				},
				success : function(result) {
					console.log(result); //1:추천삭제 ,0:추천추가
				},
				error : function() {
					console.log('요청실패 ..');
				}
			})
		}

		//				var cmtContent = document.getElementById("cmt_content").value();
		//  댓글작성 ajax
		function writeCmt(post_id, cmt_content, user_id) {
			$.ajax({
				url : "CmtWrite.do",
				type : "post",
				data : {
					post_id : post_id,
					cmt_content : cmt_content,
					user_id : user_id
				},
				success : function(result) {
					console.log(result);
					alert("댓글 성공");
				},
				error : function() {
					console.log('요청실패 ㅜㅜ');
				}
			});
		}
	</script>
</body>

</html>