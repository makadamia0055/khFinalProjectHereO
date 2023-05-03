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
					<select class="form-control" id="league-name">
						<option>kh중앙리그</option>
						<option>kh숏리그</option>
						<option>kh평일리그</option>
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
				<div class="form-group">	
					<label for="league-team"></label>
					<select class="form-control" id="league-team">
						<option selected>없음</option>
						<option>kia타이거즈</option>
						<option>kt위즈</option>
						<option>두산 베어스</option>
						<option>ssg랜더스</option>
						<option>롯데 자이언트</option>
						<option>lg트윈스</option>
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
				<tr>
					<td>03.23 (목)</td>
					<td>20:00</td>
					<td>1</td>
					<td>평일리그/평일야간리그</td>
					<td>소망야구장</td>
					<td>
						<div class="team-wrap team-left">
								<span class="team"><a href="">빈티지(야간)</a></span>
							<span class="score">5</span>
						</div>
						<span class="versus">VS</span>
						<div class="team-wrap team-right">
							<span class="score">4</span>
							<span class="team"><a href="">펠컨스</a></span>
						</div>
					</td>
					<td>경기후</td>
					<td>
						<button type="button" class="btn btn-secondary">경기기록</button>
					</td>
				</tr>
				<tr>
					<td>03.23 (목)</td>
					<td>20:00</td>
					<td>1</td>
					<td>평일리그/평일야간리그</td>
					<td>소망야구장</td>
					<td>
						<div class="team-wrap team-left">
								<span class="team"><a href="">빈티지(야간)</a></span>
							<span class="score"></span>
						</div>
						<span class="versus">VS</span>
						<div class="team-wrap team-right">
							<span class="score"></span>
							<span class="team"><a href="">펠컨스</a></span>
						</div>
					<td>경기전</td>
					<td>
						<button type="button" class="btn btn-secondary">경기기록</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>