<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
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
					<td><img src="#" width="200"><img src="#" width="200"></td>
				</tr>
				<tr>
					<td>구장명</td>
					<td>${stadium.sd_name }</td>
				</tr>
				<tr>
					<td>구장 주소</td>
					<td></td>
				</tr>
				<tr>
					<td>구장 연락처</td>
					<td>${stadium.sd_contact}</td>
				</tr>
				<tr>
					<td>시설 사용 규칙(구장 소개)</td>
					<td>${stadium.sd_intro}</td>
				</tr>
				<tr>
					<td>운영 시간</td>
					<td>오전 9시 ~ 오후 10시</td>
				</tr>
			</tbody>
		</table>
		<div style="text-align: center;">
			<button class="btn btn-success btn-confirm">승인</button>
			<button class="btn btn-danger btn-pending">거절</button>
		</div>
	</div>
<script type="text/javascript">
$('.btn-confirm').click(function(){
	alert('승인할꺼야?');
})
</script>
</body>