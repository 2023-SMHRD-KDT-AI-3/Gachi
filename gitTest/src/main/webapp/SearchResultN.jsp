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

/* 커서 올리면 선물팔레트 로고 색깔 바뀜 */
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

.dotbogi[type="submit"] {
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
/**/
/* 게시글 글자 크기 */
.myPage p {
   text-align: center;
    font-size: 50px;
    color: #3F51B5;
    font-family: "Dongle", sans-serif;
}

/* 프로필 사진 위치 */
.profile-info {
   display: flex;
   margin-left: 190px;
   align-items: center;
}

/* 프로필 사진 크기 */
.profile-img img {
   width: 80px;
   height: 80px;
   border-radius: 50%;
   border: 1px solid #eee;
}

/* 프로필 사진이랑 닉네임 간격 */
.profile-img {
   margin-right: 30px;
}

/* 아이디 글자 크기 */
.profile-id input {
   font-size: 22px;
   background: #fff;
   font-weight: bold;
}

/* 닉네임 크기 */
.profile-nickname {
   font-size: 12px;
   color: #818181;
   font-style: italic;
   float: left;
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
      <form action="GetSearch.do" autocomplete="off" method="post" class="search1">
         <select name="type" id="searchType">
            <option selected value="hashtag">해시태그</option>
            <option selected value="content">게시글 내용</option>
            <option selected value="goods">상품 이름</option>
            <option selected value="nick">닉네임</option>
            <option selected value="nick">카테고리 선택</option>
         </select> 
         <!-- 검색바랑 돋보기 -->
         <input type="text" name="keyword" class="bar" placeholder="  상품 이름 입력"> 
         <input type="submit" value="&#xf002;" class="dotbogi">
      </form>
   </div>
   <br>
  
  <!-- 닉네임에 대한 결과물 -->
     <div class="myPage" align=center>
      <p>닉네임</p>
        <c:forEach var="nickRes" items="${nickResult}" varStatus="status">
           <div class="profile-info">
              <div class="profile-img"><img src="./upload/${nickRes.user_pic}"></div>
              <div>
                 <div class="profile-id">
                    <c:choose>
                        <c:when test="${info.user_id == nickRes.user_id}">
                           <form action="MyBoard.do" method="post">
                              <!-- 사용자 아이디 -->
                              <input type="hidden" name="user_id" value="${nickRes.user_id}">
                              <input type="submit" value="${nickRes.user_id}">
                           </form>
                        </c:when>
                        <c:otherwise>
                            <form action="UserBoard.do" method="post">
                              <!-- 사용자 아이디 -->
                              <input type="hidden" name="user_id" value="${nickRes.user_id}">
                              <input type="submit" value="${nickRes.user_id}">
                           </form>
                        </c:otherwise>
                     </c:choose>
                 </div>
                 <div class="profile-nickname">${nickRes.user_nick}</div>
              </div>
           </div>
           <br>
        </c:forEach>
       </div>
     
<script type="text/javascript">
   // myPage 이동시 개인피드 출력
   document.getElementById('myFeed1').addEventListener('click', function(e) {   
     e.preventDefault();
     document.getElementById('myForm').submit();
});

</script>
     
</body>

</html>