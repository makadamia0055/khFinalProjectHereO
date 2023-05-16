<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- bootstrap -->
	<link rel="stylesheet" href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>"/>
	<script src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>    
	<!-- datepicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/reservation/reservation-check.css'></c:url>" />
<body> 
	<div class="reservations">
		<div class="topbox">
			<table>
			    <tr>
			        <th>예약 번호<th>
			        <th>예약 구장</th>
			        <th>예약 날짜</th>
			        <th>예약 시간</th>
			        <th>예약 상태</th>
			        <th>취소</th>
			    </tr>
			    <tr>
			        <td>김밥</td>
			        <td>라면</td>
			        <td>떡볶이</td>        
			    </tr>
			</table>
		</div>        
	</div>
<script src="https://kit.fontawesome.com/bedfa56d7f.js" crossorigin="anonymous"></script>
</body>
</html>