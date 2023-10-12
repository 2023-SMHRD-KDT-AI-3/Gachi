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

/* 로고 이미지 커서 올리면 색깔 변함 */
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

/* 사용자가 유지되는지 확인용 */
#userID {
   align-items: right;
}

/* 프로필 흰바탕 */
.myPage {
   background-color: white;
   width: 1100px;
   height: 5000px;
   margin-left: 450px; 
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
   padding-bottom: 0px;
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
    margin-left: 510px;
    margin-bottom: 40px;
   padding: 1px;
   background: #bbb;
   color: #000;
   border-radius: 2px;
   display: flex;
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
   margin-left: 340px;
   margin-bottom: 80px;
}
/* 프로필 수정 위한 버튼 생성 */
.myPage .container .profile .profile_img span button img {
   position: absolute;
   background-color: white;
   width: 30px;
   height: 30px;
   border-radius: 50%;
   bottom: 0.5px;
   right: 11px;
   border: 2px solid #fff;
   margin-bottom: 20px;
}

/* 프로필 사진 수정 모달창 위치*/
#modalPic {
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
/* 프로필 사진 수정 모달창 속성*/
#fix_userPic {
   z-index:1050;
   position: absolute;
   background-color: #ffffff;
   width: 900px;
   height: 450px;
   padding: 15px;
   margin-left: 100px;
}

/* 팝업창 */
#modalPic.hidden {
   display: none;
}

/* 소개글 수정 모달창 위치*/
#modalIntrod {
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
#fix_userIntrod {
   position: absolute;
   background-color: #ffffff;
   width: 900px;
   height: 450px;
   padding: 15px;
   z-index : 100;
   margin-left: 100px;
}

/* 팝업창 */
#modalIntrod.hidden {
   display: none;
}

/* pw, nick, email 수정 모달창 위치*/
#modalPNE {
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
/* pw, nick, email 수정 모달창 속성*/
#fix_userPNE {
   position: absolute;
   background-color: #ffffff;
   width: 900px;
   height: 450px;
   padding: 15px;
   margin-left: 100px;
}

/* 팝업창 */
#modalPNE.hidden {
   display: none;
}

/* 프로필사진 팝업창 제목 크기 */
#fix_userPic p {
   font-size: 30px;
   margin-left: 70px;
   border-bottom: 2px solid black;
   width: 720px;
}

/* 수정버튼 디테일 */
.btn-update {
   position: absolute;
    margin-top: 1rem;
}

/* 수정버튼 디테일 */
.btn-update input {
   background: #000;
   color: #fff;
   padding: 8px;
   font-size: 1rem;
   border-radius: 2px;
   position: fixed;
    margin-left: 330px;
    border: 1px solid black;
}

/* 닫기버튼 */
.btn-update #modalIntrodClose {
   background: #fff;
   border: 1px solid black;
   color: #000;
   padding: 8px;
   font-size: 1rem;
   border-radius: 2px;
   margin-left: 460px;
}

/* 소개글 제목 크기 */
#fix_userIntrod p {
   font-size: 30px;
   margin-left: 70px;
   border-bottom: 2px solid black;
   width: 720px;
}

/* 소개글 창 */
#text-update {
   display: block;
    width: 720px;
    height: 300px;
    padding: 15px;
    box-sizing: border-box;
    border: 1px solid #ddd;
    resize: vertical;
    margin-left: 70px;
    border-radius: 10px;
    margin-top: 1rem;
}

/* 파일 창 */
.url {
    padding: 15px;
}

/* 로고 디테일 */
.fa-user,
.home {
    color: #3F51B5;
    background-color: #eee;
}

