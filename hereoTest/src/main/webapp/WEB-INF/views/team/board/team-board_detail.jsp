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
				
					<ul class="list-board_write">
						<li class="category">
							<c:forEach items="${categoryList}" var="ct">
								
								<c:if test="${not empty ct && bo.bo_bc_num == ct.bc_num}">${ct.bc_name}</c:if>
							</c:forEach>
						</li>
						<li class="title">
							<dl>
								<dt>제목</dt>
								<dd>
									<div class="title">${board.bo_title }</div>
									<input type="text" name="teamNum" hidden value="${team.tm_num }">
								</dd>
								
							</dl>
						</li>
						<li class="info">
							
							<dl>
								<dt>글쓴이</dt>
								<dd>
									<div name="me_nickname" >
										
									</div>
									<input type="text" hidden name="bo_me_id" value="<c:if test='${not empty loginUser}'>${loginUser.me_id}</c:if>" readonly>
								</dd>
								<dt>작성일</dt>
								<dd>${board.bo_register_date_str }
								</dd>
								<dt>조회수</dt>
								<dd>${board.bo_view }
								</dd>
							</dl>
						</li>
						<li class="cont">
							<div>${board.bo_content }</div>
						
						</li>
						<li class="img-box">
							<c:forEach items="${fileList}" var="file">
								<c:choose>
									<c:when test="${file.fileType== 'image' }">
										<div>
											<img alt="${file.bf_ori_filename }" src="<c:url value='/files${file.bf_filename }'></c:url>"><br>
											<a href="<c:url value='/files${file.bf_filename }'></c:url>" download="${file.bf_ori_filename }">${file.bf_ori_filename } 다운로드</a>
										</div>
									</c:when>
									<c:otherwise>
										<div>
											<a href="<c:url value='/files${file.bf_filename }'></c:url>" download="${file.bf_ori_filename }">${file.bf_ori_filename } 다운로드</a>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</li>
					</ul>
					<div class="btnBox-board">
						<a href="#" class="btn-vote btn-on" data-updown="1">추천</a>
						<a href="#" class="btn-vote" data-updown="0">비추천</a>
					</div>
					<div class="btnBox-board">
						<a role="button" class="btn-submit btn-on">등록</a>
						<a href="./team-sep-board_main.html" class="btn-cancle">취소</a>
					</div>
				
				
			</div>
		</div>
	</section>
</body>
<script>
	 src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    </script>
    <script>
    let wObj = {
    		me_id: "${board.bo_me_id}",
    		teamNum: '${team.tm_num}'
    };
   ajaxParam("post", wObj, "<c:url value='/team/ajax/playerNameAndRank'></c:url>", function(data){
	   $('[name=me_nickname]').html('<span class="badge badge-pill badge-danger">'+data.userTP.tp_auth+'</span>'+ data.userMember.me_nickname)
   })
    
    let isLogin = <c:if test="${loginUser!=null}">1</c:if>+0;
    /* 추천 비추천 버튼 기능 구현 */
    $('.btn-vote').click(function(e){
    	e.preventDefault();
    	if(!isLogin){
    		alert("로그인한 유저만 추천할 수 있습니다.");
    		return;
    	}
    	let updown = $(this).data('updown');
    	<c:if test='${not empty loginUser}'>
	    	let voteObj ={
	    			bv_me_id: '${loginUser.me_id}',
	    			bv_bo_num: ${board.bo_num},
	    			bv_state: updown
	    	}
    	</c:if>
    	ajax("Post", voteObj, "<c:url value='/team/ajax/boardVote'></c:url>", function(data){
    		console.log(data);
    	})
    	    	
    })
    
    
    
    function ajaxParam(method, obj, url, successFunc, errorFunc){
    	$.ajax({
    		async:false,
    		type: method,
    		data: obj,
    		url: url, 
    		dataType: "json",
    		
    		success: successFunc,
    		error: errorFunc
    		
    	});
    }
    function ajax(method, obj, url, successFunc, errorFunc){
		$.ajax({
			async:false,
			type: method,
			data: JSON.stringify(obj),
			url: url, 
			dataType: "json",
			contentType:"application/json; charset=UTF-8",
			success: successFunc,
			error: errorFunc
			
		});
    }
    </script>