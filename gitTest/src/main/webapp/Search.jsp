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
@import url('https://fonts.googleapis.com/css2?family=Dongle:wght@300;400;700&family=Poppins:wght@400;500;600;700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@800;900&display=swap');

@font-face {
    font-family: 'Cafe24Ssurround';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/* 전체 */
* {
    margin: 0;
    padding: 0;
    outline: none;
    border: none;
    text-decoration: none;
    box-sizing: border-box;
    font-family: "Noto+Sans+KR", sans-serif;
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
    font-size: 15px;
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

#userID {
   align-items: right;
}

/* 프로필 흰바탕 */
.myPage {
   background-color: white;
   width: 1100px;
   height: 5000px;
   margin-left: 450px; 
   margin-top: 10px;
   box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
}

.search form {
   height: 45px;
    justify-content: center;
    display: flex;
    margin-top: 15px;
}

.search .bar {
    border-top: 1px solid #3F51B5;
    border-bottom: 1px solid #3F51B5;
    width: 560px;
    height: 45px;
    margin-top: 8px;
}

#searchType {
   border: 1px solid #3F51B5;
   text-align: center;
   margin-left: 390px;
   margin-top: 8px;
   border-bottom-left-radius: 25px;
   border-top-left-radius: 25px;
   color: #3F51B5;
   height: 45px;
}

input[type="submit"] {
    font-family: FontAwesome;
    width: 45px;
    height: 45px;
    border-bottom-right-radius: 25px;
    border-top-right-radius: 25px;
    background: #fff;
    border-top: 1px solid #3F51B5;
    border-bottom: 1px solid #3F51B5;
    border-right: 1px solid #3F51B5;
    color: #3F51B5;
    margin-top: 8px;
}

.fa-magnifying-glass,
.home {
    color: #3F51B5;
    background-color: #eee;
}
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/* 자기 메인 피드 전체 */
.container {
   flex-direction: column;
   display: flex;
   box-sizing: border-box;
   overflow-y: visible;
   min-width: 0;
   min-height: 0;
   border-bottom-right-radius: 0;
   align-items: stretch;
}

/* 자기 피드 크기 */
.rank-row {
   flex-wrap: wrap;
   position: relative;
   height: 309px;
   width: 1100px;
}

/* 자기 피드 위치 */
.rank-board {
   width: 340px;
   height: 362px;
   margin: 143px 0 0 20px;
   padding-bottom: 0;
}

/* 자기 피드 이미지 크기 */
.rank-board img {
   width: 100%;
   height: 100%;
   border: 1px solid #eee;
   border-radius: 35px;
   cursor: pointer;
}

.rank-board img:hover {
   box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
}

.goods-info {
   display: grid;
   cursor: default
}

.goods-price{
   display: flex;
    font-weight: 700;
    color: #222;
    font-size: 20px;
    line-height: 30px;
    padding-top: 8px;
}

.myPage p {
   text-align: center;
    font-size: 45px;
    color: #3F51B5;
    font-family: "Cafe24Ssurround", sans-serif;
}

.user-id input {
   background: #fff;
   font-size: 16px;
}

.profile-top {
   float: right;
}

.profile-top img {
   border-radius: 50%;
   width: 45px;
    height: 45px;
    border: 1px solid #ddd;
}

.profile-top-img {
   margin-right: 9px;
   margin-top: 6px;
}

#userID {
   font-size: 20px;
   float: right;
   margin-left: 8px;
}

.recsize {
   width: 22px;
    height: 22px;
    margin-left: 18px;
    background: #fff;
}

.likesize {
   width: 22px;
    height: 18px;
    margin-left: 18px;
    background: #fff
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
            <a href="GoodsService.do" class="headers home"> 
               <i class="fas fa-magnifying-glass"></i> 
               <span class="nav-item home">검색</span>
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
   <div class="profile-top">
     <!-- 프로필 사진 -->
     <div class="profile-top-img">
        <img src="./upload/${info.user_pic}" alt="postprofile">
        <span id="userID">${info.user_id}</span>
     </div>
   </div>
   <div align="center" class="search">
      <!-- 검색창 -->
      <form action="GetSearch.do" autocomplete="off" method="post">
         <select name="type" id="searchType">
            <option selected value="hashtag">해시태그</option>
            <option selected value="content">게시글 내용</option>
            <option selected value="goods">상품 이름</option>
            <option selected value="nick">닉네임</option>
            <option selected value="content">카테고리 선택</option>
         </select> 
         <input type="text" name="keyword" class="bar" placeholder="  상품 이름 입력"> 
         <input type="submit" value="&#xf002;">
      </form>
   </div>
   <br>
   
   <div class="myPage">
      <p>제일 인기가 많은 상품!</p>
      <div class="container">
         <!-- 랭킹 상품 -->
         <ul class="rank-row">
            <c:forEach var="Goods" items="${goodsList}" varStatus="status">
                <li class="rank-board ">
                    <span><img src="${Goods.goods_img}" onclick="GoodsBoard(${Goods.goods_id})"></span>
                    <span class="goods-info">
                        <span>${Goods.goods_brand}</span>
                        <strong>${Goods.goods_name}</strong>
                        <span class="goods-price">
                            <span>${Goods.goods_price}</span>
                            <span>원</span>
                        </span>
                    </span>
               </li>
            </c:forEach>
         </ul>
      </div>
     </div>
   <script type="text/javascript">
      // myPage 이동시 개인피드 출력
      document.getElementById('myFeed1').addEventListener('click', function(e) {   
        e.preventDefault();
        document.getElementById('myForm').submit();
   });
      // 해당상품 게시글 출력
      function GoodsBoard(goods_id) {
       // 폼 엘리먼트 생성
       var form = document.createElement("form");
       form.action = "GoodsBoard.do"; // 이동할 페이지의 URL을 여기에 넣으세요
       form.method = "POST"; // POST 또는 GET 메소드를 선택하세요

       // hidden 입력 엘리먼트를 폼에 추가 (goods_id를 전달)
       var input = document.createElement("input");
       input.type = "hidden";
       input.name = "goods_id";
       input.value = goods_id;
       form.appendChild(input);

       // 폼을 문서에 추가하고 자동으로 제출
       document.body.appendChild(form);
       form.submit();
   }

/*       function GoodsBoard(goods_id) {
         alert(goods_id);
          $.ajax({
             url : "GoodsBoard.do",
             type : "post",
             data : {
                goods_id : goods_id
             },
             success : function() {
                window.location.href = "GoodsBoard.";
             },
             error : function() {
                console.log('요청실패 ㅜㅜ');
             }
          });
       } */
   </script>
</body>

</html>