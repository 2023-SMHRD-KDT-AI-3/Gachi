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

#userID{
	align-items: center;}
	
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
	height: 5000px;
}

</style>
</head>

<body>
	<!-- 로고 아이콘 링크 -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
	<div align="center"><span id = "userID">${info.user_id}님 환영합니다.</span></div>
	<br>
	<div class="boardList" align=center>
		<c:forEach var="board" items="${list}" varStatus="status">
			<div class="bTest">
				<div>${board.user_id}</div>
				<br>
				<div>${board.post_content}</div>
				<br>
				<div>${board.post_img}</div>
				<br>
			</div>
		</c:forEach>
	</div>


	<script>
			const boards = document.querySelectorAll('.bTest')
			
			const observer = new IntersectionObserver(entries =>{
				entries.forEach(entry=>{
					entry.target.classList.toggle("show",entry.isIntersecting)
					if(entry.isIntersecting) observer.unobserver(entry.target)
				})
			}, 
			{
				threshold: 1, 
			
			})
			
			const lastBoardObserver = new IntersectionObserver(entries =>{
				const lastBoard = entries[0]
				if(!lastBoard.isInteresting) return
				loadNewBoard()
				lastBoardObserver.unobserve(lastBoard.target)
				lastBoardObserver.observe(document.querySelector(".board:last-child"))
			}, {
				rootMargin:"100px";
			})
			
			lastBoardObserver.observe(document.querySelector(".board:last-child"))
			
			boards.forEach(board=>{
			observer.observe(board)
			})
			
			function loadNewBoard() {
				for(let i = 0;i<10;i++){
					const board= document.createElement("div")
					board.textContent = "New Board"
					board.classList.add("board")
					observer.observe(board)
					boardContainer.append(board)
				}
				
			}
			</script>

</body>

</html>
</body>

</html>