<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/league/league-managerment.css?version=2304062020'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>

<div class="container-box">
	<div class="top-box mt-2">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link schedule" href="<c:url value='/league/schedulemanagerment/${lg_num}'></c:url>">리그일정관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link register active" href="<c:url value='/league/partimanagerment/list/${lg_num}'></c:url>">리그참가관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link create" href="<c:url value='/league/insertType/${lg_num}'></c:url>">리그타입관리</a>
			</li>
		</ul>
	</div>
	<div class="middle-box register mt-2">
		<div class="filter-box">
			<form action="">
				<div class="form-group">
					<label for="league-name"></label>
					<select class="form-control" id="league-name">
						<option>kh중앙리그</option>
						<option>kh숏리그</option>
						<option selected>kh평일리그</option>
						<option>kh주말리그</option>
					</select>
				</div>
				<div class="form-group">
					<label for="league-type"></label>
					<select class="form-control" id="league-type">
						<option>중앙3부리그</option>
						<option>숏4부리그</option>
						<option>평일3부리그</option>
						<option>주말4부리그</option>
					</select>
				</div>
				<button type="button" class="btn btn-outline-secondary">검색</button>
			</form>
		</div>
		<div class="bottom-box">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>리그이름</th>
						<th>리그타입</th>
						<th>모집상태</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${laList }" var="la" varStatus="vs">
					<tr>
						<td>${vs.index+1 }<input type="hidden" value="${la.la_num }" name="la_num"></td>
						<td>${la.la_name }</td>
						<td>${la.la_match_type }</td>
						<td>${la.la_team_state }</td>
						<td>
							<c:if test="${la.la_team_state != '모집완료' }">
								<a href="<c:url value='/league/partimanagerment/${lg_num}/detail/${la.la_num }'></c:url>">
									<button type="button" class="btn btn-outline-warning btn-up">수정</button>
								</a>
							</c:if>
							<a href="<c:url value='/league/partimanagerment/${lg_num}/detail/${la.la_num}/update'></c:url>">
								<button type="button" class="btn btn-outline-info btn-finish">모집완료</button>
							</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
		</table>
		</div>
	</div>
</div>