<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- bootstrap -->
	<link rel="stylesheet" href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>"/>
	<script src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
	
	<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reservation-stadium_insert.css'></c:url>" />
<body>
	<div class="stadium-add">
		<h2>구장 등록</h2>
		<form>
			<label for="stadium-name">구장이름</label>
			<input type="text" id="stadium-name" name="stadium-name" maxlength="20"><br>
			
			<label for="stadium-address">구장 주소</label>
			<input type="text" id="stadium-address-zipcode" name="stadium-address-zipcode" placeholder="우편번호"><br>
			<input type="text" id="stadium-address-road" name="stadium-address-road" placeholder="도로명주소"><br>
			<input type="text" id="stadium-address-detail" name="stadium-address-detail" placeholder="상세주소"><br>
			
			<label for="stadium-phone">구장 연락처</label>
			<input type="text" id="stadium-participator" name="stadium-phone" maxlength="20" placeholder="담당자 이름"><br>
			<input type="text" id="stadium-phone" name="stadium-phone" maxlength="3"> -
			<input type="text" id="stadium-phone" name="stadium-phone" maxlength="4"> -
			<input type="text" id="stadium-phone" name="stadium-phone" maxlength="4">
			
			<label for="stadium-description" >시설 사용 규칙</label>
			<textarea id="stadium-description" name="stadium-description" maxlength="1000" placeholder="구장 소개를 입력하세요."></textarea><br>
			
			<label for="stadium-directions">찾아오시는 길</label>
			<textarea id="stadium-directions" name="stadium-directions" maxlength="500"></textarea><br>
			
			<label for="stadium-image">구장 사진</label>
			<input type="file" id="stadium-image" name="stadium-image" accept="image/*" multiple><br>
			<input type="file" id="stadium-image" name="stadium-image" accept="image/*" multiple><br>
			<input type="file" id="stadium-image" name="stadium-image" accept="image/*" multiple><br>
			<input type="file" id="stadium-image" name="stadium-image" accept="image/*" multiple><br>
			<button type="submit" class="btn btn-outline-success">구장 등록 요청</button>
		</form>
	</div>
</body>