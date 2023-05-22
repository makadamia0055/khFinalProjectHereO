<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />
<link	rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<script src="/hereoTest/resources/js/common/jquery.validate.min.js"></script>

<style>
	dialog{
		padding: 50px;
		margin: auto;
		border-radius: 30px;
		
	}
</style>
<section class="teammain-main">
		<div class="teammain-leftbox">
			<!-- 지역 리스트 -->
			<div class="left1-nav-container clear-fix">
				<div class="container-region">
					<ul class="list-region clear-fix">
						<li class="item-region">
							<a href="<c:url value='/team/main?type=0'></c:url>" class="link-region btn btn-success" role="button" data-local="all">전체</a>
						</li>
						<c:forEach items="${region}" var="re">
							<li class="item-region">
								<a href="<c:url value='/team/main?type=${re.re_num}&search=${pm.cri.search }'></c:url>" class="link-region btn btn-primary" role="button" data-local="${re.re_num}">${re.re_sido}</a>
							</li>
						</c:forEach>
						
					</ul>
				</div>
				<!-- 지역 리스트 끝 -->
				<form method="get" action="<c:url value='/team/main?type=${re.re_num}&search=${pm.cri.search }'></c:url>">
					<div class="group-search-team input-group col-sm-3">
						<input type="text" class="form-control " name="search" id="search-team" placeholder="팀 검색" value="${pm.cri.search }">
						<div class="input-group-append">
							<button class="btn btn-success">검색</button>
						</div>
					</div>
				</form>
			</div>
				<!-- 팀 리스트 -->
			<div class="container-teambox">
				<ul class="list-teambox" id="teamList">
				<!-- c:forEach 시작 -->
					<c:if test="${empty teamList}"><div class="">검색 기록이 없습니다.</div></c:if>
					<c:forEach items="${teamList}" var="team">
						<li class="item-teambox">
							<div class="left-teambox">
								<a href="<c:url value='/team/sep?teamNum=${team.tm_num}'></c:url>" style="background-image: url(
									<c:choose>
										<c:when test="${empty team.tm_team_img}">
											<c:url value='/files/defaultlogo.png'></c:url>
										</c:when>
										<c:otherwise>
											<c:url value='/files${team.tm_team_img}'></c:url>
										</c:otherwise>
									</c:choose>
									
								);" class="link-team-select rounded-circle clear-fix">
									<div class="label-team">
										<span class="team-local badge badge-success">${region[team.tm_re_num -1].re_sido }</span> 
										<span class="team-name">${team.tm_name}</span>
									</div>
								</a>
							</div>
							<div class="right-teambox">
								멤버수 : <span class="memCnt">${team.tm_teamCnt }</span><br>
								다음 경기 일정 : <span class="recently_match">미정</span><br>
								연습 신청 허용 : <span class="match_type">
									<c:choose>
										<c:when test="${team.tm_openformatch}">신청 가능</c:when>
										<c:otherwise>신청 불가</c:otherwise>
									</c:choose>
								</span>
								<div class="btn-group">
									<span class="tmnum" hidden>${team.tm_num }</span>
									<button type="button"  class="show-schedule btn btn-warning">경기 일정</button>
									<c:if test="${not empty loginUser && empty userTeam }">
										<button type="button" class="btn-wtjoin btn btn-warning" data-team="${team.tm_num }">팀 가입 신청</button>
									</c:if>
							</div>
						</li>
					</c:forEach>
					
				</ul>
			</div>
			<!-- 팀 리스트 끝 -->
			<div class="team-request">
				<a href="<c:url value='/team/create'></c:url>" role="button" class="btn btn-dark btn-team-request">팀 창설 신청</a>
			</div>
			<!-- 페이지 번호 -->
			<div class="container-pagenation">
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<li class="page-item prev"><a href="<c:url value='/team/main?page=${pm.startPage - 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">이전</a></li>
					</c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
						<li class="page-item
							<c:if test='${index == pm.cri.page  }'> active </c:if> ">
							<a href="<c:url value='/team/main?page=${index}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">${index}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item next"><a href="<c:url value='/team/main?page=${pm.startPage + 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		
		<!-- 오른쪽 호버 박스 -->
		<dialog>
			<form method="dialog" id="outerForm">
				<h3 class="display-4 text-center"><span class="team-name">드렁큰 타이거즈</span><br>
				<small>팀 가입 신청</small><br></h3>
				
				<div class="form-group">
					연고지 : <span class="team-local badge badge-pill badge-success"></span><br>
					팀장 : <span class="team-leader"></span><br>
					팀 인원 : <span class="team-count"></span><br>
					
				</div>
				<hr>
				<div class="form-group text-center collapse show" id="wtjoiner">
					<span class="mb-3">상기의 팀에 가입하시겠습니까?</span><br>
					<button type="button" class="btn btn-primary mt-3" data-toggle="collapse" data-target="#duplicateCheck, #wtjoiner">네</button>
					<button type="button" class="btn btn-close btn-danger mt-3">아니오</button>
				</div>
				</form>
				<div class="form-group collapse " id="duplicateCheck">
					<form id="innerForm" action="<c:url value='/team/main/wtjoin'></c:url>" method="post">
						<label for="tp_backnum" id="tp_backnum-error" class="error">희망 등번호를 입력해주십시오.</label><br>
						희망 등번호 : <input  form="innerForm" type="text" class="col-sm-3" placeholder="0~99" name="tp_backnum" id="tp_backnum"> 					
						<!-- 임시로 만든 아이디 -->
						<input type="text" form="innerForm" value="2" name="tp_pl_num" hidden readonly>
						<input type="text" name="tp_tm_num" hidden readonly>
						
						<button type="button" class="btn btn-sm btn-dark btn-duplicateCheck"> 중복체크</button>
						
						<div class="form-group d-flex justify-content-center mt-3">
							<input type="submit" form="innerForm" class="btn btn-info btn-submit  mt-3" value="팀 가입 신청">
							<button type="button" class="btn btn-close btn-danger mt-3">취소</button>
							
						</div>
					</form>
				</div>
				
				
			
		</dialog>
	</section>	
	
	<div class="teammain-rightbox animate__animated animate__backInRight animate__faster" style="display: none;">
		<div class="hover-box">
			<div class="rb-title"><h3><span class="team-name"></span> 경기 일정</div></h3>
			<div class="rb-schedule">
				<ul class="list-schedule">
					<li class="item-schedule scheduleExist">
						<span class="home_team badge badge-pill badge-primary"></span> VS 
						<span class="opponent_team badge badge-pill badge-danger"></span>
						<div class="date-schedule"></div>
						<div class="location-schedule"></div>
						<a href="#" role="button" class="btn btn-outline-primary">경기 예약 확인 페이지로</a>
					</li>
					<li class="item-schedule no-schedule">
						<span>
							경기 일정이 없습니다.
						</span>
					</li>
				</ul>
				
				
			</div>
			
		</div>
	</div>
	
	
