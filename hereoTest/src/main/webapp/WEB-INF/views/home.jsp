<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/main/mainpage.css'></c:url>" rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="<c:url value='/resources/js/main/main_page.js'></c:url>"></script>
  <main class="main__page">
      <div class="main__imgBox-container">
        <ul class="main__imgBox-container2">
          <li><img src="<c:url value='/resources/img/mainPage/mainImg01.jpg'></c:url>" /></li>
          <li>
            <img
              src="<c:url value='/resources/img/mainPage/mainImg02.jpg'></c:url>"
            />
          </li>
          <li>
            <img
              src="<c:url value='/resources/img/mainPage/mainImg03.avif'></c:url>"
            />
          </li>
          <li>
            <img
              src="<c:url value='/resources/img/mainPage/mainImg04.jpg'></c:url>"
            />
          </li>
        </ul>
      </div>
      <div class="main__contents-container">
        <div class="main__contents-reservationAndCommu">
          <div class="main__contents-reservation">
            <div class="reservation-title">빠르고 간편하게!</div>
            <div class="reservation-mainTitle">
              야구장 쉽게 예약하기<a href="#"
                ><span style="color: #e0144c" class="letter-click"
                  >CLICK!</span
                ></a
              >
            </div>
          </div>
          <div class="main__contents-commu">
            <div class="commu-mainTitle">
              야구계
              <a href="community/commu-market.html"
                ><span style="color: #fd841f">" Carrot Market "</span></a
              >
            </div>
            <i class="fa-solid fa-carrot"></i>
          </div>
        </div>
      </div>
    </main>
    <section class="team-section menu-section">
      <h2>New Team</h2>
      <div class="newTeam-container">
        <div class="newTeam__list"><a href="#">준비중</a></div>
        <div class="newTeam__list"><a href="#">준비중</a></div>
        <div class="newTeam__list"><a href="#">준비중</a></div>
      </div>
      <div class="newTeam__more"><a href="#">더보기</a></div>
    </section>
    <section class="commu-section menu-section">
      <div class="commu__issue">
        <h2>실시간 🔥이슈</h2>
        <ul class="commu__issue-contents">
          <li><a href="#">🔥ABC 가나다 마바사</a></li>
          <li><a href="#">🔥DEF 가나다 마바사</a></li>
          <li><a href="#">🔥GHI 가나다라마바사</a></li>
          <li><a href="#">🔥GHI 가나다라마바사아</a></li>
        </ul>
      </div>
      <div class="commu__find">
        <h2>📣 이번 달에 경기할 팀 찾아요</h2>
        <ul class="commu__find-contents">
          <li><img src="<c:url value='/resources/img/team/강아지.png'></c:url>" class="commu__find-img" /></li>
          <li><img src="<c:url value='/resources/img/team/돼지.png'></c:url>" class="commu__find-img" /></li>
          <li><img src="<c:url value='/resources/img/team/고양이 로고.png'></c:url>" class="commu__find-img" /></li>
          <li><img src="<c:url value='/resources/img/team/돼지.png'></c:url>" class="commu__find-img" /></li>
        </ul>
      </div>
    </section>
    <footer>
      <ul class="footer-menu__container">
        <li class="footer-menu__list">Here O</li>
        <li class="footer-menu__list"><a href="#">개인정보 처리방침</a></li>
        <li class="footer-menu__list"><a href="#">이용약관</a></li>
        <li class="footer-menu__list"><a href="#">고객센터</a></li>
      </ul>
      <ul class="footer__info">
        <li>히어로 주식회사</li>
        <li class="footer__info-git">공승배 : <a href="#">깃주소</a></li>
        <li class="footer__info-git">권용현 : <a href="#">깃주소</a></li>
        <li class="footer__info-git">김지우 : <a href="#">깃주소</a></li>
        <li class="footer__info-git">임상신 : <a href="#">깃주소</a></li>
      </ul>
    </footer>
    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>