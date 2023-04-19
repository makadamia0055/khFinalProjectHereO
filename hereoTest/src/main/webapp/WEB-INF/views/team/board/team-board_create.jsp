<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />
  
<link rel="stylesheet" href="<c:url value='/resources/css/common/summernote-bs4.min.css'></c:url>" />
<script src="<c:url value='/resources/js/common/summernote-bs4.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/common/lang/summernote-ko-KR.js'></c:url>"></script>

<section>

		
		<div class="container-board">
			<div class="title-board">
				<strong><i class="fa-solid fa-baseball"></i> &nbsp;팀 게시판</strong>
				<p>${team.tm_name } 팀 게시판입니다.</p>
			</div>
			<div class="box-board_write">
				<form id="boardForm" action="<c:url value='/team/board_write'></c:url>" method="post" enctype="multipart/form-data">
					<ul class="list-board_write">
						<li class="title">
							<dl>
								<dt>제목</dt>
								<dd>
									<input type="text" name="bo_title" placeholder="제목 입력" required>
									<input type="text" name="teamNum" hidden value="${team.tm_num }">
								</dd>
								
							</dl>
						</li>
						<li class="info">
							<dl>
								<dt>말머리</dt>
								<dd>
									<select name="bo_bc_num" class="custom-select">
									    <option selected value="0">말머리를 선택해주세요.</option>
									    <c:forEach items="${categoryList}" var="ct">
									    	<option value="${ct.bc_num}">${ct.bc_name }</option>
									    </c:forEach>
								  	</select>
								
								
								</dd>
							</dl>
							<dl>
								<dt>글쓴이</dt>
								<dd>
									<input type="text" class="form-control-plaintext" name="me_nickname" placeholder="글쓴이 입력" readonly value="<c:if test='${not empty loginUser}'>${loginUser.me_nickname}</c:if>">
									<input type="text" hidden name="bo_me_id" value="<c:if test='${not empty loginUser}'>${loginUser.me_id}</c:if>" readonly>
								</dd>
							</dl>
						</li>
						<li class="cont">
							<textarea id="summernote" name="bo_content"></textarea>
						
						</li>
						<li class="file-box">
							<div class="form-froup">
								<input type="file" name="files" class="form-control-file border">
								<input type="file" name="files" class="form-control-file border">
								<input type="file" name="files" class="form-control-file border">
								
							</div>
						
						</li>
					</ul>
					<button class="btn-hidden" hidden></button>
					<div class="btnBox-board">
						<a role="button" class="btn-submit btn-on">등록</a>
						<a href="./team-sep-board_main.html" class="btn-cancle">취소</a>
					</div>
				</form>	
				
			</div>
		</div>
	</section>
</body>
<script>
	   $('#summernote').summernote({
		lang: 'ko-KR',
        placeholder: '게시글 내용을 입력해주세요.',
        dialogsInBody: true,
        tabsize: 2,
        height: 300
      });
	   

      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    </script>
    <script>
    $('#boardForm').on('submit', function(e) {
  	  
  	  if($('#summernote').summernote('isEmpty')) {
  	    alert('내용을 입력해주세요.');
  	
  	    e.preventDefault();
  	    return false;
  	  }
  	  else if($('[name=bo_bc_num]').val()==0){
  		alert('카테고리를 선택해주세요.');
  		e.preventDefault();
  		return false;
  	 }
    })
    $('.btn-submit').click(function(){
    	$('.btn-hidden').click();
    })
    

    </script>