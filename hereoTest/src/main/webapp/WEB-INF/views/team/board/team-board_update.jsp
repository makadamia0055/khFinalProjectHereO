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
									<input type="text" name="bo_title" placeholder="제목 입력" required value="${board.bo_title }">
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
									    	<option value="${ct.bc_num}" 
									    		<c:if test="${ct.bc_num == board.bo_bc_num }"> selected</c:if>
									    	>${ct.bc_name }</option>
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
						<input type="text" name="resArr" hidden readonly>
						<input type="text" name="tmpArr" hidden readonly>
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
<script src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	$('#summernote').summernote({
		lang: 'ko-KR',
        placeholder: '게시글 내용을 입력해주세요.',
        dialogsInBody: true,
        tabsize: 2,
        height: 300,
        callbacks : {
        	onImageUpload: function(files, editor, welEditable){
        		for(var i = files.length -1 ; i>=0; i--){
        			sendFile(files[i], this);
        		}
        	}
        }
      });
	   $('#summernote').summernote('code', '${board.bo_content}')
})
	   
	  let tmpImgArr = []; 
	  function sendFile(file, el){
		  var form_data = new FormData();
		  form_data.append('file', file);
		  $.ajax({
			  data:form_data,
			  type:"POST",
			  url: '<c:url value="/ajax/image"></c:url>',
			  cache: false,
			  contentType: false,
			  enctype: 'multipart/form-data',
			  processData: false,
			  success: function(data){
				  let path = '<c:url value="/files"></c:url>';
				  let url = path + data.uploadFile;
				  $(el).summernote('editor.insertImage', url+"?dat_aNum="+data.fileNum);
				  $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
				  tmpImgArr.push(data.fileNum);
			  }
		  })
	  }
	   
	   

      
    </script>
    <script>
    $('#boardForm').on('submit', function(e) {
  	  <c:if test="${empty loginUser}">
  	  alert("로그인 한 유저만 글을 작성할 수 있습니다.");
  	  return false;
  	  </c:if>
    	
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
  	  let resImgArr = checkDataNum();
  	  $('[name=resArr]').val(resImgArr.toString());
  	  $('[name=tmpArr]').val(tmpImgArr.toString());
  	  return true;
    })
    
    $('.btn-submit').click(function(){
    	$('.btn-hidden').click();
    })
  
	function checkDataNum(){
    	let resArr =[];
      	var summernoteContent = $('#summernote').summernote('code');        //썸머노트(설명)
    	const dataNumRegExp=/dat_aNum=[0-9]*/;
        const numRegExp=/[0-9]*/;
        let imgs = $(summernoteContent).find('img');
        for(tmpimg of imgs){
        	let str = $(tmpimg).attr('src')
        	let tmp = str.match(dataNumRegExp)[0];
        	let res = tmp.substr(tmp.indexOf('=')+1);
			resArr.push(res);	        
        
        }
        return resArr;
    }
    
	
    </script>