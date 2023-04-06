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
	
		<div class="container-board">
			<div class="title-board">
				<strong>팀 가입 요청 관리</strong>
			</div>
			<div class="box-board">
				<table class="table table-bordered">
					<thead class="thead-dark">
						<tr>
 							<th class="board_num"></th>
							<th class="tj_num">번호</th>
							<th class="player_id">선수id</th>
							<th class="hands">투타</th>
							<th class="ispro">선출 여부</th>
							<th class="register_date">신청일</th>
							<th class="state">신청 상태</th>
							<th class="buttonCol">비고</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty WTJList}"><tr><td colspan="100%">현재 등록된 신청이 없습니다.</td></tr></c:if>
						<c:forEach items="${WTJList}" var="wtj" varStatus="ind">
							<tr>
								<td class="board_num"></td>
								<td class="tj_num">${ind.count}</td>
								<td class="player_id"><a href="<c:url value='/team/wtjBoard/${wtj.tj_num}'></c:url>"> ${wtj.tj_player.pl_me_id }</a></td>	
								<td class="hands">${wtj.tj_player.pl_pitching_hand } ${wtj.tj_player.pl_hitting_hand} </td>
								<td class="ispro">${wtj.tj_player.pl_ispro}</td>
								<td class="register_date"><fmt:formatDate type="both" pattern = "yyyy-MM-dd HH:mm" value="${wtj.tj_register_date}"></fmt:formatDate></td>
								<th class="state">${wtj.tj_state }</th>
								<td class="buttonCol"></td>
							</tr>
						</c:forEach>
					</tbody>
						
				</table>
			</div>
			<div class="container-pagenation">
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<li class="page-item prev"><a href="<c:url value='/team/wtjPage?page=${pm.startPage - 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">이전</a></li>
					</c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
						<li class="page-item
							<c:if test='${index == pm.cri.page  }'> active </c:if> ">
							<a href="<c:url value='/team/wtjPage?page=${index}'></c:url>" class="page-link">${index}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item next"><a href="<c:url value='/team/wtjPage?page=${pm.startPage + 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">다음</a></li>
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