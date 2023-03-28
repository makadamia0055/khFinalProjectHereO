<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />

	<section class="teamcreate-main">
		<div class="container-create-input">
			<h3 class="title-teamcreate">팀 개설 지원서</h3>
			<fieldset class="">
				<form action="<c:url value='/team/create'></c:url>" method="POST" class="form-horizontal" enctype="multipart/form-data">
					<div class="form-group">
						<div class="team-selector">
							<label for="team_name">희망 팀 이름</label><br>
							<input type="text" class="col-lg-6" name="tm_name" id="team_name" placeholder="최소 3자~최대 8자">
							<button class="btn btn-dark btn-duplicateCheck">팀명 중복 체크</button>
						</div>
					</div>
					<div class="form-group">
						<label for="team-local">지역</label>
							<select name="tm_re_num" id="team-local">
								<option value="1">서울</option>
								<option value="2">경기</option>
								<option value="3">인천</option>
								<option value="4">대전</option>
								<option value="5">충남</option>
								<option value="6">충북</option>
								<option value="7">광주</option>
								<option value="8">전남</option>
								<option value="9">전북</option>
								<option value="10">강원</option>
								<option value="11">울산</option>
								<option value="12">대구</option>
								<option value="13">경남</option>
								<option value="14">경북</option>
								<option value="15">제주</option>
							</select>
					</div>
					<div class="form-group">
						<label for="team-gender">팀 성별 구성</label>
							<select name="tm_teamgender" id="team-gender">
								<option value="1">남녀 혼성</option>
								<option value="2">남성만</option>
								<option value="3">여성만</option>
							</select>
					</div>
					<div class="form-group">
						<label for="team-match">연습경기 신청 허용 여부</label>
							<select name="tm_openformatch" id="team-match">
								<option value="true">허용</option>
								<option value="false">불가</option>
							</select>
					</div>
					
					<div class="form-group">
						<label for="team-since">팀 창단일</label>
						<input type="date" name="tm_startday" id="team-since" class="form-control  col-lg-8" placeholder="팀 창단일을 입력해주세요.">
					</div>
					
						<div class="form-group">
							<label for="teamLogo">팀 로고 이미지 파일</label><br>
							<input type="file" name="imgFile" id="teamLogo">	
						</div>
						
						<div class="form-group">
						<label for="tm_slogan">팀 슬로건</label><br>
						<input type="text" class="col-lg-12" name="tm_slogan" id = "tm_slogan" placeholder="최대 25자 이내로 입력해주십시오.">
					</div>
						<button type="submit" class="btn btn-dark col-lg-12">팀 신청</button>
					



				</form>
			</fieldset>
		</div>

	</section>

	
	<script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
			
    ></script>