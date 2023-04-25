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
		<a href="<c:url value='/community/${bt.bt_namebyEnglish}'></c:url>">
			<button class="pre-list_btn commu-btn">목록 <i class="fa-solid fa-bars"></i>
			</button>
		</a>
		<c:if test="${boardVote==null || boardVote.bv_state !=1}">	
			<button class="like_btn commu-btn" data-updown="1">추천 <i class="fa-regular fa-thumbs-up"></i></button>
		</c:if>
		<c:if test=" ${boardVote!=null && boardVote.bv_state==1 }">
			<button class="like_btn commu-btn" data-updown="1" style="background-color:#2155CD">추천 <i class="fa-regular fa-thumbs-up"></i></button>
		</c:if>
		<button class="dislike_btn commu-btn"data-updown="-1">비추천 <i class="fa-regular fa-thumbs-down"></i></button>
	</div>
	<div class="btn-container02">
		<c:if test="${user.me_id == detail.bo_me_id}">
			<a href="<c:url value='/community/correct/${detail.bo_num}'></c:url>">
				<button class="correct_btn">글 수정</button>
			</a>	
			<div class="section">|</div>
		</c:if>
		<c:if test="${user.me_id == detail.bo_me_id || user.me_siteauth>=9 }">		
			<a href="<c:url value='/community/delete/${detail.bo_num}'></c:url>">
				<button class="delete-btn">글 삭제</button>
			</a>
		</c:if>
	</div>	
</div>
</main>
<script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
 ></script>