<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="<c:url value='/resources/js/common/summernote-bs4.js'></c:url>"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/community/writingboard.css'></c:url>" rel="stylesheet" />
<main class="writingBoard">
	<form action="<c:url value=''></c:url>" method="post" enctype="multipart/form-data">
		<div>
			<input type="text" id="title" name="bo_title" placeholder="제목을 입력하세요."/>			
		</div>
		<textarea id="content" name="bo_content"></textarea>
	</form>
      
</main>

<script src="https://kit.fontawesome.com/bedfa56d7f.js" crossorigin="anonymous"></script>
<script>
  $('#content').summernote({
		height: 500,                 // 에디터 높이
		minHeight: 350,             // 최소 높이
		maxHeight: 500,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '내용을 입력하세요'	//placeholder 설정       
	});
</script>
