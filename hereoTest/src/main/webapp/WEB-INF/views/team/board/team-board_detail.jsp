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
						<c:if test="${board.bo_me_id == loginUser.me_id||team.tm_me_id==loginUser.me_id }">
							<a href="./team-sep-board_main.html" class="btn-edit">수정</a>
							<form id="deleteForm" action="<c:url value='/team/board_delete'></c:url>" method="POST">
								<input type="text" name="teamNum" value="${team.tm_num }" hidden readonly>
								<input type="text" name="bo_num" value="${board.bo_num }" hidden readonly>
								<input type="text" name="bo_me_id" value="${loginUser.me_id }" hidden readonly>
								<a type="button" class="btn-delete">삭제</a>
							</form>
						</c:if>
					</div>
					<form name="replyForm" action="<c:url value='/team/board_reply_insert'></c:url>" method="post">
						<div class="input-group mt-3">
							<input type="text" name="br_me_id" hidden readonly value="${loginUser.me_id}">
							<input type="text" name="br_bo_num" hidden readonly value="${board.bo_num }"> 
							<textarea name="br_contents" class="form-control" placeholder="댓글을 입력해주세요."></textarea>
							<div class="input-group-append">
    							<button class="input-group-text btn btn-secendary">댓글 입력</button>
  							</div>
						</div>
					</form>
					<form name="rereplyForm" style="display:none;" class="ml-3" action="<c:url value='/team/board_reply_insert'></c:url>" method="post">
						<div class="input-group mt-3">
							<input type="text" name="br_me_id" hidden readonly value="${loginUser.me_id}">
							<input type="text" name="br_bo_num" hidden readonly value="${board.bo_num }">
							<input type="text" name="br_ori_num" hidden readonly value="0"> 
							<textarea name="br_contents" class="form-control" placeholder="댓글을 입력해주세요."></textarea>
							<div class="input-group-append">
    							<button class="input-group-text btn btn-secendary">댓글 입력</button>
  							</div>
						</div>
					</form>
					<div class="container-reply">
						<ul class="mt-3 box-reply">
							<li class="list-group">
								<div class="list-group-item d-flex justify-content-between list-group-item-secondary align-items-center">
									<span class="box-nick">
										<span class="badge badge-primary badge-pill">4</span> 
										<span class="nickname">맘모스쌈바돼지</span>
									</span>
									<span class="box-date">2023-03-23</span>
								</div>
								<div class="list-group-item d-flex">
									댓글 내용입니다.
								</div>
							</li>
						</ul>
					
					</div>
					<div class="container-pagination mt-3">
						<ul class="pagination justify-content-center">
						</ul>
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
    /* 필요 객체들 */
    let wObj = {
    		me_id: "${board.bo_me_id}",
    		teamNum: '${team.tm_num}'
    };
    let cri = {
    		page:1,
    		perPageNum:10
    }
    let userAuth;
    /* 글 쓴 유저의 랭크와 닉네임을 받아오는 함수*/
    function getPlayerNameAndRank(obj){
    	let res;
    	ajaxParam("post", obj, "<c:url value='/team/ajax/playerNameAndRank'></c:url>", function(data){
    		res= data;
    	})
    	return res;
    }
    
   function setBoardNickAndRank(data){
	   if(data.userTP==null){
		   $('[name=me_nickname]').html('<span class="badge badge-pill badge-secondary">'+'손님'+'</span>'+ data.userMember.me_nickname);
		   userAuth = 0;
		   return ;
	   }
	   
	   $('[name=me_nickname]').html('<span class="badge badge-pill badge-danger">'+data.userTP.tp_auth+'</span>'+ data.userMember.me_nickname);
	   userAuth = data.userTP.tp_auth;
   }
   setBoardNickAndRank(getPlayerNameAndRank(wObj));

   /* 유저 로그인 여부  */
   let isLogin = <c:if test="${loginUser!=null}">1</c:if>+0;
	if(isLogin==1){
		getUserVote();
	}
   /* 유저의 추천 정보를 가져오는 함수 */
   function getUserVote(){
	   if(isLogin==0)
		   return;
	   let uvObj = {
	    bv_me_id: '${loginUser.me_id}',
		bv_bo_num: ${board.bo_num}
	   }
   	ajax("Post", uvObj, "<c:url value='/team/ajax/getUserVote'></c:url>", function(data){
		if(data.vote==null)
			return;
   		$('.btnBox-vote .btn-vote').removeClass('btn-on');
   		if(data.vote.bv_state==1){
   			$('.btnBox-vote .btn-up').addClass('btn-on');
   		}else if(data.vote.bv_state==-1){
   			$('.btnBox-vote .btn-down').addClass('btn-on');
   		}
   	})

   }
   /* 댓글 불러오기 ajax */
   function requestReply(){
	   let replyObj={
			   bo_num : ${board.bo_num},
			   cri : cri
	   };
	   ajax("POST", replyObj, "<c:url value='/team/ajax/getReply?boNum="+"${board.bo_num}"+"'></c:url>", function(data){
		   let replyStr=  createReply(data);
		   appendReply(replyStr);
	   })
   }
   function createReply(data){
	   if(data.replyList == null)
		   return;
	   
	   let replyStr = "";
	   for(let rp of data.replyList){
		   wObj ={
				   me_id: rp.br_me_id,
		    		teamNum: ${team.tm_num}	   
		   }
		   let nickAndRank = getPlayerNameAndRank(wObj);
		   let auth = '손님';
		   if(nickAndRank.userTP!=null)
			   auth = nickAndRank.userTP.tp_auth;
		   let replyDate = rp.br_register_date_str2;
		   if(rp.br_update_date_str2 !=null)
			   replyDate =rp.br_update_date_str2; 
		   replyStr += '<li class="list-group mt-2"><div class="list-group-item d-flex justify-content-between list-group-item-secondary align-items-center reply-title">'
			+'<span class="box-nick">'
			+'<span class="badge badge-primary badge-pill">'+auth +'</span>' 
			+'<span class="nickname">'+nickAndRank.userMember.me_nickname+'</span>'
		+'</span>'
		+'<span class="box-date">'+replyDate+'</span>'
	+'</div><div class="list-group-item list-group-item-action d-flex reply-contents" data-num="'+rp.br_num +'">'
		+ rp.br_contents
	+'</div></li>'
	   }
	   
	   createAndAppendPagination(data);
	   return replyStr;
   }
   function createAndAppendPagination(data){
	   let pmStr = "";
	   		if(data.pm.prev)
				pmStr +='<li class="page-item prev"><a href="#" class="page-link">이전</a></li>';
			
			for(let i = data.pm.startPage; i<data.pm.endPage+1; i++){
				pmStr +='<li class="page-item ';
				
				if(i == data.pm.cri.page){
					pmStr += ' active';
				}
				pmStr += '"><a href="#" class="page-link">'
				+ i +'</a></li>'
				
			}
			if(data.pm.next)
				pmStr +='<li class="page-item next"><a href="#" class="page-link">다음</a></li>';
			
			$('.container-pagination .pagination li').remove();
			$('.container-pagination .pagination').append(pmStr);
			
   }
   function appendReply(str){
	   $('.box-reply').text("");
	   $('.box-reply').append(str);
   }
   /* 초기 리플 받아오기 */
   requestReply();
   
   $(document).on('click', '.reply-contents', function(e){
	   let rplyForm = $('[name=rereplyForm]');
	   $(rplyForm).show();
	   $(this).parent().append(rplyForm);
	   let dataNum = $(this).data('num');
	  
	   $('[name=br_ori_num]').val(dataNum)
	   
	   
   })
   
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
    /* 삭제 버튼을 post로 보내기 위한 함수 */
    $('.btn-delete').click(function(){
    	$('#deleteForm').submit();
    })
    /* 삭제 버튼 작업 */
    $('#deleteForm').submit(function(event){
    	console.log('클릭')
    	if(isLogin==0||'${loginUser.me_id}'==null){
    		alert('로그인 회원만 접근할 수 있습니다.');
    		return false;
    	}
    	/* 글쓴이 자신 혹은 관리자만 지울 수 있게 */
    	userAuth =  getUserTeamAuth('${loginUser.me_id}', ${team.tm_num});
    	if('${loginUser.me_id}'!='${board.bo_me_id}'){
    		console.log(userAuth);
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
    /* 유저의 권한만 받아오는 함수 */
    function getUserTeamAuth(id, num){
    		let uObj = {
    				me_id: "${loginUser.me_id}",
    	    		teamNum: '${team.tm_num}'
    		} 	
    		let res;
    	   ajaxParam("post", uObj, "<c:url value='/team/ajax/playerNameAndRank'></c:url>", function(data){
    		   res= data.userTP.tp_auth;
    	   })
    	   return res; 
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