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
				<a class="nav-link schedule active" href="">리그일정관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link register" href="<c:url value='/league/partimanagerment'></c:url>">리그참가관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link create" href="">리그생성</a>
			</li>
		</ul>
	</div>
	
	<div class="middle-box schedule mt-2">
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
							<div class="team-wrap">
								<span class="team"><a href="">빈티지(야간)</a></span>
							</div>
							<span class="score"></span>
							<span class="versus">VS</span>
							<span class="csore"></span>
							<div class="team-wrap">
								<span class="team"><a href="">펠컨스</a></span>
							</div>
						</td>
						<td>경기전</td>
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
							<div class="team-wrap">
								<span class="team"><a href="">빈티지(야간)</a></span>
							</div>
							<span class="score"></span>
							<span class="versus">VS</span>
							<span class="csore"></span>
							<div class="team-wrap">
								<span class="team"><a href="">펠컨스</a></span>
							</div>
						</td>
						<td>경기전</td>
						<td>
							<button type="button" class="btn btn-secondary">경기기록</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
</div>	
