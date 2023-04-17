<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/league/league-recode-hit.css'></c:url>" rel="stylesheet">

<div class="main-container">

	<div class="top-box">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link hit active" href="<c:url value='/league/recodeHit'></c:url>">타자</a>
			</li>
			<li class="nav-item">
				<a class="nav-link pit" href="<c:url value='/league/recodePit'></c:url>">투수</a>
			</li>

		</ul>
	</div>
	<div class="middle-box mt-2">
		<div class="filter-box">
			
				<div class="form-group">
					<label for="year"></label>
					<select class="form-control" id="year">
						<c:forEach items="${laList }" var="laList">
							<option value="${laList.la_start_date_str}"></option>
						</c:forEach>
						
					</select>
				</div>
				<div class="form-group">
					<label for="league-name"></label>
					<select class="form-control" id="league-name">
						<c:forEach items="${laList }" var="laList">
							<option value="${laList.la_name}"></option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="league-type"></label>
					<select class="form-control" id="league-type">
						<c:forEach items="${laList }" var="laList">
							<option value="${laList.la_match_la}"></option>
						</c:forEach>
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

		</div>
	</div>
		<div class="bottom-box hit">
			<table class="table">
				<thead>
					<tr>
						<th style="width: 4%;">순위</th>
						<th style="width: 8%;">선수명</th>
						<th style="width: 12%;">팀명</th>
						<th style="width: 8%;">
							<a >타율</a>
						</th>
						<th style="width: 4%;">
							<a >경기</a>
						</th>
						<th style="width: 4%;">
							<a >타석</a>
						</th>
						<th style="width: 4%;">
							<a >타수</a>
						</th>
						<th style="width: 4%;">
							<a >안타</a>
						</th>
						<th style="width: 5%;">
							<a >2루타</a>
						</th>
						<th style="width: 5%;">
							<a >3루타</a>
						</th>
						<th style="width: 4%;">
							<a >홈런</a>
						</th>
						<th style="width: 4%;">
							<a >타점</a>
						</th>
						<th style="width: 4%;">
							<a >득점</a>
						</th>
						<th style="width: 4%;">
							<a >도루</a>
						</th>
						<th style="width: 6%;">
							<a >도루실패</a>
						</th>
						<th style="width: 4%;">
							<a >볼넷</a>
						</th>
						<th style="width: 4%;">
							<a >사구</a>
						</th>
						<th style="width: 4%;">
							<a >삼진</a>
						</th>
						<th style="width: 4%;">
							<a >병살</a>
						</th>
						<th style="width: 4%;">
							<a >실책</a>
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${playerrecord-hitter }" var="record-hitter">
					<tr>
						<td>1</td>
						<td>이정후(22)</td>
						<td>두산공작기계야구단</td>
						<td>0.364</td>
						<td>10</td>
						<td>25</td>
						<td>22</td>
						<td>8</td>
						<td>1</td>
						<td>0</td>
						<td>2</td>
						<td>7</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>3</td>
						<td>0</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
					</tr>
				
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	
<script>


</script>