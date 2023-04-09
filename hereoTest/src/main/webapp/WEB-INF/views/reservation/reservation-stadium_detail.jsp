<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- bootstrap -->
	<link rel="stylesheet" href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>"/>
	<script src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
	
	<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reservation-stadium_detail.css'></c:url>" />
<body>
	<div class="stadium_info">
		<h4>구장 등록 정보</h4>
		<table>
			<thead>
				<tr>
					<th>항목</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>구장 사진</td>
					<td><img src="#" width="200"><img src="#" width="200"><img src="#" width="200"></td>
					
				</tr>
				<tr>
					<td>구장명</td>
					<td>화도강변구장 구장</td>
				</tr>
				<tr>
					<td>구장 주소</td>
					<td>경기도 남양주시 화도읍 금남리 160-15</td>
				</tr>
				<tr>
					<td>구장 연락처</td>
					<td>홍길동<br> 010-1234-5678</td>
				</tr>
				<tr>
					<td>시설 사용 규칙(구장 소개)</td>
					<td>이렇게 사용하면 됩니다.</td>
				</tr>
				<tr>
					<td>운영 시간</td>
					<td>오전 9시 ~ 오후 10시</td>
				</tr>
				<tr>
					<td>찾아오는 방법</td>
					<td>남양주로 오세요~</td>
				</tr>
			</tbody>
		</table>
		<div style="text-align: center;">
			<button class="btn btn-success">승인</button>
			<button class="btn btn-danger">거절</button>
		</div>
	</div>
</body>