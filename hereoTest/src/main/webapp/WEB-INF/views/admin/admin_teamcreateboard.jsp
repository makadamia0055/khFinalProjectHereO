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
		<div class="">희망 팀 이름 : ${TAL.team.tm_name }	</div>
		<div>신청인(팀장) : ${TAL.team.tm_me_id}</div>
		<div>신청일 :<fmt:formatDate type="both" pattern = "yyyy-MM-dd HH:mm" value="${TAL.ta_register_date}"></fmt:formatDate></div>
		<div>팀 슬로건 : ${TAL.team.tm_slogan }</div>
		<div>연고지 : ${TAL.team.tm_re_num }</div>
		<div>연습경기 허용 여부 : ${TAL.team.tm_openformatch }</div>
		<div>팀 성별 구성 : ${TAL.team.tm_teamgender }</div>
		<div>팀 상태 : ${TAL.team.tm_teamstate}</div>
		<div>팀 로고 : <img src="<c:url value='/files${TAL.team.tm_team_img }'></c:url>"></div>
		<input class="teamstate" name="teamState" type="text" hidden>
		<input class="teamstate" name="teamNum" type="text" value="${TAL.ta_tm_num }" hidden>
	<button class="btn btn-success btn-submit btn-lg col-3" data-approve="3">승인</button>
	<button class="btn btn-danger btn-submit btn-lg col-3" data-approve="2" >거절</button>	
	</form>
	<a class="btn btn-primary" href="<c:url value='/admin/team_create'></c:url>" role="button">목록으로</a>

</section>
<script>
	$('.btn-submit').click(function(e){
		e.preventDefault();
		let res = $(this).data('approve');
		$('.teamstate').val(res);
		$('form').submit();	
	})
	
</script>