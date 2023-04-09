<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- bootstrap -->
	<link rel="stylesheet" href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>"/>
	<script src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
	
	<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reservation-stadium_list.css'></c:url>" />
	<div class="stadium-infoList">
		<h4>구장 정보 등록 리스트</h4>
		<table>
			<thead>
				<tr>
					<th>순서</th>
					<th>구장명</th>
					<th>아이디</th>
					<th>등록요청일자</th>
					<th>승인여부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td><a href="<c:url value='/reservation/stadium-detail'></c:url>">강상제3구장</a></td>
					<td>user</td>
					<td>2023-03-25</td>
					<td>승인</td>
				</tr>
				<tr>
					<td>2</td>
					<td>mj야구장</td>
					<td>user1</td>
					<td>2023-03-31</td>
					<td>반려</td>
				</tr>
				<tr>
					<td>3</td>
					<td>화도구장</td>
					<td>user2</td>
					<td>2023-04-02</td>
					<td>승인</td>
				</tr>
			</tbody>
		</table>
	</div>