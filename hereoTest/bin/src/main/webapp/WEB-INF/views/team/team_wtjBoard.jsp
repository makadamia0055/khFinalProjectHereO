<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />

<section>
	<h2>팀 가입 신청 확인</h2>
	<hr>
	<form method="POST">
		<div class="">가입 신청인 id: ${members.me_id}	</div>
		<div>닉네임 : ${members.me_nickname}</div>
		<div>신청일 :<fmt:formatDate type="both" pattern = "yyyy-MM-dd HH:mm" value="${WTJ.tj_register_date}"></fmt:formatDate></div>
		<div>투타 : ${WTJ.tj_player.pl_pitching_hand } ${WTJ.tj_player.pl_hitting_hand}</div>
		<div>선출 여부 : ${WTJ.tj_player.pl_ispro}</div>
		<div>성별 : 
		<c:choose>
			<c:when test="${members.me_gender == 1}">남</c:when>
			<c:otherwise>여</c:otherwise>
		</c:choose> 
		
		</div>
		<div>처리 상태 : ${WTJ.tj_state}</div>
		
		<input name="tj_state" type="text" hidden>
		<input name="tj_num" type="text" value="${WTJ.tj_num}" hidden>
		<br>
		<br>
		<hr>
	<button class="btn btn-success btn-submit btn-lg col-3" data-approve="승인">승인</button>
	<button class="btn btn-secondary btn-submit btn-lg col-3" data-approve="대기" >대기</button>	
	
	<button class="btn btn-danger btn-submit btn-lg col-3" data-approve="거절" >거절</button>	
	</form>
	<a class="btn btn-primary" href="<c:url value='/team/wtjPage'></c:url>" >목록으로</a>

</section>
<script>
	$('.btn-submit').click(function(e){
		e.preventDefault();
		let res = $(this).data('approve');
		$('[name=tj_state]').val(res);
		$('form').submit();	
	})
	
</script>