<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />

<section>
	<h2>팀 개설 신청 확인</h2>
	<hr>
	<form method="POST">
		<div class="">희망 팀 이름 : ${team.tm_name }	</div>
		<div>신청인(팀장) : ${team.tm_me_id}</div>
		<div>팀 슬로건 : ${team.tm_slogan }</div>
		<div>연고지 : ${team.tm_re_num }</div>
		<div>연습경기 허용 여부 : ${team.tm_openformatch }</div>
		<div>팀 성별 구성 : ${team.tm_teamgender }</div>
		<div>팀 상태 : ${team.tm_teamstate}</div>
		<div>팀 로고 : 
		<c:choose>
			<c:when test="${empty team.tm_team_img }">X</c:when>
			<c:otherwise><img class="item-team_img" src="<c:url value='/files${team.tm_team_img }'></c:url>">							
			</c:otherwise>
		</c:choose>
		<input class="teamstate" name="teamState" type="text" hidden>
		<input class="teamstate" name="teamNum" type="text" value="${team.tm_num }" hidden>
		<br><br><br>
		<hr>
	<button class="btn btn-success btn-submit btn-lg col-3" data-approve="3" hidden>승인</button>
	<button class="btn btn-danger btn-submit btn-lg col-3" data-approve="2" hidden>거절</button>	
	</form>
	<a class="btn btn-primary" href="<c:url value='/team/adteam_manage'></c:url>" role="button">목록으로</a>

</section>
<script>
	$('.btn-submit').click(function(e){
		e.preventDefault();
		let res = $(this).data('approve');
		$('.teamstate').val(res);
		$('form').submit();	
	})
	
</script>