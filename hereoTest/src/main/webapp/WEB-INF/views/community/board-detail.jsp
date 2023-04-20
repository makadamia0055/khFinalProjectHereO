<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/community/board-detail.css'></c:url>" rel="stylesheet" />

<main class="detail-main">

<h3>${detail.bo_title }</h3>
<div class="board-infoContainer">
	<c:if test="${detail.bo_region!=null || detail.bo_state!=null}">
		<div class="board-tagContainer">
			<div class="regionTag commonTag"># ${detail.bo_region }</div>
			<div class="stateTag commonTag"># ${detail.bo_state }</div>
		</div>
	</c:if>
	<c:if test="${detail.bo_bt_num!=2}"><div class="writer">작성자 : ${detail.me_nickname }</div></c:if>
	<div class="board-dataContainer">
		<div class="regiDate">작성일 : ${detail.bo_register_date_str}</div>
		<div class="views">조회수 : ${detail.bo_view }</div>
	</div>
</div>
<div class="board-content_container">
	<div class="board-content">
	${detail.bo_content}
	</div>
	<div class="btn-container">
		<button class="pre-list_btn commu-btn"><a href="<c:url value='/community/${bt.bt_namebyEnglish}'></c:url>">목록 <i class="fa-solid fa-bars"></i></a></button>
		<button class="like_btn commu-btn">추천 <i class="fa-regular fa-thumbs-up"></i></button>
		<button class="dislike_btn commu-btn">비추천 <i class="fa-regular fa-thumbs-down"></i></button>
	</div>
	<c:if test="${user.me_id == detail.bo_me_id }">
		<div class="btn-container02">
			<button class="correct_btn"><a href="<c:url value='/community/correct/${detail.bo_num}'></c:url>">글 수정</a></button>
			<div class="section">|</div>
			<button class="delete-btn">글 삭제</button>
		</div>
	</c:if>	
</div>
<div>댓글</div>
</main>
<script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
 ></script>