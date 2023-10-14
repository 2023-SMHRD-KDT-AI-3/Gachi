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

/* 상대 게시글 크기 제한 조정 */
.myPage .container .container_cols .container_board {
   display: grid;
   grid-template-columns: repeat(auto-fill, minmax(400px, auto));
   gap: 30px;
}

/* 상대 게시글 크기 조정 */
.myPage .container .container_board .board img {
   object-fit: cover;
   width: 400px;
   height: 400px;
   border-radius: 0.5rem;
   margin-left: 340px;
   margin-bottom: 80px;
}

/* 상대 메인 피드 전체 */
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

/* 상대 피드 크기 */
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

/* 상대 피드 위치 */
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

/* 상대 피드 이미지 크기 */
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
   margin-top: 35px;
}

/* 팔로우 버튼 크기 및 색깔 */
.follow-button {
   background: #3F51B5;
   border-radius: 16px;
   color: #fff;
   padding: 6px 16px;
   outline: none;
   margin-left: 506px;
   width: 90px;
   height: 35px;
}

/* 언팔로우 버튼 크기 및 색깔 */
.followed {
   background: #fff;
   color: #3F51B5;
   border: 1px solid #3F51B5;
   margin-left: 506px;
   width: 90px;
   height: 35px;
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
   margin-left: 26px;
}

#userID {
   font-size: 20px;
   float: right;
   margin-top: 8px;
   margin-left: 8px;
}

.user-welcome {
   margin-right: 35px;
   float: right;
   margin-top: 11px;
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
            <a href="MyBoard.do" id="myFeed1" class="headers"> 
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
        <span class="user-welcome">님 환영합니다!</span>
        <span id="userID">${info.user_id}</span>
     </div>
   </div>
   <!-- 마이페이지 코드 -->
   <div class="myPage">
      <div class="container">
         <div class="profile">
            <!-- 프로필 사진 -->
            <div class="profile_img">
               <img src="./upload/${userList[0].user_pic}" alt="profile"> 
            </div>
            <!-- 이름 -->
            <h2>${userList[0].user_id}</h2>
            <!-- 인사말/소개 -->
            <div>
               ${info.user_introduction}
            </div>
            <!-- 팔로우 및 게시글 -->
            <ul class="follows">
               <li><div id="FollowrOpen"><span>${FollowerCount}명</span><br>팔로워</div></li>
               <li><div id="FollowingOpen"><span>${FolloingCount}명</span><br>팔로잉</div></li>
               <li><span>${postCount}개</span>게시글</li>
            </ul>
         </div>

         <div class="container_cols">
         
            <!-- 팔로우 버튼 -->
	         <c:choose>
				<c:when test="${FollowCheck eq 1}">
					<button class="follow-button"
						onclick="goFollow('${info.user_id}','${userList[0].user_id}')">언팔로우</button>
				</c:when>
				<c:otherwise>													    		
					<button class="follow-button"
						onclick="goFollow('${info.user_id}','${userList[0].user_id}')">팔로우</button>
				</c:otherwise>						      
			</c:choose> 
         
            <!-- 본인 게시물 및 좋아요한 게시물 버튼 -->
            <div class="col-btn">

            </div>
            <!-- 마이페이지 본인 게시글 -->
            <div class="main-Feed">
               <article class="container_board">
                  <div>
                     <div class="myFeed-row">
                        <c:forEach var="myFeed" items="${userList}" varStatus="status">
                           <div class="myFeeds"><img src="./upload/${myFeed.post_img}" alt="postbox"></div>
                        </c:forEach>
                     </div>
                  </div>
               </article>
            </div>
         </div>
      </div>
   </div>

   <!-- JS 코드를 쓸 수 있게 해주는 코드 -->
   <script src="https://code.jquery.com/jquery-3.7.1.min.js"
      integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
      crossorigin="anonymous"></script>

   <script>
   <!-- 팔로우 버튼 기능 -->
   const followBtn = document.querySelectorAll('.follow-button')
   
   followBtn.forEach((btn) => {
      btn.addEventListener('click', (e) => followUnFollow(e.target));
   });
   
   function followUnFollow(button) {
      button.classList.toggle('followed')
      if (button.innerText == '팔로우') button.innerText = '언팔로우';
      else button.innerText = '팔로우';
   }
   
   // 팔로우 ajax
   function goFollow(user_id,following_id){
  	 
  	 $.ajax({
  		url : "FollowService.do",
  		type : "post",
  		dataType : "text",
  		data : {
  			user_id : user_id,
  			following_id : following_id
  		},
  		success : function(resultFollow) {
				if(resultFollow == 0){
					console.log("팔로우O");
				}else{
					console.log("팔로우X");
				}
			},
			error : function() {
				console.log("요청실패!");
			}
  	 })
   }

   </script>

</body>
</html>