<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />

<section class="team-board-main ">
	<div class="container-board">
			<div class="title-board">
				<strong><i class="fa-solid fa-baseball"></i>팀 게시판</strong>
				<p>개별 팀 게시판입니다.</p>
			</div>
			<div class="box-board">
					<ul class="list-board">
						<li class="item-board top">
							<div class="num">번호</div>
							<div class="title">제목</div>
							<div class="writer">작성자</div>
							<div class="date">작성일</div>
							<div class="view">조회수</div>
						</li>
						<li class="item-board item">
							<div class="num">4</div>
							<div class="title"><a href="./team-sep-board_view.html" class="">안녕하세요</a></div>
							<div class="writer">김갑수</div>
							<div class="date">2023.02.10</div>
							<div class="view">1</div>
						</li>
						
					</ul>
				<div class="board-pagenation">
					<ul class="pagination">
						<li class="page-item prev"><a href="#" class="page-link">이전</a></li>
						<li class="page-item active"><a href="#" class="page-link">1</a></li>
						<li class="page-item"><a href="#" class="page-link">2</a></li>
						<li class="page-item"><a href="#" class="page-link">3</a></li>
						<li class="page-item next"><a href="#" class="page-link">다음</a></li>
					</ul>
					
				</div>
				<div class="btnBox-board">
					<a href="./team-sep-board_write.html" class="on">글 등록</a>
					<!-- <a href="#" class="">수정</a> -->
				</div>
			</div>
		</div>
	</section>
</body>
<script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
		
</html>