<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="<c:url value='/resources/js/common/summernote-lite.min.js'></c:url>"></script>
<link href="<c:url value='/resources/css/common/summernote-lite.min.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/community/writingboard.css'></c:url>" rel="stylesheet" />
<main class="writingBoard">
	<form action="<c:url value=''></c:url>" method="post" enctype="multipart/form-data" id="writing">		
		<div class="writing-box">
		<div class="subject-box">
			<c:if test="${boardCategory01!=null && boardCategory01.size()!=0}">
				<select name="region" class="region subject" form="writing">
					<option value="0">지역</option>
					<c:forEach items="${boardCategory01}" var="bc">
						<option value=${bc.bc_num}>${bc.bc_name}</option>
					</c:forEach>
				</select>
			</c:if>
			<c:if test="${boardCategory01!=null && boardCategory01.size()!=0}">
				<select name="state" class="state subject" form="writing">
					<option value="0">현황</option>
					<c:forEach items="${boardCategory02}" var="bc">
						<option value=${bc.bc_num}>${bc.bc_name}</option>
					</c:forEach>
				</select>
			</c:if>

		</div>	
		<input class="writing-title" type="text" id="title" name="bo_title" placeholder="제목을 입력하세요."/>			
		</div>
		<textarea id="content" name="bo_content"></textarea>
		<button class="btn-writingSubmit">등록</button>
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
		placeholder: '내용을 입력하세요'	    
	});
</script>
