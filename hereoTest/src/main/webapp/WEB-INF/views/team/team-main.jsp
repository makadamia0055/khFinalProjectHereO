<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />
<link	rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

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
								<a href="<c:url value='/team/main?type=${re.re_num}'></c:url>" class="link-region btn btn-primary" role="button" data-local="${re.re_num}">${re.re_sido}</a>
							</li>
						</c:forEach>
						
					</ul>
				</div>
				<!-- 지역 리스트 끝 -->
				<div class="group-search-team input-group col-sm-3">
					<input type="text" class="form-control " name="search-team" id="search-team" placeholder="팀 검색">
					<div class="input-group-append">
						<button class="btn btn-success">검색</button>
					</div>
				</div>
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
								ㅌㅌㅌ : <span class="possible_local">ㅇㅇㅇ</span><br>
								다음 경기 일정 : <span class="recently_match">미정</span><br>
								연습 신청 허용 : <span class="match_type">
									<c:choose>
										<c:when test="${team.tm_openformatch}">신청 가능</c:when>
										<c:otherwise>신청 불가</c:otherwise>
									</c:choose>
								</span>
								<div class="btn-group">
									<button type="button"  class="show-schedule btn btn-warning">경기 일정</button>
									<c:if test="${true }">
										<button type="button" class="btn-wtjoin btn btn-warning">팀 가입 신청</button>
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
							<a href="<c:url value='/team/main?page=${index}'></c:url>" class="page-link">${index}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item next"><a href="<c:url value='/team/main?page=${pm.startPage + 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		
		<!-- 오른쪽 호버 박스 -->
		
	</section>	
	<dialog>
		모달창 임시 
	</dialog>
	<div class="teammain-rightbox animate__animated animate__backInRight animate__faster" style="display: none;">
		<div class="hover-box">
			<div class="rb-title"><h3><span class="team-name">단또즈</span> 경기 일정</div></h3>
			<div class="rb-schedule">
				<ul class="list-schedule">
					<li class="item-schedule">
						<span class="home_team badge badge-pill badge-primary">팀 단또즈</span> VS 
						<span class="opponent_team badge badge-pill badge-danger">팀 맘모스</span>
						<div class="date-schedule">23-02-18 오전 9시</div>
						<div class="location-schedule">왕십리 사근초등학교</div>
						<a href="#" role="button" class="btn btn-outline-primary">경기 예약 확인 페이지로</a>
					</li>
				</ul>
				
				
			</div>
			
			
			
		</div>

		

	</div>
	<c:remove var="team" scope="session"></c:remove>
	
<script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
<script>
	let cri = {
		page:1,
		perPageNum: 10, 
		search: '',
		type: 0,
		strType:''
	}

	$('.show-schedule').click(function(){
		let teamName = $(this).parents('.item-teambox').find('.team-name').text();
		$('.teammain-rightbox').find('.team-name').text(teamName);
		$('.teammain-rightbox').find('.home_team').text(teamName);
		$('.teammain-rightbox').toggle();
	})
	const dialog = document.querySelector("dialog");

	$('.btn-wtjoin').click(function(){
		dialog.showModal();
	})
	
</script>
<script>





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

    