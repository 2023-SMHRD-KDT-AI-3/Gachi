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
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
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

.user-welcome {
   margin-right: 35px;
   float: right;
   margin-top: 11px;
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
/* 게시글 글자 크기 */
.myPage p {
   text-align: center;
    font-size: 50px;
    color: #3F51B5;
    font-family: "yg-jalnan", sans-serif;
}

/* 카테고리 전체 */
.wrap-category {
   display: flex;
   align-items: center;
   margin-left: 465px;
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
}
/* 카테고리 사진 */
.wrap-thumb {
   display: flex;
   align-items: center;
   justify-content: center;
   height: 50px;
}
/* 카테고리 간격 */
.wrap-category .list-category .area-thumb {
   text-align:center;
}
/* 카테고리 사진 */
.wrap-thumb img {
   height: 50px;
   object-position: center;
}
/* 카테고리 글자 */
.text-category .text-cate {
   font-size: 12px;
   letter-spacing: -.038em;
}

/* 게시글 전체 */
.main-posts {
   margin-top: 30px;
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

/* 좋아요 아이콘 크기 설정 ----------------------- 내가 함 */
.likeimg>.likeimg {
   width: 20px;
   height: 20px;
}

/* 추천 아이콘 크기 설정 ----------------------- 내가 함 */
.recimg>.recimg {
   width: 20px;
   height: 20px;
}

/* 게시글 댓글 */
.detgul {
   margin-top: 10px;
}

/* 카테고리 글자들 설정 */
.text-cate {
   color: black;
}

.link-item {
   text-align:center
}

.lines1 {
   border-radius: 10px;
   width: 550px;
   margin-top: 30px;
   position: relative;
   padding: 1.0em;
}

.lines2 {
   border: 1px solid #ddd;
   border-radius: 10px;
   width: 550px;
   margin-top: 30px;
   position: relative;
   padding: 1.0em;
   width: 550px;
   height: 84px;
}

/* 내용 입력 크기 */
.info textarea {
    display: block;
    width: 450px;
    height: 40px;
    box-sizing: border-box;
    border: 0px;
    resize: none;
    border: 1px solid #ddd;
    border-radius: 10px;
    margin-left: 310px;
}

.info button {
   width: 50px;
   height: 40px;
   background: #3F51B5;
   color: #fff;
   border-radius: 10px;
}

.info {
   display: flex;
}

.more-detgul button {
   width: 70px;
   height: 20px;
   background: #3F51B5;
   color: #fff;
   border-radius: 10px;
   margin-right: -447px;
   margin-top: 10px;
}

.user-id input {
   background: #fff;
   font-size: 20px;
   font-weight: bold;
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

.user-welcome {
   margin-right: 35px;
   float: right;
   margin-top: 11px;
}

.data1 {
   width: 90px;
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
            <option selected value="none">카테고리 선택</option>
         </select> 
         <input type="text" name="keyword" class="bar" placeholder="  상품 이름 입력"> 
         <input type="submit" value="&#xf002;" class="dotbogi">
      </form>
   </div>
   <br>
   
   <!-- 게시글에 대한 결과물 -->
   <div class="myPage" align=center>
   <p>검색한 게시글</p>
      <!-- 게시글 전체 -->
      <div class="main-posts">
         <c:forEach var="boardRes" items="${contentResult}" varStatus="status">
            <br>
            <div class="post-box">
               <!-- 게시글 사진 -->
               <div class="post-profile">
                  <div class="post-img">
                     <!-- 프로필 사진 -->
                     <img src="./upload/${board.user_pic}" alt="postprofile">
                  </div>
                  <c:choose>
                     <c:when test="${info.user_id == boardRes.user_id}">
                        <form action="MyBoard.do" method="post" class="user-id">
                           <!-- 사용자 아이디 -->
                           <input type="hidden" name="user_id" value="${boardRes.user_id}">
                           <input type="submit" value="${boardRes.user_id}">
                        </form>
                     </c:when>
                     <c:otherwise>
                         <form action="UserBoard.do" method="post" class="user-id">
                           <!-- 사용자 아이디 -->
                           <input type="hidden" name="user_id" value="${boardRes.user_id}">
                           <input type="submit" value="${boardRes.user_id}">
                        </form>
                     </c:otherwise>
                  </c:choose>
               </div>
                                 <div>글번호:${boardRes.post_id}</div>
               <br>
               <img src="./upload/${boardRes.post_img}" alt="postbox">
               <div align=left>${boardRes.post_content}</div>
               <div>${board.hashtag_name}</div>
               <div class="post-info">
                  <div class="likes">
                     <!-- 좋아요 -->
                  <c:choose>
                     <c:when test="${board.liked eq 1}">
                        <button type="button" class="likeimg likesize" id="BtnLike" onclick="goLove('${board.post_id}','${info.user_id}')" > 
                           <img id="likeimg${board.post_id}" class="likeimg" src="./img/likeO.png">
                        </button>
                      </c:when>
                      <c:otherwise>                                                 
                        <button type="button" class="likeimg likesize" id="BtnLike"   onclick="goLove('${board.post_id}','${info.user_id}')"> 
                           <img id="likeimg${board.post_id}" class="likeimg" src="./img/likeX.png">
                        </button>
                      </c:otherwise>                        
                  </c:choose>
                  <!-- 추천 이미지 -->
                  <button type="button" class="recimg recsize" id="BtnRec" onclick="goRec('${board.goods_id}','${info.user_id}')"> 
                     <img id="recimg${board.goods_id}" class="recimg" src="./img/RecX.png">
                  </button>
                  </div>
               </div>
            </div>
            <!-- 게시글 글 -->
            <div class="detgul">
               <!-- 댓글 입력, 입력버튼 -->
               <div class="info">
                  <textarea id="comment${boardRes.post_id}" name="comment" cols="35" rows="1"
                     placeholder="댓글 입력" onfocus="placeholder=''" 
                  onblur="placeholder='댓글 입력'" autocomplete="off"></textarea>
                  <button type="button" onclick="writeCmt('${boardRes.post_id}', '${info.user_id}')">입력</button>
               </div>
               <div class="more-detgul">
                  <!-- 댓글 출력 반복문 -->
                  <button type="button" onclick="goCmt('${boardRes.post_id}')">댓글보기</button>
               </div>
               <div id="reply${boardRes.post_id}" class="lines1"></div>
               <c:forEach var="CMT" items="${cmtList}" varStatus="status">
                  <span>${boardRes.user_id}</span>
                  <span>${CMT.cmt_content}</span>
               </c:forEach>
            </div>
         </c:forEach>
      </div>
    </div>
      
      <script type="text/javascript">
      
      // 댓글 보기 ajax
      let reple = true;

      function goCmt(post_id) {
          if (reple) {
              // alert("goods_id: " + goods_id + " / user_id: " + user_id);
              $.ajax({
                  url: "CmtService.do",
                  type: "post",
                  data: {
                      post_id: post_id
                  },
                  dataType: "json",
                  success: function (data) {
                      console.log("요청성공"); // 1:추천삭제 , 0:추천추가
                      // 댓글 출력
                      var html = "<table class='lines2'>";
                      html += "<tr class='detgul-row'>";
                      html += "<td class='data1'>아이디</td>";
                      html += "<td>내용</td>";
                      html += "</tr>";
                      $.each(data, function (index, obj) {
                          html += "<tr class='detgul-row'>";
                          html += "<td class='data1'>" + obj.user_id + "</td>";
                          html += "<td>" + obj.cmt_content + "</td>";
                          html += "</tr>";
                      });
                      html += "</table>";
                      $("#reply" + post_id).html(html);
                      reple = false;
                  },
                  error: function () {
                      console.log('요청실패 ..');
                  }
              });
          } else {
              // 이미 실행되었으므로 내용을 숨기거나 지울 수 있음
              // 예를 들어, 아래와 같이 내용을 지우는 방법
              $("#reply" + post_id).html("");
              reple = true; // 다시 true로 설정하여 다음 클릭 때 실행할 수 있도록 함
          }
      }
      
      
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
                  if (resultLike == 0) {
                     $("#likeimg"+post_id).attr("src", "./img/likeO.png");
                     console.log("좋아요O");
                  } else{
                     $("#likeimg"+post_id).attr("src", "./img/likeX.png");
                     console.log("좋아요X");
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
               if (result == 0) {//1:추천삭제 ,0:추천추가
                  $("#recimg"+goods_id).attr("src", "./img/RecO.png");
                  console.log("추천O");
               } else {
                  $("#recimg"+goods_id).attr("src", "./img/RecX.png");
                  console.log("추천X");
               }
            },
            error : function() {
               console.log('요청실패 ..');
            }
         })
      }

         //  댓글작성 ajax
         function writeCmt(post_id, user_id) {
            var cmt_content=$("#comment"+post_id).val();
            alert(cmt_content);
            $.ajax({
               url : "CmtWrite.do",
               type : "post",
               data : {
                  post_id : post_id,
                  cmt_content : cmt_content,
                  user_id : user_id
               },
               success : function(data) {
                  colsole.log(data);
               },
               error : function() {
                  console.log('요청실패 ㅜㅜ');
               }
            });
         }
         
         // myPage 이동시 개인피드 출력
            document.getElementById('myFeed1').addEventListener('click', function(e) {   
               e.preventDefault();
              document.getElementById('myForm').submit();
        });
      </script>
</body>

</html>