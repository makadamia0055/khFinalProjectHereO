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
				<a class="nav-link schedule" href="<c:url value='/league/schedulemanagerment'></c:url>">리그일정관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link register active" href="">리그참가관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link create" href="">리그생성</a>
			</li>
		</ul>
	</div>
	<div class="middle-box register mt-2">
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
				<button type="button" class="btn btn-outline-success btn-complete">모집완료</button>
			</form>
		</div>
		<div class="bottom-box">
			<table class="table">
				<thead>
					<tr>
						<th style="width: 5%">번호</th>
						<th style="width: 15%">로고</th>
						<th style="width: 40%">팀이름</th>
						<th style="width: 5%">팀원수</th>
						<th style="width: 10%">가입비</th>
						<th style="width: 10%">참가승인</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td></td>
						<td>
							<a href="">두산 베어스</a>
						</td>
						<td>18</td>
						<td>
							<button type="" class="btn btn-success">완납</button>
						</td>
						<td>
							<select>
								<option selected value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td></td>
						<td>
							<a href="">키움 히어로즈</a>
						</td>
						<td>18</td>
						<td>
							<button type="" class="btn btn-info">분납</button>
						</td>
						<td>
							<select>
								<option selected value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td></td>
						<td>
							<a href="">롯데 자이언츠</a>
						</td>
						<td>18</td>
						<td>
							<button type="" class="btn btn-success">완납</button>
						</td>
						<td>
							<select>
								<option selected value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>4</td>
						<td></td>
						<td>
							<a href="">LG 트윈스</a>
						</td>
						<td>18</td>
						<td>
							<button type="" class="btn btn-danger">미납</button>
						</td>
						<td>
							<select>
								<option selected value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>5</td>
						<td></td>
						<td>
							<a href="">한화 이글스</a>
						</td>
						<td>18</td>
						<td>
							<button type="" class="btn btn-success">완납</button>
						</td>
						<td>
							<select>
								<option selected value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>6</td>
						<td></td>
						<td>
							<a href="">KIA 타이거즈</a>
						</td>
						<td>18</td>
						<td>
							<button type="" class="btn btn-danger">미납</button>
						</td>
						<td>
							<select>
								<option selected value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
	</div>
</div>