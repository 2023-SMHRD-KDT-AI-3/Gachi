<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>선물팔레트 로그인</title>
<style>
@import
   url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

* {
   box-sizing: border-box;
}

body {
   background: #dfe9f5;
   display: flex;
   justify-content: center;
   align-items: center;
   flex-direction: column;
   font-family: 'Montserrat', sans-serif;
   height: 100vh;
   margin: -20px 0 50px;
}

h1 {
   font-weight: bold;
   margin: 0;
}

h2 {
   text-align: center;
}

#logo {
   height: 100px;
}

p {
   font-size: 14px;
   font-weight: 100;
   line-height: 20px;
   letter-spacing: 0.5px;
   margin: 20px 0 30px;
}

span {
   font-size: 12px;
}

a {
   color: #333;
   font-size: 14px;
   text-decoration: none;
   margin: 15px 0;
}

button {
    border-radius: 20px;
    border: 1px solid #3F51B5;
    background-color: #3F51B5;
    color: #FFFFFF;
    font-size: 12px;
    font-weight: bold;
    padding: 12px 45px;
    letter-spacing: 1px;
    text-transform: uppercase;
    transition: transform 80ms ease-in;
}

button:active {
   transform: scale(0.95);
}

button:focus {
   outline: none;
}

button.ghost {
   background-color: transparent;
   border-color: #FFFFFF;
}

form {
   background-color: #FFFFFF;
   display: flex;
   align-items: center;
   justify-content: center;
   flex-direction: column;
   padding: 0 50px;
   height: 100%;
   text-align: center;
}

input {
   background-color: #eee;
   border: none;
   padding: 12px 15px;
   margin: 8px 0;
   width: 100%;
}

label {
	font-size: 18px;
	line-height: 2rem;
}

[type="radio"] {
    vertical-align: middle;
    /* appearance: none; */
    border: max(2px, 0.1em) solid gray;
    border-radius: 50%;
    width: 1.25em;
}

fieldset {
    border: 1px solid #FFFFFF;
    margin: -8px 0px;
}

.container {
   background-color: #fff;
   border-radius: 10px;
   box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
      rgba(0, 0, 0, 0.22);
   position: relative;
   overflow: hidden;
   width: 768px;
   max-width: 100%;
   min-height: 480px;
}

.form-container {
   position: absolute;
   top: 0;
   height: 100%;
   transition: all 0.6s ease-in-out;
}

.sign-in-container {
   left: 0;
   width: 50%;
   z-index: 2;
}

.container.right-panel-active .sign-in-container {
   transform: translateX(100%);
}

.sign-up-container {
   left: 0;
   width: 50%;
   opacity: 0;
   z-index: 1;
}

.container.right-panel-active .sign-up-container {
   transform: translateX(100%);
   opacity: 1;
   z-index: 5;
   animation: show 0.6s;
}

@
keyframes show { 0%, 49.99% {
   opacity: 0;
   z-index: 1;
}

50
%
,
100
%
{
opacity
:
1;
z-index
:
5;
}
}
.overlay-container {
   position: absolute;
   top: 0;
   left: 50%;
   width: 50%;
   height: 100%;
   overflow: hidden;
   transition: transform 0.6s ease-in-out;
   z-index: 100;
}

.container.right-panel-active .overlay-container {
   transform: translateX(-100%);
}

