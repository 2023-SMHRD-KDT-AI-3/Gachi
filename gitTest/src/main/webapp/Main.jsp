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

#userID {
	align-items: center;
}

.boardList {
	background-color: white;
	width: 1100px;
	height: 50000px;
	margin-left: 500px;
	margin-top: 200px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
}

.bTest {
	width: 500px;
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
		<span id="userID">${info.user_id}님 환영합니다.</span>
	</div>
	<br>
	<div class="boardList" align=center>
		<c:forEach var="board" items="${list}" varStatus="status">
			<div class="bTest">
				<div>${board.user_id}</div>
				<br>
				<div>
					<img src="${board.post_img}">
				</div>
				<br>
				<div>${board.post_content}</div>
				<br>
				<div>${board.post_id}</div>
				<br>
				<div>
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
					<!-- 추천 버튼 -->
				<button type="button" id="btn2" onclick="goRec('${board.goods_id}','${info.user_id}')">추천</button>
				</div>
				<div>
					<!-- 댓글 입력, 입력버튼 -->
					<input type="text" name="cmt_content" placeholder="댓글 입력 test">
					<button type="button"
						onclick="commentWrite('${board.post_id}','${cmt_content}.val()','${info.user_id}')">입력</button>
				</div>
				<!-- 댓글 출력 반복문 -->
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
		function goRec(goods_id,user_id) {
			 // alert("goods_id: "+goods_id+" / user_id: "+user_id);
				$.ajax({
					url:"RecService.do",
					type:"post",
					dataType : "text",
					data:{
						goods_id : goods_id,
						user_id : user_id
					},
					success: function (result) {
						console.log(result);	//1:추천삭제 ,0:추천추가
					},
					error: function(){
						console.log('요청실패 ..');
					}
				})
			 
		  }
	</script>


</body>

</html>
</body>

</html>