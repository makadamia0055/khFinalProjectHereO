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
			<button class="pre-list_btn">목록 <i class="fa-solid fa-bars"></i>
			</button>
		</a>
		<c:if test="${boardVote==null || boardVote.bv_state !=1}">	
			<button class="like_btn commu-btn" data-updown="1">추천(<span class="count">${detail.bo_up}</span>)<i class="fa-regular fa-thumbs-up"></i></button>
		</c:if>
		<c:if test="${boardVote!=null && boardVote.bv_state==1 }">
			<button class="like_btn commu-btn" data-updown="1" style="background-color:#2155CD">추천(<span class="count">${detail.bo_up}</span>)<i class="fa-regular fa-thumbs-up"></i></button>
		</c:if>
		<c:if test="${boardVote ==null || boardVote.bv_state !=-1}">
			<button class="dislike_btn commu-btn"data-updown="-1">비추천(<span class="count">${detail.bo_down}</span>) <i class="fa-regular fa-thumbs-down"></i></button>
		</c:if>
		<c:if test="${boardVote !=null && boardVote.bv_state ==-1}">
			<button class="dislike_btn commu-btn"data-updown="-1" style="background-color:#FF0032">비추천(<span class="count">${detail.bo_down}</span>)<i class="fa-regular fa-thumbs-down"></i></button>
		</c:if>
		
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
 <script>
 $('.commu-btn').click(function(){
	 if('${user.me_id}'==''){
		 alert("로그인 기능이 필요합니다.");
		 return;
		 }
	 let bv_state=$(this).data('updown');
	 let bo_num='${detail.bo_num}';
	 let url = '<c:url value="/community/content/updown/"></c:url>'+bo_num+'/'+bv_state;
	 
	 $.ajax({
		asyn:true,
		type:'get',
		url:url,
		dataType:"json",
		success : function(data){
				console.log(data);
			$('.like_btn>.count').text(data.board.bo_up);
			$('.dislike_btn>.count').text(data.board.bo_down);
			
			$('.like_btn').css('background-color','');
			$('.dislike_btn').css('background-color','');
			
			if(data.updown==1) {
				alert("추천!");
				$('.like_btn').css('background-color','#2155CD');
			}else if(data.updown == -1){
				alert("비추천!");
				$('.dislike_btn').css('background-color','#FF0032');
				
			}else {
				if(bv_state ==1)
					alert("추천 취소!")
					else
						alert("비추천 취소!")
				  }
			}
			
	 });
 });
 
 </script>