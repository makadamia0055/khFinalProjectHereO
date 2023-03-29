<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />

<section>
	<div class="btn-group-vertical">
	  <a href="<c:url value='/admin/team_create'></c:url>" type="button" class="btn btn-primary btn-lg">팀 개설 관리</a>
	  <a href="<c:url value='/admin/team_create'></c:url>" type="button" class="btn btn-primary btn-lg">기존 팀 관리</a>
	  <a type="button" class="btn btn-primary btn-lg">Sony</a>
	</div>
</section>