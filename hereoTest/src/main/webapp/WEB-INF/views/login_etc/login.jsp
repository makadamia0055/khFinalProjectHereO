<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인</title>
    <link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
    <link href="<c:url value='/resources/css/login_etc/login.css'></c:url>" rel="stylesheet">
	<script
  		src="https://code.jquery.com/jquery-3.6.4.js"
  		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  		crossorigin="anonymous"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/common/click_menu.js'></c:url>"></script>
  </head>
  <body>
    <span class="login-title">Here <i class="fa-solid fa-baseball"></i></span>
    <p class="login-comment">🔒 히어로 로그인 서비스입니다.</p>
    <form action="#">
      <input class="login-input" type="text" placeholder="아이디" /><br />
      <input class="login-input" type="password" placeholder="비밀번호" /><br />
      <div class="id-remember">
        <i class="fa-regular fa-circle-check"></i><span>아이디 저장</span>
      </div>
      <input class="login-btn" type="submit" value="로그인" />
    </form>
    <ul class="search-idPw">
      <li><a href="./find-id.html" target="_self">아이디 찾기</a></li>
      <li>|</li>
      <li><a href="./find-pw.html">비밀번호 찾기</a></li>
      <li>|</li>
      <li><a href="../screen/signup.html" target="_blank">회원가입</a></li>
    </ul>
    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
  