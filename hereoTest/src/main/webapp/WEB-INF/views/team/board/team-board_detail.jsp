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
									<c:when test="${file.fileType== 'image'&& file.bf_issummernote == false}">
										<div>
											<img alt="${file.bf_ori_filename }" src="<c:url value='/files${file.bf_filename }'></c:url>"><br>
											<a href="<c:url value='/files${file.bf_filename }'></c:url>" download="${file.bf_ori_filename }">${file.bf_ori_filename } 다운로드</a>
										</div>
									</c:when>
									<c:when test="${file.fileType== 'image' && file.bf_issummernote == true}">
										<div>
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
							<a href="<c:url value='/team/board_update?teamNum=${team.tm_num }&boNum=${board.bo_num }'></c:url>" class="btn-edit">수정</a>
							<form id="deleteForm" action="<c:url value='/team/board_delete'></c:url>" method="POST">
								<input type="text" name="teamNum" value="${team.tm_num }" hidden readonly>
								<input type="text" name="bo_num" value="${board.bo_num }" hidden readonly>
								<input type="text" name="bo_me_id" value="${loginUser.me_id }" hidden readonly>
								
								<a type="button" class="btn-delete">삭제</a>
							</form>
						</c:if>
					</div>
					<form name="replyForm" class="replyForm" action="<c:url value='/team/board_reply_insert'></c:url>" method="post">
						<div class="input-group mt-3">
							<input type="text" name="br_me_id" hidden readonly value="${loginUser.me_id}">
							<input type="text" name="br_bo_num" hidden value="${board.bo_num }"> 
							<textarea name="br_contents" class="form-control" maxlength="300" placeholder="댓글을 입력해주세요."></textarea>
							<div class="input-group-append">
    							<button class="input-group-text btn btn-secendary">댓글 입력</button>
  							</div>
						</div>
					</form>
					<form name="rereplyForm" style="display:none;" class="ml-3 replyForm" action="<c:url value='/team/board_reply_insert'></c:url>" method="post">
						<div class="input-group mt-3">
							<input type="text" name="br_me_id" hidden readonly value="${loginUser.me_id}">
							<input type="text" name="br_bo_num" hidden readonly value="${board.bo_num}">
							<input type="text" name="br_ori_num" hidden readonly value="0">
							<input type="text" name="br_groupOrd" value="" hidden readonly>
							<input type="text" name="br_toward_num" value="" hidden readonly>
							<input type="text" name="br_groupLayer" value="" hidden readonly>
								 
							<textarea name="br_contents" class="form-control" maxlength="300" placeholder="댓글을 입력해주세요."></textarea>
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
										<span class="nickname">견본</span>
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
    $(document).ready(function(){
    	  $('[data-toggle="tooltip"]').tooltip();
    	});
    /* 필요 객체들 */
    let viewAuth = false;
    <c:if test="${not empty loginUser.me_id}">
    	viewAuth = getAuth('${loginUser.me_id}', ${team.tm_num});
    </c:if>
    
    
    
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
    
    /* 글을 쓴 유저의 랭크와 닉네임을 넣어주는 함수 */
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
	   ajax("POST", cri, "<c:url value='/team/ajax/getReply?boNum="+"${board.bo_num}"+"'></c:url>", function(data){
		   let replyStr =  createReply(data);
		   appendReply(replyStr);
	   })
   }
   /* 리플 문자열을 만드는 메소드 */
   function createReply(data){
	   if(data.replyList == null)
		   return;
	   
	   let replyStr = "";
	   for(let rp of data.replyList){
		   if(rp.br_state=="delete"&&!checkRefReply(data.replyList, rp.br_num)){
			   console.log(1);
			   continue;
		   }
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
		   replyStr += '<li class="list-group mt-2';
		   /* 대댓 마진 레프트 넣어주는 곳 */
		   if(rp.br_ori_num!=rp.br_num)
			   replyStr += ' ml-3 ';
		   
		   replyStr+= '"><div class="list-group-item d-flex justify-content-between list-group-item-secondary align-items-center reply-title">'
			+'<span class="box-nick">'
			+'<span class="badge badge-primary badge-pill">'+auth +'</span>' 
			+'<span class="nickname">'+nickAndRank.userMember.me_nickname+'</span>'
		+'</span>'
		+'<span class="box-date">'+replyDate+'</span>'
	+'</div><div class="list-group-item list-group-item-action reply-contents" data-num="'+rp.br_num +'" data-ori_num="'+rp.br_ori_num +'" data-groupOrd="'+rp.br_groupOrd+'" data-grouplayer="'+rp.br_groupLayer+'">'
	   /* 대댓 @닉네임 넣어주는 곳 */
		if(rp.br_ori_num!=rp.br_num){
		   let oriMeId= getOriMeId(rp.br_toward_num);
		   rereObj ={
				   me_id: oriMeId,
		    		teamNum: ${team.tm_num}	   
		   }
		   reNickAndRank = getPlayerNameAndRank(rereObj)
		replyStr += '<span class="badge badge-pill badge-success">@' +reNickAndRank.userMember.me_nickname + '</span> '
	   }
	/* 댓글 내용 */
	/* 댓글 상태가 n인 것만 출력되도록 */
	if(rp.br_state=="n"){
		replyStr += '<span class="reply-text">'+rp.br_contents +'</span>';
		
		/* 댓글 버튼 넣어주는 곳 */

		if(rp.br_me_id == '${loginUser.me_id}'||viewAuth){
			
			replyStr += '<br><div class="d-flex flex-row-reverse" >'
			+'<button class="btn btn-outline-secondary btn-sm btn-more btn-reply-delete" data-toggle="tooltip" title="댓글 삭제"><i class="fa-solid fa-trash" style="color: #5a5a63;"></i></button>'
			+'<button class="btn btn-outline-secondary btn-sm btn-more btn-reply-edit ml-2" data-toggle="tooltip" title="댓글 수정"><i class="fa-solid fa-gear" style="color: #5a5a63;"></i></button>'
			+'</div>'
			}
		}else if(rp.br_state=="deleted"&&checkRefReply(data.replyList, rp.br_num)){
		   replyStr += '<span class="reply-text delete-reply">삭제된 댓글 입니다.</span>';
		}
		replyStr += '</div></li>'
   }
	 
	   createAndAppendPagination(data);
	   return replyStr;
   }
   /* 댓글의 레퍼런스(자신을 참조하는 대댓이 있는지)가 있는지 살피는 메소드 */
   function checkRefReply(data, num){
	   let res = false;
	   for(let i of data){
		   if(i.br_forward_num == num && i.br_state != "deleted"){
			   res= true;
			   return res;   
		   }
			
	   }
	   return res;
   }
   /* 댓글 페이지네이션 넣어주는 메소드 */
   function createAndAppendPagination(data){
	   let pmStr = "";
	   		if(data.pm.prev)
				pmStr +='<li class="page-item prev"><a href="#" class="page-link" data-page="prev">이전</a></li>';
			
			for(let i = data.pm.startPage; i<data.pm.endPage+1; i++){
				pmStr +='<li class="page-item ';
				
				if(i == data.pm.cri.page){
					pmStr += ' active';
				}
				pmStr += '"><a href="#" class="page-link page-index" data-index="'+ i +'">'
				+ i +'</a></li>'
				
			}
			if(data.pm.next)
				pmStr +='<li class="page-item next"><a href="#" class="page-link">다음</a></li>';
			
			$('.container-pagination .pagination li').remove();
			$('.container-pagination .pagination').append(pmStr);
			
			$('.page-item .page-link').on('click', function(e){
				e.preventDefault();
				if($(this).hasClass('page-index')){
					cri.page = $(this).data('index');
					$('.box-reply').children().remove();
					requestReply();
					return;
				}
			})
   }
   /* 생성된 댓글 문자열을 넣어주는 함수 */
   function appendReply(str){
	   $('.box-reply').text("");
	   $('.box-reply').append(str);
   }
   /* 초기 리플 받아오기 */
   requestReply();
   
   /* 리플창 비회원 거르기 */
   $('.replyForm').click(function(e){
	   if(isLogin!=1){
		   alert('회원만이 댓글을 달 수 있습니다.');
		   $('.btn-on').focus();
		   
		   return;
	   }
   })
   /* 리플 내용 없을때 보내지 않기 */
   $('.replyForm').submit(function(el){
	   let textStr = $(el.currentTarget).find('[name=br_contents]').val();
	   if(textStr.trim().length==0){
		  alert('댓글 내용을 입력해주세요.');
		  $(this).find('[name=br_contents]').focus();
		  return false;
	   }
	   return true;
   })
   /* 댓글창 리사이즈 */
  $(document).on('keydown','[name=br_contents]', replyResize);
 
   function replyResize(){
	   	
	  	$(this).css('height', '1px');
	    $(this).css('height', (12 + $(this).prop('scrollHeight')) + 'px');
   }
   
   /* 리플 클릭시 대댓창 나타나게 */
   $(document).on('click', '.reply-contents', function(e){
	   if(isLogin!=1){
		   alert('로그인 한 회원만 댓글을 달 수 있습니다.');
		   return;
	   }
	   if($(this).find('.reply-text').hasClass('delete-reply')){
		   
		   return;
	   }
	   let rplyForm = $('[name=rereplyForm]');
	   $(rplyForm).show();
	   $(this).parent().append(rplyForm);
	   let dataNum = $(this).data('ori_num');
	   let towardNum = $(this).data('num');
	   let dataGroupOrd = $(this).data('groupord'); 
	   let dataLayer = $(this).data('grouplayer');
	   $(rplyForm).attr("action", "<c:url value='/team/board_reply_insert'></c:url>")

   	   $('[name=br_ori_num]').attr('value', dataNum);
	   $('[name=br_groupOrd]').attr('value', dataGroupOrd);
	   $('[name=br_toward_num]').attr('value', towardNum);
	   $('[name=br_groupLayer]').attr('value', dataLayer+1);
	   
	   
   })
   /* 댓글 수정 작업 */
   $(document).on('click', '.btn-reply-edit', function(e){
	  e.stopPropagation();
  	  let dataNum = $(this).parents('.reply-contents').data('num');
  	  let id= getOriMeId(dataNum);
  	  let manageAuth = getAuth(id, ${team.tm_num});
	
      if(id!='${loginUser.me_id}'&&manageAuth){
    	  alert('관리자는 댓글 삭제만 가능합니다.');
    	  return;
      }else if(id!='${loginUser.me_id}'&&!manageAuth){
    	  alert('자기 자신의 글만 수정 가능합니다.');
    	  return;
      }
      let rplyForm = $('[name=replyForm]');
	   $(rplyForm).show();
	   $('.reply-contents').show();
	   let contents= $(this).parents('.reply-contents');
	   $(contents).hide();
	   $(contents).prev().after(rplyForm);
	   $('.replyForm .input-group [name=br_num]').remove();
	   $('.replyForm .input-group').append('<input type="text" name="br_num" hidden readonly value="'+dataNum+'">');
	   let repText = $(contents).find('.reply-text').text();
	   $(rplyForm).find('[name=br_contents]').text(repText)
	   /* 수정은 ori_num 값을 건드릴 필요는 없음 근데 ori_num에 원 댓글 번호가 자동으로 들어가니
	   그걸 ori_num 대용으로 사용함 => 댓글 구현 형식을 바꾸면서 수정 방식도 바꿈*/
	   $(rplyForm).attr("action", "<c:url value='/team/board_reply_update'></c:url>")
	  	
 
   })
    /* 댓글 삭제 작업 */
    $(document).on('click', '.btn-reply-delete', function(e){
  	  e.stopPropagation();
  	  let dataNum = $(this).parents('.reply-contents').data('num');
  	  let id= getOriMeId(dataNum);
  	  let type = "삭제";
  	  let deleteAuth = getAuth(id, ${team.tm_num});
  	  if(id!='${loginUser.me_id}'&& !deleteAuth){
  		  alert('자신이 쓴 글만 '+type+'할 수 있습니다.');
  		  return;
  	  }
  	  if(type=="삭제"){
  	  	if(confirm('정말 '+type+'하시겠습니까?')){
  	  		let reObj={
  	  				br_num : dataNum
  	  		}
  	  		if(deleteReply(reObj)){
  	  			alert('댓글이 삭제되었습니다.');
	  	  		requestReply();
  	  		}else{
  	  			alert('댓글 삭제에 실패했습니다');
  	  			requestReply();
  	  		}
  	  	}else{
  	  		return;
  	  	}
  	  	
  		  
  	  }

    })
   /* 댓글 삭제 기능 */
   function deleteReply(obj){
	   let res = false;
	   ajaxParam("POST", obj, '<c:url value="/team/ajax/deleteReply"></c:url>', function(data){
		   res = data.res;
	   })
	   return res;
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
    	userAuth =  getUserTeamAuth('${loginUser.me_id}');
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
    function getUserTeamAuth(id){
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
   /* 댓글의 작성자 id 리턴받는 */
    function getOriMeId(num1){
    	let obj1 ={
    			br_ori_num : num1
    	}
    	let res;
    	ajaxParam("POST", obj1, '<c:url value="/team/ajax/getOriMeId"></c:url>', function(data){
    		res= data.me_id;
    	} )
    	return res;
    }
    /* 권한을 리턴하는 함수 */
    function getAuth(me_id, teamNum){
    	let authObj ={
    			me_id : me_id, 
    			tm_num : teamNum
    	}
    	let res=false;
    	ajaxParam("POST", authObj, '<c:url value="/team/ajax/getAuth"></c:url>', function(data){
    		if(data.siteAuth){
    			res=true;
    		}else if(data.tp_auth==4){
    			res=true;
    		}
    		
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