<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>검색페이지</title>
<style>
/* 글씨 크기나 모양 */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

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
    height: 800px;
    margin-left: 500px;
    margin-top: 100px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
}

/* 흰바탕이랑 안에 내용 사이 공백 */
.space {
    width: 70px;
    height: 70px;
}

/* 게시글 제목 */
.board-title {
    margin-left: 200px;
}

/* 게시글 제목 글자 */
.board-title strong {
    font-size: 30px;
}

/* 게시글 제목 글자 밑에 글자 */
.board-title p {
    margin-bottom: 10px;
    font-size: 15px;
}

/* 제목이랑 내용 사이 검은 줄 */
.board-write {
    margin-left: 200px;
    width: 700px;
    border-top: 2px solid black;
}

/* 내용 입력 칸 밑 검은줄 */
.info {
    border-bottom: 1px solid black;
}

/* 상품등록, 상품 사진 크기 */
.board-write .item,
.board-write .url {
    padding: 15px;
}

/* 상품 사진 밑 검은줄 */
.board-write .url {
    border-top: 1px dashed #ddd;
    border-bottom: 1px solid black; 
}

/* 내용 입력 크기 */
.info textarea {
    display: block;
    width: 700px;
    height: 300px;
    padding: 15px;
    box-sizing: border-box;
    border: 0px;
    resize: vertical;
}

/* 상품 사진, 상품 등록 위치 조정 및 글자 크기 */
.board-write .url dt,
.board-write .url dd,
.board-write .item dt,
.board-write .item dd {
    display: inline-block;
    vertical-align: middle;
    font-size: 1.4rem;
}

/* 상품 등록 가로 길이 */
.board-write .item dd input {
    width: 500px;
}

/* 상품 사진 가로 길이 */
.board-write .url dd #pic {
    width: 460px;
}

/* 버튼 크기 및 색깔 */
.item-btn {
    display: inline-block;
    min-width: 80px;
    padding: 5px;
    border: 1px solid #000;
    border-radius: 2px;
    font-size: 0.8rem;
    background: #000;
    color: #fff;
    text-align: center;
}

/* 상품 사진 파일 찾기 가로 길이 */
.url-btn input {
    width: 200px;
}

/* 등록, 취소 버튼 조정 */
.btn-wrap {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}

/* 취소 버튼 크기 및 색깔 */
.btn-wrap .on {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #000;
    border-radius: 2px;
    font-size: 1rem;
    color: #000;
}

.btn-wrap a {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #000;
    border-radius: 2px;
    font-size: 1rem;
    color: #000;
}

/* 등록 버튼 위치 조정 */
.btn-wrap:first-child {
    margin-left: 0;
}

/* 등록 버튼 색깔 */
.btn-wrap .on {
    background: #000;
    color: #fff;
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
      crossorigin="anonymous">
   </script>
   <nav class="heads">
      <ul>
         <li>
         	<a href="BoardService.do" class="logo headers"> 
         		<img src="./img/logo1.png" alt=""> 
         		<span class="nav-item">선물팔레트</span>
         	</a>
         </li>
         <li>
         	<a href="BoardService.do" class="headers"> 
         		<i class="fas fa-home"></i> 
         		<span class="nav-item">홈</span>
         	</a>
         </li>
         <li>
         	<a href="GoodsService.do" class="headers"> 
         		<i class="fas fa-magnifying-glass"></i> 
         		<span class="nav-item">검색</span>
         	</a>
         </li>
         <li>
         	<a href="Write.jsp" class="headers"> 
         		<i class="fas fa-pen-to-square"></i> 
         		<span class="nav-item">게시글작성</span>
         	</a>
         </li>
		 <li>
            <a href="#" id="myFeed1" class="headers"> 
               <i class="fas fa-user"></i> 
               <span class="nav-item">프로필</span>
            </a>
            <form id="myForm" action="MyBoard.do" method="post">
            	<input id="myFeed2" type="hidden" name = "user_id" value="${info.user_id}">
            </form>
         </li>
         <li>
         	<a href="LogoutService.do" class="logout headers"> 
         		<i class="fas fa-sign-out-alt"></i> 
         		<span class="nav-item">로그아웃</span>
         	</a>
         </li>
      </ul>
   </nav>
   <div align="right">
      <span id="userID">${info.user_id}님 환영합니다.</span>
   </div>

   <div class="myPage">
        <div class="space">

        </div>
        <form action="BoardWrite.do" method="post">
           <div>
           <input type="hidden" name="user_id" value="${info.user_id}">
           </div>
            <!-- 게시글 제목 -->
            <div class="board-title">
                <strong>게시글 작성</strong>
                <p>게시글을 등록할 수 있는 곳입니다.</p>
            </div>
            <div class="board-wrap">
                <div class="board-write">
                    <!-- 내용 입력 -->
                    <div class="info">
                        <textarea cols="30" rows="10" placeholder="내용 입력" name="post_content"></textarea>
                    </div>
                    <!-- 상품 등록(test) -->
                    <div class="item">
                        <dl>
                            <dt>
                                <dd><input type="text" placeholder="상품아이디 입력" name="goods_id"></dd>
                                <a href="#" class="item-btn" id="modalOpenButton" style="float: right;">상품등록</a>
                            </dt>
                        </dl>
                    </div>
                    <!-- 상품등록 모달창(test) -->
                    <div id="modal" class="hidden">
                  <div id="goodsSearch">
                     <div>
                        <input type="text" name="goods">
                     </div>
                     <div>상품 리스트 공간</div>
                     <button id="modalCloseButton">닫기</button>
                  </div>
               </div>
                    <!-- 사진등록(test) -->
                    <div class="url">
                        <dl>
                            <dt>
                                <dd><input type="text" placeholder="사진 등록" id="pic" name="post_img"></dd>
                                <dd class="url-btn"><input type="file" name="filename" style="float: right;"></dd>
                            </dt>
                        </dl>
                    </div>
                </div>
                <div class="btn-wrap">
                    <input type="submit" value="등록" class="on">
                    <a href="#">취소</a>
                </div>
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

	// myPage 이동시 개인피드 출력
   document.getElementById('myFeed1').addEventListener('click', function(e) {	
 	  e.preventDefault();
   document.getElementById('myForm').submit();
	});
   
   </script>

</body>

</html>