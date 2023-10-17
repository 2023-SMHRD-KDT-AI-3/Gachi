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
    padding-bottom: 20px;
}

/* 선물팔레트 로고 크기 조정 */
.logo img {
    width: 35px;
    height: 35px;
    margin-left: 20px;
    margin-top: 10px;
}

/* 선물팔레트 글자 조정 */
.logo span {
    padding-left: 15px;
    font-weight: bold;
    font-size: 20px;
    position: absolute;
    margin-top: 12px;
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
   color: #3F51B5;
   filter: opacity(0.5) drop-shadow(#3F51B5);
}

.logo img:hover {
   filter: invert(26%) sepia(32%) saturate(3440%) hue-rotate(215deg) brightness(97%) contrast(86%);
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
    height: 688px;
    margin-left: 450px;
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
    color: #3F51B5;
    font-size: 30px;
}

/* 게시글 제목 글자 밑에 글자 */
.board-title p {
    margin-bottom: 10px;
    font-size: 15px;
    color: #3F51B5;
}

/* 제목이랑 내용 사이 검은 줄 */
.board-write {
    margin-left: 200px;
    width: 700px;
    border-top: 2px solid #3F51B5;
}

/* 내용 입력 칸 밑 검은줄 */
.info {
    border-bottom: 1px solid #3F51B5;
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
    height: 350px;
    padding: 15px;
    box-sizing: border-box;
    border: 0px;
    resize: none;
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
    border: 1px solid #3F51B5;
    border-radius: 2px;
    font-size: 0.8rem;
    background: #000;
    color: #3F51B5;
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
    border: 1px solid #3F51B5;
    border-radius: 2px;
    font-size: 1rem;
    color: #3F51B5;
}

.btn-wrap a {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #3F51B5;
    border-radius: 2px;
    font-size: 1rem;
    color: #3F51B5;
}

/* 등록 버튼 위치 조정 */
.btn-wrap:first-child {
    margin-left: 0;
}

/* 등록 버튼 색깔 */
.btn-wrap .on {
    background: #3F51B5;
    color: #fff;
}

.fa-pen-to-square,
.home {
    color: #3F51B5;
    background-color: #eee;
}
/* 사진등록 모달창 위치*/
#modalGoods {
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
/* 소개글 수정 모달창 속성*/
#update_Goods {
   position: absolute;
   background-color: #ffffff;
   width: 900px;
   height: 450px;
   padding: 15px;
   z-index: 100;
   margin-left: 100px;
   overflow: auto;
}


/* 팝업창 */
#modalGoods.hidden {
   display: none;
}

.profile-top {
   position: absolute;
    top: 22px;
    left: 82%;
    transform: translateX(5%);
}

.profile-top img {
   border-radius: 50%;
   width: 45px;
    height: 45px;
    border: 1px solid #ddd;
}

.profile-top-img {
    margin-left: 216px;
}

#userID {
   font-size: 20px;
   float: right;
   margin-top: 8px;
   margin-left: 8px;
}

#modalOpenButton {
   padding: 4px;
    color: #fff;
    background: #3F51B5;
    margin-bottom: 10px;
}

.url-btn input {
    margin-left: 221px;
}

.board-url {
   display: flex;
    margin-top: 30px;
    margin-left: 218px;
}

#goods_selected {
	margin-left: 215px;
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
            <a href="Write.jsp" class="headers home"> 
               <i class="fas fa-pen-to-square"></i> 
               <span class="nav-item home">게시글작성</span>
            </a>
         </li>
       <li>
             <form id="myForm" action="MyBoard.do" method="post">
                <input id="myFeed2" type="hidden" name = "user_id" value="${info.user_id}">
             </form>
             <a href="#" id="myFeed1" class="headers"> 
                 <i class="fas fa-user"></i> 
                 <span class="nav-item">프로필</span>
             </a>
         </li>
         <li>
            <a href="LogoutService.do" class="logout headers"> 
               <i class="fas fa-sign-out-alt"></i> 
               <span class="nav-item">로그아웃</span>
            </a>
         </li>
      </ul>
   </nav>
   <div class="profile-top">
     <!-- 프로필 사진 -->
     <div class="profile-top-img">
        <img src="./upload/${info.user_pic}" alt="postprofile">
        <span id="userID">${info.user_id}</span>
     </div>
   </div>
      <div class="myPage">
         <div class="space"></div>
           
      </div>


</body>

</html>