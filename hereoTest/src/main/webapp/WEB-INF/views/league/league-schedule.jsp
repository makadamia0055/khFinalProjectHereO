<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/league/league-schedule.css'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>

<div class="container-box">
<div class="middle-box mt-2">
		<div class="filter-box">
			<form action="">
				<div class="form-group">
					<label for="year"></label>
					<select class="form-control" id="year">
						<option>2021</option>
						<option>2022</option>
						<option selected>2023</option>
						<option>2024</option>
					</select>
				</div>
				<div class="form-group">
					<label for="league-name"></label>
					<select class="form-control" name="league-name">
						<c:forEach items="${leagueAtt}" var="la">	
							<option value="${la.la_name }">${la.la_name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="league-type"></label>
					<select class="form-control" name="league-name">
						<c:forEach items="${leagueAtt}" var="la">
							<option value="${la.la_match_type }">${la.la_match_type }</option>
						</c:forEach>
					</select>
						
				</div>
				<div class="form-group">	
					<label for="league-team"></label>
					<select class="form-control" id="league-team">
						<c:forEach items="${leagueParti }" var="lp">
							<c:if test="${lp.lp_approval == 2 }">
								<option value="0">없음</option>
								<option value="${lp.lp_team.tm_name }">${lp.lp_team.tm_name}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<button type="button" class="btn btn-outline-secondary">검색</button>
			</form>
		</div>
	</div>
	<div class="bottom-box">
		<table class="table">
			<thead>
				<tr>
					<th style="width:8%">날짜</th>
					<th style="width:8%">시간</th>
					<th style="width:4%">순서</th>
					<th style="width:20%">리그</th>
					<th style="width:10%">구장</th>
					<th style="width:30%">게임</th>
					<th style="width:8%">진행상황</th>
					<th style="width:8%">경기기록</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${leagueSche}" var="ls" varStatus="la">
				<tr>
					<td>${ls.ls_match_date_str2 }</td>
					<td>${ls.ls_match_date_str3 }</td>
					<td>1</td>
					<td>${ls.ls_leagueAtt.la_name }/${ls.ls_leagueAtt.la_match_type }</td>
					<td>KH야구장</td>
					<td>
						<div class="team-wrap team-left">
								<span class="team"><a href="">${ls.ls_team_a.tm_name }</a></span>
							<span class="score">${ls.ls_point_a }</span>
						</div>
						<span class="versus">VS</span>
						<div class="team-wrap team-right">
							<span class="score">${ls.ls_point_b }</span>
							<span class="team"><a href="">${ls.ls_team_b.tm_name }</a></span>
						</div>
					</td>
					<td>${ls.ls_match_state }</td>
					<td>
						<c:if test="${ls.ls_match_state == '경기후' }">
							<button type="button" class="btn btn-secondary">경기기록</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
				
			</tbody>
		</table>
	</div>
</div>