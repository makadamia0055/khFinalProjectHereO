<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="<c:url value='/resources/js/common/summernote-lite.min.js'></c:url>"></script>
<link href="<c:url value='/resources/css/common/summernote-lite.min.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/community/writingboard.css'></c:url>" rel="stylesheet" />
<main class="writingBoard">
<form action="<c:url value='/community/correct/${bt.bt_namebyEnglish}'></c:url>" method="post" enctype="multipart/form-data" id="writing">		
		<div class="writing-box">
		<input type="hidden" name="bo_num" value="${board.bo_num}" />
		<input type="hidden" name="bo_me_id" value="${board.bo_me_id}" />
		<div class="subject-box">
			<c:if test="${board.bo_region !=null && board.bo_state !=null}">
				<select name="bo_region" class="region subject" form="writing">
					<option value="0">지역</option>
					<c:forEach items="${boardCategory01}" var="bc">
						<option value=${bc.bc_name} <c:if test="${board.bo_region == bc.bc_name}">selected</c:if>>${bc.bc_name}</option>
					</c:forEach>
				</select>
			</c:if>
			<c:if test="${board.bo_region !=null && board.bo_state !=null}">
				<select name="bo_state" class="state subject" form="writing">
					<option value="0">현황</option>
					<c:forEach items="${boardCategory02}" var="bc">
						<option value=${bc.bc_name} <c:if test="${board.bo_state == bc.bc_name}">selected</c:if>>${bc.bc_name}</option>
					</c:forEach>
				</select>
			</c:if>

		</div>	
		<input class="writing-title" type="text" id="title" name="bo_title" value="${board.bo_title}"/>			
		</div>
		<textarea id="content" name="bo_content">${board.bo_content }</textarea>
		<button class="btn-rewritingSubmit">수정</button>
		<a href="<c:url value='/community/delete/${board.bo_num}'></c:url>">
			<button type="button" class="btn-delete">삭제</button>
		</a>
	</form>
      
</main>

<script src="https://kit.fontawesome.com/bedfa56d7f.js" crossorigin="anonymous"></script>
<script>
  $('#content').summernote({
		height: 500,    
		width: 860,
		tabsize: 2,
		lineHeight:0.3,
		minHeight: 500,            
		maxHeight: 500,              
	});
</script>
