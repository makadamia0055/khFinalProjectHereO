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
							<div class="btnBox-board btnBox-vote mb-3">
								<a href="#" class="btn-vote btn-up" data-updown="1">추천<hr><span class="voteNum">${board.bo_up}</span></a>
								<a href="#" class="btn-vote btn-down" data-updown="-1">비추천<hr><span class="voteNum">${board.bo_down}</span></a>
							</div>
						
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
						<a href="<c:url value='/team/board_list?teamNum=${team.tm_num }'></c:url>" class="btn-submit btn-on">목록</a>
						<c:if test="${board.bo_me_id == loginUser.me_id }">
							<a href="./team-sep-board_main.html" class="btn-edit">수정</a>
							<form id="deleteForm" action="<c:url value='/team/board_delete'></c:url>" method="POST">
								<input type="text" name="teamNum" value="${team.tm_num }" hidden readonly>
								<input type="text" name="bo_num" value="${board.bo_num }" hidden readonly>
								<input type="text" name="bo_me_id" value="${loginUser.me_id }" hidden readonly>
								<a type="button" class="btn-delete">삭제</a>
							</form>
						</c:if>
					</div>
					<form>
						<div class="input-group mt-3">
							<textarea class="form-control" placeholder="댓글을 입력해주세요."></textarea>
							<div class="input-group-append">
    							<span class="input-group-text">댓글 입력</span>
  							</div>
						</div>
					</form>
				
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
    let userAuth;
   ajaxParam("post", wObj, "<c:url value='/team/ajax/playerNameAndRank'></c:url>", function(data){
	   $('[name=me_nickname]').html('<span class="badge badge-pill badge-danger">'+data.userTP.tp_auth+'</span>'+ data.userMember.me_nickname);
	   userAuth = data.userTP.tp_auth;
   })

   let isLogin = <c:if test="${loginUser!=null}">1</c:if>+0;
	if(isLogin==1){
		getUserVote();
	}
   
   function getUserVote(){
	   if(isLogin==0)
		   return;
	   let uvObj = {
	    bv_me_id: '${loginUser.me_id}',
		bv_bo_num: ${board.bo_num}
	   }
   	ajax("Post", uvObj, "<c:url value='/team/ajax/getUserVote'></c:url>", function(data){
		$('.btnBox-vote .btn-vote').removeClass('btn-on');
   		if(data.vote.bv_state==1){
   			$('.btnBox-vote .btn-up').addClass('btn-on');
   		}else if(data.vote.bv_state==-1){
   			$('.btnBox-vote .btn-down').addClass('btn-on');
   		}
   	})

   }
    
    /* 추천 비추천 버튼 기능 구현 */
    $('.btn-vote').click(function(e){
    	e.preventDefault();
    	if(!isLogin){
    		alert("로그인한 유저만 추천할 수 있습니다.");
    		return;
    	}
		
    	let updown = $(this).data('updown');
    	let voteStr='';
    	if(updown==1){
			voteStr='추천';
		}else{
			voteStr='비추천';
		}
    	<c:if test='${not empty loginUser}'>
	    	let voteObj ={
	    			bv_me_id: '${loginUser.me_id}',
	    			bv_bo_num: ${board.bo_num},
	    			bv_state: updown
	    	}
    	</c:if>
    	ajax("Post", voteObj, "<c:url value='/team/ajax/boardVote'></c:url>", function(data){
    		
    		if(data.voteRes==1){
    			alert(voteStr + "하였습니다.");
    		}else if(data.voteRes==0){
    			alert(voteStr+ "을 취소하였습니다.");
    		}
    		getUserVote();
    		$('.btnBox-vote .btn-up .voteNum').text(data.boardAfter.bo_up);
    		$('.btnBox-vote .btn-down .voteNum').text(data.boardAfter.bo_down);
    	})
    	    	
    })
    $('.btn-delete').click(function(){
    	$('#deleteForm').submit();
    })
    $('#deleteForm').submit(function(event){
    	console.log('클릭')
    	if(isLogin==0||'${loginUser.me_id}'==null){
    		alert('로그인 회원만 접근할 수 있습니다.');
    		return false;
    	}
    		userAuth =  getUserTeamAuth('${loginUser.me_id}', ${team.tm_num});
    	if('${loginUser.me_id}'!='${board.bo_me_id}'){
    		if(userAuth!=4){
    		alert('자신이 작성한 글만 지울 수 있습니다.');
    		return false;
    		}else{
    			$('#deleteForm').attr("action", "<c:url value='/team/board_deleteAuth'></c:url>")
    			const param_auth = $("<input name='auth' type='text' value='" + userAuth +"' hidden readonly>");
    			$('#deleteForm').append(param_auth);
    			
    		}
    	}
    	return true;
    })
    
    function getUserTeamAuth(id, num){
    	 
    	   ajaxParam("post", wObj, "<c:url value='/team/ajax/playerNameAndRank'></c:url>", function(data){
    		   return data.userTP.tp_auth;
    	   })
    }
    
    
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