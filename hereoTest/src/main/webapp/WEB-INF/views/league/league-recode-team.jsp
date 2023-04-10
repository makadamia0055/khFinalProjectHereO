<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/league/league-recode-team.css'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>

<div class="main-container">
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
				<button type="button" class="btn btn-outline-secondary">검색</button>
			</form>
		</div>
	</div>
	<div class="bottom-box ">
		<table class="table">
			<thead>
				<tr>
					<th style="width: 5%;">순위</th>
					<th style="width: 27%;">팀명</th>
					<th style="width: 6%;">승점</th>
					<th style="width: 6%;">경기</th>
					<th style="width: 6%;">승</th>
					<th style="width: 6%;">패</th>
					<th style="width: 6%;">무</th>
					<th style="width: 11%;">최근 10경기</th>
					<th style="width: 7%;">연속</th>
					<th style="width: 10%;">선공</th>
					<th style="width: 10%;">후공</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>두산 베어스</td>
					<td>9</td>
					<td>3</td>
					<td>3</td>
					<td>0</td>
					<td>0</td>
					<td>3승0무0패</td>
					<td>3연승</td>
					<td>1승0무0패</td>
					<td>2승0무0패</td>
				</tr>
			</tbody>
		</table>
	</div>

	
</div>