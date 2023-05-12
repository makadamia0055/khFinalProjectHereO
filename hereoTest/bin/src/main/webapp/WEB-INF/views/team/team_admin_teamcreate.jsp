<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />

<style>
	.item-team_img{
		width:50px;
		height:50px;
	}
</style>

<section class="team-board-main team_create">
	<c:set var="no_check" value= "0" />
	<c:set var="delayed_check" value= "0" />
	<c:forEach items="${TAList}" var="list">
		<c:choose>
			<c:when test="${list.ta_state eq 0 }">
				<c:set var="no_check" value="${no_check + 1}" />		
			</c:when>
			<c:when test="${list.ta_state eq 1 }">
				<c:set var="delayed_check" value="${delayed_check + 1}" />
			</c:when>
		</c:choose>
	</c:forEach>

		<div class="container-board">
			<div class="title-board">
				<strong>팀 개설 관리</strong>
				<div class="new_join">미확인 요청 : <span class="nocheck_num">${no_check }</span>건</div>
				<div class="nocheck_join">보류된 요청 : <span class="delayed_num">${delayed_check }</span>건</div>
				<div class="whole_join">전체 요청 : <span class="whole_num">${fn:length(TAList)}</span>건</div>
			</div>
			<div class="box-board">
				<table class="table table-bordered">
					<thead class="thead-dark">
						<tr>
 							<th class="board_num"></th>
							<th class="team_num">팀번호</th>
							<th class="box-team_img">팀 이미지</th>
							<th class="team_name">희망 팀 이름</th>
							<th class="teamLeader">팀장</th>
							<th class="location_big">지역</th>
							<th class="create_date">신청일</th>
							<th class="state">신청 상태</th>
							<th class="buttonCol">비고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${TAList}" var="tal">
							<tr>
								<td class="board_num"></td>
								<td class="team_num">${tal.team.tm_num}</td>
								<td class="box-team_img">
								<c:choose>
									<c:when test="${empty tal.team.tm_team_img }">X</c:when>
									<c:otherwise><img class="item-team_img" src="<c:url value='/files${tal.team.tm_team_img }'></c:url>">							
									</c:otherwise>
								</c:choose>
								</td>
								<td class="team_name"><a href="<c:url value='/team/adteam_createBoard?teamNum= ${tal.ta_tm_num }'></c:url>"> ${tal.team.tm_name }</a></td>	
								<td class="teamLeader"> <a href="#"> ${tal.team.tm_me_id }</a></td>
								<td class="location_big">${tal.team.tm_re_num }</td>
								<td class="create_date"><fmt:formatDate type="both" pattern = "yyyy-MM-dd HH:mm" value="${tal.ta_register_date}"></fmt:formatDate></td>
								<th class="state">${tal.ta_state }</th>
								<td class="buttonCol"></td>
							</tr>
						</c:forEach>
					</tbody>
						
				</table>
			</div>
			<div class="container-pagenation">
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<li class="page-item prev"><a href="<c:url value='/team/adteam_create?page=${pm.startPage - 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">이전</a></li>
					</c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
						<li class="page-item
							<c:if test='${index == pm.cri.page  }'> active </c:if> ">
							<a href="<c:url value='/team/adteam_create?page=${index}'></c:url>" class="page-link">${index}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item next"><a href="<c:url value='/team/adteam_create?page=${pm.startPage + 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">다음</a></li>
					</c:if>
				</ul>
			</div>
				<div class="btnBox-board">
					<a href="#" class="on">목록 선택</a>
					<!-- <a href="#" class="">수정</a> -->
				</div>
			</div>
		</div>
	</section>	