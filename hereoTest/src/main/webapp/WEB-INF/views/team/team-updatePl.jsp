<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />
<script src="/hereoTest/resources/js/common/jquery.validate.min.js"></script>
	<c:if test="${empty userPlayer }">
	<script>
	alert('잘못된 접근입니다');
	location.href = "<c:url value='/team/main'></c:url>";
	
	</script>
	
	</c:if>
	
	<section class="teamcreate-main">
		<div class="container-create-input">
			<h3 class="title-teamcreate">플레이어 정보 수정</h3>
			<h4>-${userPlayer.pl_me_id}님의 플레이어 정보-</h4>
			<hr>
			<fieldset class="">
				<form action="<c:url value='/team/updatePl'></c:url>" method="POST" class="form-horizontal" enctype="multipart/form-data">
					<div class="form-group">
						<div class="team-selector">
							<input type="text" name="pl_num" hidden value="${userPlayer.pl_num}">
							<label for="">투타</label><br>
							<label for="pl_pitching_hand">던지는 손</label><br>
							<select name="pl_pitching_hand" id="pl_pitching_hand">
								<option value="우투" <c:if test="${userPlayer.pl_pitching_hand == '우투'}"> selected</c:if>>우투</option>
								<option value="좌투" <c:if test="${userPlayer.pl_pitching_hand == '좌투'}"> selected</c:if>>좌투</option>
							</select><br>
							<label for="pl_hitting_hand">치는 손</label>
							<select name="pl_hitting_hand" id="pl_hitting_hand" value="${userPlayer.pl_hitting_hand}">
								<option value="우타" <c:if test="${userPlayer.pl_hitting_hand == '우타'}"> selected</c:if>>우타</option>
								<option value="좌타" <c:if test="${userPlayer.pl_hitting_hand == '좌타'}"> selected</c:if>>좌타</option>
							</select>
							
						</div>
					</div>
					<hr>
					<div class="form-group">
						<label for="pl_ispro">엘리트 야구 경험 여부</label>
							<select name="pl_ispro" id="pl_ispro"">
								<option value="아님" <c:if test="${userPlayer.pl_ispro == '아님'}"> selected</c:if>>아님</option>
								<option value="초등" <c:if test="${userPlayer.pl_ispro == '초등'}"> selected</c:if>>초등</option>
								<option value="중학" <c:if test="${userPlayer.pl_ispro == '중학'}"> selected</c:if>>중학</option>
								<option value="고교" <c:if test="${userPlayer.pl_ispro == '고교'}"> selected</c:if>>고교</option>
								<option value="대학" <c:if test="${userPlayer.pl_ispro == '대학'}"> selected</c:if>>대학</option>
								<option value="프로" <c:if test="${userPlayer.pl_ispro == '프로'}"> selected</c:if>>프로</option>
								
							</select>
					</div>
					<hr>
					<div class="form-group">
						<label for="pl_introduce">자기 소개</label><br>
							<textarea name="pl_introduce" id="pl_introduce">
								${userPlayer.pl_introduce}
							</textarea>
					</div>
					<hr>
					<div class="form-group">
						<span>희망 포지션</span><br>
						<input type="text" name="hopePositionStr" hidden>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input hopePosition" name="hopePosition" value="1" 
						    	<c:forEach items="${pHList}" var="pl">
						    		<c:if test="${pl.ph_po_num == 1}"> checked</c:if>
						    	</c:forEach>
						    >투수
						  </label>
						</div>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input hopePosition" name="hopePosition" value="2"
						    <c:forEach items="${pHList}" var="pl">
						    		<c:if test="${pl.ph_po_num == 2}"> checked</c:if>
						    	</c:forEach>>포수
						  </label>
						</div>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input hopePosition" name="hopePosition" value="12"
						    <c:forEach items="${pHList}" var="pl">
						    		<c:if test="${pl.ph_po_num == 12}"> checked</c:if>
						    	</c:forEach>>내야수
						  </label>
						</div>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input hopePosition" name="hopePosition" value="13"
						    <c:forEach items="${pHList}" var="pl">
						    		<c:if test="${pl.ph_po_num == 13}"> checked</c:if>
						    	</c:forEach>>외야수
						  </label>
						</div>
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input hopePosition" name="hopePosition" value="10"
						    <c:forEach items="${pHList}" var="pl">
						    		<c:if test="${pl.ph_po_num == 10}"> checked</c:if>
						    	</c:forEach>>지명타자
						  </label>
						</div>
					</div>
					<hr>
					<div class="form-group">
							<label for="pl_player_img">플레이어 이미지 파일</label><br>
							
									<img width="150" height="150" src=
									<c:choose>
										<c:when test="${empty userPlayer.pl_player_img}">
											"<c:url value='/files/noimg.png'></c:url>"
										</c:when>
										<c:otherwise>
											"<c:url value='/files${userPlayer.pl_player_img}'></c:url>"
										</c:otherwise>
									</c:choose>
									>
							
							<br>
							<button type="button" class="btn btn-dark btn-img_change">현재 이미지 교체</button>
							<input hidden type="text" name="tm_team_img" value="${userPlayer.pl_player_img}">
							<input hidden type="file" name="imgFile" id="teamLogo" accept="image/*">
							<label>
								<input type="checkbox" name="currentLogoDelete" value="true"> 현재 이미지 삭제만 하기
							</label>	
						</div>   
						<button type="submit" class="btn btn-dark col-lg-12">정보 수정</button>
					



				</form>
			</fieldset>
		</div>

	</section>

	
	<script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
			
    ></script>
    <script>
	$('.btn-img_change').click(function(){
		$('#teamLogo').click();
	})
    
    $('.hopePosition').click(function(){
    	let arr = [];
    	let chBox=  $('.hopePosition');
    	for(let tmp of chBox){
    		if($(tmp).is(':checked')){
    			arr.push($(tmp).val())
    		}
    	}
    	$('[name=hopePositionStr]').val(arr.join(' '))
    })
    
 	function ajax(method, obj, url, successFunc, errorFunc){
		$.ajax({
			async:false,
			type: method,
			data: JSON.stringify(obj),
			url: url, 
			dataType: "json",
			contentType:"application/json; charset=UTF-8",
			success: successFunc,
			error: errorFunc
			
		});
	}
    </script>