<script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
<script>
	let backNumDupCheck = false;
	let cri = {
		page:1,
		perPageNum: 10, 
		search: '',
		type: 0,
		strType:''
	}
	let teamName='';
	$('.show-schedule').click(function(){
		if(teamName == $(this).parents('.item-teambox').find('.team-name').text()){
			$('.teammain-rightbox').toggle();
			return;
		};
		teamName = $(this).parents('.item-teambox').find('.team-name').text()
		$('.teammain-rightbox').find('.team-name').text(teamName);
		$('.teammain-rightbox').find('.home_team').text(teamName);
		let tm_num = $(this).siblings('.tmnum').text();
		let teamObj={
				tm_num : tm_num
		}
		
		ajax("POST", teamObj, "<c:url value='/team/ajax/nextMatch'></c:url>", function(data){
			if(data.nextMatch != null){
				
				$('.scheduleExist').show();
				$('.no-schedule').hide();
			
				let time = new Date(data.nextMatch.ms_datetime);
				
				$('.item-schedule .date-schedule').text(time.getFullYear()+'년 '+time.getMonth()+'월 '+ time.getDate()+'일 '+ time.getHours() +'시 '+ time.getMinutes()+'분' );
				$('.item-schedule .location-schedule').text(data.nextMatch.ms_stadium.sd_name);
				/* 예약 확인 페이지 링크 작업 필요 */
				teamObj = {
						tm_num: data.nextMatch.ms_tm_home_num == tm_num? data.nextMatch.ms_tm_away_num : data.nextMatch.ms_tm_home_num
				}
				ajax("POST", teamObj, "<c:url value='/team/ajax/teamNum'></c:url>", function(data){
					$('.item-schedule .opponent_team').text(data.team.tm_name)
				} )
		}else{
				$('.scheduleExist').hide();
				$('.no-schedule').show();
		}
	})
		$('.teammain-rightbox').hide();
		$('.teammain-rightbox').show();
	})
	
	
	
	
	const dialog = document.querySelector("dialog");

	$('.btn-wtjoin').click(function(){
		dialog.showModal();
		let teamNum = $(this).data('team');
		let teamName = $(this).parents('.item-teambox').find('.team-name').text();
		let teamLocal = $(this).parents('.item-teambox').find('.team-local').text();
		$('dialog [name=tp_tm_num]').val(teamNum);
		$('dialog').find('.team-name').text(teamName);
		$('dialog').find('.team-local').text(teamLocal);
		<!--팀장 및 팀 인원 -->
		let teamObj = {
				tm_num : teamNum
		};
		ajax("post", teamObj, '<c:url value="/team/main/teamInfo"></c:url>', function(data){
			$('dialog .team-count').text(data.memberCnt + '명');
			if(data.teamLeader==null){
				$('dialog .team-leader').text('없음');	
			}else{
				$('dialog .team-leader').text(data.teamLeader.me_nickname);	

			}
		})
	})
	$('.btn-close').click(function(){
		dialog.close();
		$('#duplicateCheck').removeClass('show');
		$('#tp_backnum').val('');
		$('#tp_backnum-error').text('희망 등번호를 입력해주십시오.');
		backNumDupCheck = false;
		$('.btn-duplicateCheck').addClass('btn-dark').text('등번호 중복 체크')
		$('#duplicateCheck').addClass('show');
		$('#wtjoiner').collapse("show");
		$('#duplicateCheck').collapse("hide");
	})
	
	$('.btn-duplicateCheck').click(function(e){
		e.preventDefault();
		let hopeBackNum = $('#tp_backnum').val();
		let teamNum = $('dialog [name=tp_tm_num]').val();
		
		if(!$('#tp_backnum').valid()){
			alert('사용 불가능한 등번호입니다.');
			return;
		}
		let tmpObj = {
				tp_backnum : hopeBackNum, 
				tp_tm_num : teamNum
				
		}
		ajax("POST", tmpObj, '<c:url value="/team/main/backNumDupCheck"></c:url>', function(data){
			backNumDupCheck = data.res;
			console.log(data.res);
			if(data.res){
				alert('사용가능한 등번호입니다.');
				$('.btn-duplicateCheck').removeClass('btn-dark').text('중복 체크 완료')
			}else{
				alert('이미 존재하는 등번호입니다.');
			}
		})
		
	})
	$('#tp_backnum').change(function(){
		backNumDupCheck = false;
		$('.btn-duplicateCheck').addClass('btn-dark').text('등번호 중복 체크')

	})
$(function(){
	
	$('dialog form').validate({
        rules: {
        	tp_backnum:{
        		required : true,
        		regex:/^[0-9]{1,2}$/
        	}
	},
   
    messages : {
    		tp_backnum:{
        		required : "필수로 입력하세요.",
        		regex : "두자리 이내의 숫자만 가능합니다."
        	}
        
        
   	},
				 submitHandler : function (form){
					if(!backNumDupCheck){
		    			alert('등번호 중복 체크를 해주세요.');
		    			return false;
		    		}
					if(!confirm('정말 해당 팀에 가입 신청합니까?')){
						return false;
					}
					
					return true;
				} 
	});
	})
	
$.validator.addMethod(
"regex",
function(value, element, regexp) {
    var re = new RegExp(regexp);
    return this.optional(element) || re.test(value);
},
"Please check your input."
);	

	
	



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

    