.overlay {
    background: #3F51B5;
    background: -webkit-linear-gradient(to right, #5C6BC0, #3F51B5);
    background: linear-gradient(to right, #5C6BC0, #3F51B5);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: 0 0;
    color: #FFFFFF;
    position: relative;
    left: -100%;
    height: 100%;
    width: 200%;
    transform: translateX(0);
    transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
   transform: translateX(50%);
}

.overlay-panel {
   position: absolute;
   display: flex;
   align-items: center;
   justify-content: center;
   flex-direction: column;
   padding: 0 40px;
   text-align: center;
   top: 0;
   height: 100%;
   width: 50%;
   transform: translateX(0);
   transition: transform 0.6s ease-in-out;
}

.overlay-left {
   transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
   transform: translateX(0);
}

.overlay-right {
   right: 0;
   transform: translateX(0);
}

.container.right-panel-active .overlay-right {
   transform: translateX(20%);
}

.social-container {
   margin: 20px 0;
}

.social-container a {
   border: 1px solid #DDDDDD;
   border-radius: 50%;
   display: inline-flex;
   justify-content: center;
   align-items: center;
   margin: 0 5px;
   height: 40px;
   width: 40px;
}

footer {
   background-color: #222;
   color: #fff;
   font-size: 14px;
   bottom: 0;
   position: fixed;
   left: 0;
   right: 0;
   text-align: center;
   z-index: 999;
}

footer p {
   margin: 10px 0;
}

footer i {
   color: red;
}

footer a {
   color: #3c97bf;
   text-decoration: none;
}
</style>
</head>
   <link rel="stylesheet" href="로그인_회원가입.css">

   <link rel="stylesheet" href="로그인_회원가입.css">
<body>

   <h2>
      <img id="logo" src="./img/로고2.png" alt="">
   </h2>
   <div class="container" id="container">
      <div class="form-container sign-up-container">
         <form action="JoinService.do" method="post">
            <h1>회원가입</h1>
            <input type="text" placeholder="아이디를 입력하세요" autocomplete="off" name="id"> <input
               type="password" placeholder="비밀번호를 입력하세요" autocomplete="off" name="pw"> <input
               type="text" placeholder="이름을 입력하세요" autocomplete="off" name="name"> <input
               type="text" placeholder="닉네임을 입력하세요" autocomplete="off" name="nick"> <input
               type="text" placeholder="이메일을 입력하세요" autocomplete="off" name="email"> <span>
               <fieldset>
				<label>
					<input type="radio" name="gender" value="male" id="male"> 
		           	<span>남자</span>
            	</label>
            	<label>
					<input type="radio" name="gender" value="female" id="female"> 
            		<span>여자</span>
            	</label>
            </fieldset>
            </span> <input type="date" name="birth">
            <button>회원가입</button>
         </form>
      </div>
      <div class="form-container sign-in-container">
         <c:if test="${empty info}">
            <form action="LoginService.do" method="post">
               <h1>로그인</h1>
               <input type="text" name="id" placeholder="아이디를 입력해주세요" autocomplete="off"/> <input
                  type="password" name="pw" placeholder="비밀번호를 입력해주세요" autocomplete="off"/> <a
                  href="#">비밀번호찾기</a>
               <button>로그인</button>
            </form>
         </c:if>
         <c:if test="${!empty info}"></c:if>

      </div>
      <div class="overlay-container">
         <div class="overlay">
            <div class="overlay-panel overlay-left">
               <h1>가입을 환영합니다</h1>
               <p>To keep connected with us please login with your personal
                  info</p>
               <button class="ghost" id="signIn">로그인</button>
            </div>
            <div class="overlay-panel overlay-right">
               <c:if test="${empty info}">
                  <h1>로그인을 환영합니다</h1>
                  <p>Enter your personal details and start journey with us</p>
                  <button class="ghost" id="signUp">회원가입</button>
               </c:if>
               <c:if test="${!empty info}">
                  <h1>${info.user_id}님환영합니다</h1>
                  <br>
                  <button class="ghost">
                     <a href="goMain.do">메인</a>
                  </button>
                  <br>
                  <button class="ghost">
                     <a href="LogoutService.do">로그아웃</a>
                  </button>
               </c:if>
            </div>
         </div>
      </div>
   </div>
   <script>
            const signUpButton = document.getElementById('signUp');
            const signInButton = document.getElementById('signIn');
            const container = document.getElementById('container');

            signUpButton.addEventListener('click', () => {
                container.classList.add("right-panel-active");
            });

            signInButton.addEventListener('click', () => {
                container.classList.remove("right-panel-active");
            });
        </script>
</body>

</html>