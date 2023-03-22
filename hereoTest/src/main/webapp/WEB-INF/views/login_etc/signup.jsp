<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <link rel="stylesheet" href="../style.css" />
    <link rel="stylesheet" href="../component/bootstrap4/bootstrap.min.css" />
    <script src="../component/bootstrap4/boostrap.bundle.min.js"></script>
    <script src="../component/bootstrap4/popper.min.js"></script>
  </head>
  <body>
    <header class="topBar">
      <div class="topBar__containerBox">
        <!-- 최상단 로그인 메뉴바 -->
        <div class="topBar__containerBox1">
          <ul class="topBar__list">
            <li><a href="#" style="color: black">로그인</a></li>
            <li><a href="#" style="color: black">고객센터</a></li>
          </ul>
        </div>
        <!-- 메인 메뉴바 -->
        <nav class="signUp-topMenu">
          <ul class="menu-containerBox2__bigBox">
            <li class="signUp-topMenu__goMainPage">
              <a href="../mainpage.html" target="_top" id="home"
                >Here <i class="fa-solid fa-baseball"></i
              ></a>
            </li>
          </ul>
        </nav>
      </div>
    </header>
    <main class="signup">
      <div class="container">
        <form action="/action_page.php">
          <div class="signup-container">
            <p class="signUp-dsscription">😎 히어로의 회원가입 페이지입니다.</p>
            <label for="id">아이디 :</label><br />
            <!-- 아이디 중복체크 -->
            <input
              type="text"
              class="signup-id signUp-form"
              id="id"
              name="id"
              required
            />
            <button class="idCheck-btn">중복 확인</button>
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="pw">비밀번호 :</label><br />
            <input
              type="password"
              class="signUp-form"
              id="pw"
              name="pw"
              required
            />
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="pw2">비밀번호 확인 :</label><br />
            <input
              type="password"
              class="signUp-form"
              id="pw2"
              name="pw2"
              required
            />
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="name">이름 :</label><br />
            <input
              type="text"
              class="signUp-form"
              id="name"
              name="name"
              required
            />
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="nik-name">닉네임 :</label><br />
            <input
              type="text"
              class="signUp-form"
              id="nik-name"
              name="nik-name"
              placeholder="커뮤니티 게시판에서 사용할 닉네임을 작성해주세요"
              required
            />
            <span class="valid-letter"></span>
          </div>

          <div class="signup-container">
            <label for="address">주소 :</label><br />
            <input
              type="text"
              class="signUp-form"
              id="address"
              name="address"
              required
            />
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="email">이메일 :</label><br />
            <input
              type="email"
              class="signUp-form"
              id="email"
              name="email"
              required
            />
            <span class="valid-letter"></span>
          </div>
          <div class="signup-container">
            <label for="phone">전화번호 :</label><br />
            <input
              type="text"
              class="signUp-form"
              id="phone"
              name="phone"
              required
            />
            <span class="valid-letter"></span>
          </div>

          <button type="submit" class="signup-btn">회원가입</button>
        </form>
      </div>
    </main>
    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