/* 자기 메인 피드 전체 */
.main-Feed {
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
.myFeed-row {
   display: flex; 
   flex-wrap: wrap;
   padding-bottom: 0px; 
   padding-top: 0px; 
   position: relative;
   height: 309px;
   margin-bottom: 9px;
   width: 1100px;
}

/* 자기 피드 위치 */
.myFeeds {
   align-items: stretch;
   box-sizing: border-box;
   display: flex;
   flex-direction: row;
   flex-shrink: 0;
   position: relative;
   height: 309px;
   width: 309px;
   margin-bottom: 42px;
   margin-left: 42px;
}

/* 자기 피드 이미지 크기 */
.myFeeds img {
   position: absolute;
   object-fit: cover;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   border: 1px solid #eee;
   border-radius: 5px;
}

/* 본인 게시물 및 좋아요 게시물 표시 */
.container_cols .col-btn {
   display: flex;
   justify-content: center;
   box-sizing: border-box;
   align-items: center;
   box-sizing: border-box;
   border-bottom: 1px solid #818181;
   width: 900px;
   margin-left: 100px;
   letter-spacing: 1px;
   font-size: .75rem;
   border-top-width: 1px;
   margin-bottom: 33px;
}

/* 좋아요 게시물 버튼 */
.likeFeed-btn {
   align-items: center;
   display: flex;
   border-bottom: 2px solid #3F51B5;
   color: #3F51B5;
}

/* 자기 게시물 버튼 */
.myFeed-btn {
   align-items: center;
   display: flex;
   color: #818181;
}

/* 자기 게시물 및 좋아요 게시물 로고 위치 */
.container_cols .col-btn .likeFeed-link .likeFeed-btn i {
   display: flex;
   width: 20px;
   height: 20px;
   margin-top: 0;
   margin-bottom: 0;
}

/* 자기 게시물 및 좋아요 게시물 a태그 크기 */
.container_cols .col-btn a {
   display: flex;
   width: 75px;
   height: 53px;
   padding: 0px;
   margin-right: 60px;
}

/* 좋아요 게시물 버튼 위치 */
.likeFeed-link .likeFeed-btn {
   align-items: center;
   display: flex;
}

/* 자기 게시물 버튼 커서 올리면 글자 색깔 바뀜 */
.myFeed-link .myFeed-btn:hover {
   color: #3F51B5;
   filter: opacity(0.5) drop-shadow(#3F51B5);
   border-bottom: 2px solid #3F51B5;
}

/* 자기 및 좋아요 게시물 로고 위치 */
.col-btn i {
   margin-right: 8px;
   position: inherit;
   margin-left: 5px;
}

/* 좋아요 게시물 글자 위치 */
.likeFeed-link .likeFeed-btn span {
   align-items: center;
   display: flex;
   width: 86px;
}

/* 자기 게시물 로고 크기 */
.fa-table-cells {
    font-size: 20px;
    text-align: center;
}

</style>
</head>
<body>
   <!-- 로고 아이콘 링크 -->
   <link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

   <!-- 사이드 바 코드 -->
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
            <a href="MyBoard.do" id="myFeed1" class="headers home"> 
               <i class="fas fa-user"></i> 
               <span class="nav-item home">프로필</span>
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
   <!-- 마이페이지 코드 -->
   <div class="myPage">
      <div class="container">
         <div class="profile">
            <!-- 프로필 사진 -->
            <div class="profile_img">
               <img src="${userList[1].user_pic}" alt="profile"> 
            </div>
            <!-- 이름 -->
            <h2>${userList[1].user_id}</h2>
            <!-- 인사말/소개 -->
            <div>
               ${info.user_introduction}
            </div>
            <!-- 팔로우 및 게시글 -->
            <ul class="follows">
               <li><span>5,000</span>팔로워</li>
               <li><span>500</span>팔로잉</li>
               <li><span>10</span>게시글</li>
            </ul>
         </div>
         <br>


         <div class="container_cols">
            <!-- 본인 게시물 및 좋아요한 게시물 버튼 -->
            <div class="col-btn">

            </div>

            <!-- 마이페이지 본인 게시글 -->
            <div class="main-Feed">
               <article class="container_board">
                  <div>
                     <div class="myFeed-row">
                        <c:forEach var="myFeed" items="${userList}" varStatus="status">
                           <div class="myFeeds"><img src="${myFeed.post_img}" alt="postbox"></div>
                        </c:forEach>
                     </div>
                  </div>
               </article>
            </div>
            
            <div id="modalPic" class="hidden">
               <!-- 프로필사진 수정 모달창(test) -->
               <div id="fix_userPic">
               <p>프로필사진 수정</p>
                  <form action="FixProfile.do" method="post">
                     <span> 
                     <input type="hidden" name="user_id" value="${info.user_id}"> 
                     <input type="hidden" name="user_pw" value="${info.user_pw}"> 
                     <input type="hidden" name="user_nick" value="${info.user_nick}">
                     <input type="hidden" name="user_email" value="${info.user_email}">
                     <input type="hidden" name="user_introduction" value="${info.user_introduction}"> 
                     <input type="text" name="user_pic" autocomplete="off"> 
                     <input type="submit" value="프로필 사진 수정">
                     <div class="url">
                        <dl>
                            <dt>
                                <dd><input type="text" placeholder="사진 등록" id="pic" name="post_img"></dd>
                                <dd class="url-btn"><input type="file" name="filename" style="float: right;"></dd>
                            </dt>
                        </dl>
                    </div>
                     </span>
                     
                  </form>
                  <button id="modalPicClose">닫기</button>
               </div>
            </div>
            
            <div id="modalIntrod" class="hidden">
               <!-- 소개글 수정 모달창(test) -->
               <div id="fix_userIntrod">
               <p>소개글 수정</p>
                  <form action="FixProfile.do" method="post">
                     <span> 
                     <input type="hidden" name="user_id"   value="${info.user_id}"> 
                     <input type="hidden" name="user_pw" value="${info.user_pw}"> 
                     <input type="hidden" name="user_nick" value="${info.user_nick}">
                     <input type="hidden" name="user_email" value="${info.user_email}">
                     <input type="hidden" name="user_pic" value="${info.user_pic}"> 
                     <textarea name="user_introduction" cols="55" rows="5" autocomplete="off" id="text-update" placeholder="소개글 입력"></textarea> 
                     </span>
                     <div class="btn-update">
                       <input type="submit" value="소개글 수정">
                        <button id="modalIntrodClose">닫기</button>
                     </div>
                  </form>
               </div>
            </div>
            
            <div id="modalPNE" class="hidden">
               <!-- 회원정보 수정 모달창(test) -->
               <div id="fix_userPNE">
                  <form action="FixProfile.do" method="post">
                     <span> 
                     <div><input type="hidden" name="user_id"   value="${info.user_id}"></div> 
                     <div><input type="text" name="user_pw"  placeholder="수정할 비밀번호 입력"></div><br> 
                     <div><input type="text" name="user_nick"  placeholder="수정할 닉네임 입력"></div><br>
                     <div><input type="text" name="user_email"  placeholder="수정할 email 입력"></div><br>
                     <input type="hidden" name="user_pic" value="${info.user_pic}"> 
                     <input type="hidden" name="user_introduction" value="${info.user_introduction}">                      
                     <input type="submit" value="회원정보 수정">
                     </span>
                  </form>
                  <button id="modalPNEClose">닫기</button>
               </div>
            </div>      
         </div>
      </div>
   </div>

   <!-- JS 코드를 쓸 수 있게 해주는 코드 -->
   <script src="https://code.jquery.com/jquery-3.7.1.min.js"
      integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
      crossorigin="anonymous"></script>

   <script>
      // 프로필사진 변경 모달창 버튼
      const modalPicOpen = document.getElementById('modalPicOpen');
      const modalPicClose = document.getElementById('modalPicClose');
      const modalPic = document.getElementById('modalPic');

      modalPicOpen.addEventListener('click', () => {
        modalPic.classList.remove('hidden');
      });

      modalPicClose.addEventListener('click', () => {
        modalPic.classList.add('hidden');
      });
      
      // 소개글 변경 모달창 버튼
      const modalIntrodOpen = document.getElementById('modalIntrodOpen');
      const modalIntrodClose = document.getElementById('modalIntrodClose');
      const modalIntord = document.getElementById('modalIntrod');

      modalIntrodOpen.addEventListener('click', () => {
        modalIntrod.classList.remove('hidden');
      });

      modalIntrodClose.addEventListener('click', () => {
        modalIntrod.classList.add('hidden');
      });
      
      // pw, nick, email 변경 모달창 버튼
      const modalPNEOpen = document.getElementById('modalPNEOpen');
      const modalPNEClose = document.getElementById('modalPNEClose');
      const modalPNE = document.getElementById('modalPNE');

      modalPNEOpen.addEventListener('click', () => {
        modalPNE.classList.remove('hidden');
      });

      modalPNEClose.addEventListener('click', () => {
        modalPNE.classList.add('hidden');
      });
      
      // myPage 이동시 개인피드 출력
      document.getElementById('myFeed1').addEventListener('click', function(e) {   
         e.preventDefault();
        document.getElementById('myForm').submit();
  });
   </script>

</body>
</html>