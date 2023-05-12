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
						<option selected>kh평일리그</option>
						<option>kh주말리그</option>
					</select>
				</div>
				<button type="button" class="btn btn-outline-secondary">검색</button>
			</form>
		</div>
		<div class="bottom-box">
			<table class="table">
				<thead>
					<tr>
						<th style="width: 5%">번호</th>
						<th style="width: 7%">년도</th>
						<th style="width: 20%">리그이름</th>
						<th style="width: 20%">리그타입</th>
						<th style="width: 5%">신청팀</th>
						<th style="width: 10%">모집현황</th>
						<th style="width: 15%"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>2023</td>
						<td>kh평일리그</td>
						<td>평일3부리그</td>
						<td>7</td>
						<td>
							<button type="button" class="btn btn-danger">모집완료</button>
						</td>
						<td>
							<button type="button" class="btn btn-outline-success">신청</button>
							<button type="button" class="btn btn-outline-danger">취소</button>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td>2023</td>
						<td>kh평일리그</td>
						<td>평일4부리그</td>
						<td>5</td>
						<td>
							<button type="" class="btn btn-info">모집중</button>
						</td>
						<td>
							<button type="button" class="btn btn-outline-success">신청</button>
							<button type="button" class="btn btn-outline-danger">취소</button>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td>2023</td>
						<td>kh평일리그</td>
						<td>평일야간3부리그</td>
						<td>2</td>
						<td>
							<button type="button" class="btn btn-info">모집중</button>
						</td>
						<td>
							<button type="button" class="btn btn-outline-success">신청</button>
							<button type="button" class="btn btn-outline-danger">취소</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		  <ul class="pagination justify-content-center">
		   <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
		   <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
		   <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
		   <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
		 </ul>
	</div>
</div>