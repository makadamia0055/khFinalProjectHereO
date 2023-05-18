<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/league/league-managerment.css?version=2304062020'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/league/league-managerment.js'></c:url>"></script>

<div class="container-box">
	<div class="top-box mt-2">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link schedule" href="<c:url value='/league/schedulemanagerment/${lg_num}'></c:url>">리그일정관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link register active" href="<c:url value='/league/partimanagerment/${lg_num}'></c:url>">리그참가관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link create" href="<c:url value='/league/insertType/${lg_num}'></c:url>">리그타입관리</a>
			</li>
		</ul>
	</div>
	<div class="middle-box register mt-2">
		<div class="bottom-box">
			<table class="table">
				<thead>
					<tr>
						<th style="width: 5%">번호</th>
						<th style="width: 15%">로고</th>
						<th style="width: 40%">팀이름</th>
						<th style="width: 5%">팀원수</th>
						<th style="width: 10%">참가승인</th>
					</tr>
				</thead>
				<form action="<c:url value='/league/partimanagerment/${lg_num}/detail/${la_num}/save'></c:url>" method="post">
				<tbody>	
					<c:forEach items="${lpList }" var="lp" varStatus="vs">
						<tr>
							<td>${vs.index+1 }<input type="hidden" value="${lp.lp_num }" name="lp_num"></td>
							<td>${lp.lp_team.tm_team_img }</td>
							<td>
								<a href="">${lp.lp_team.tm_name }</a>
							</td>
							<td>15</td> <!-- 팀원수 계산 미구현 -->
							<td>
								<select  >
									<option value="0" <c:if test="${lp.lp_approval == 0 }">selected</c:if>>선택</option>
									<option value="1" <c:if test="${lp.lp_approval == 1 }">selected</c:if>>거부</option>
									<option value="2" <c:if test="${lp.lp_approval == 2 }">selected</c:if>>승인</option>
								</select>
							</td>
						</tr>
					</c:forEach>
				</tbody>
					<button type="button" class="btn btn-outline-info btn-save">저장</button>
					<a href="<c:url value='/league/partimanagerment/${lg_num}/detail/${la_num}/update'></c:url>">
						<button type="button" class="btn btn-outline-success btn-complete">모집완료</button>
					</a>
				</form>
			</table>
		</div>
	</div>
</div>