<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />

<style>
	
.list-side .item-side .link-side {
  background-color: #150050; 
}
.list-side .item-side .link-side.btn-light{
  background-color: antiquewhite;
}
.sublist-side .subitem-side .sublink-side.btn-outline-danger {
  background-color: antiquewhite;
}

</style>
<sidebar>
	<ul class="list-side ">
		<li class="item-side team-name this-teamMenu commu-submenu__color">
			<a href="#" class="link-main-menu">리그소개</a>
			<div class="list-sub-menu off">
				<ul class="sublist-side">
					<li class="subitem-side">
						<a class="sublink-side btn" href="#">
							<span class="menu-title">리그소개</span>
						</a>
					</li>
					<li class="subitem-side">
						<a class="sublink-side btn" href="#">
							<span class="menu-title">리그규정</span>
						</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="item-side">
			<a href="#" class="link-main-menu">리그일정</a>
			<div class="list-sub-menu off">
				<ul class="sublist-side">
					<li class="subitem-side">
						<a class="sublink-side" href="<c:url value='/league/schedule'></c:url>">
							<span class="menu-title">리그일정/결과</span>
						</a>
					</li>
					<li class="subitem-side">
						<a class="sublink-side" href="<c:url value='/league/enroll'></c:url>">
							<span class="menu-title">리그경기신청</span>
						</a>
					</li>
					<li class="subitem-side">
						<a class="sublink-side" href="<c:url value='/league/schedulemanagerment'></c:url>">
							<span class="menu-title">리그관리</span>
						</a>
					</li>
				</ul>
			</div>
		</li>
		<li class="item-side">
			<a href="<c:url value='/league/recodeHit'></c:url>" class="link-main-menu">기록실</a>
			<div class="list-sub-menu off">
				<ul class="sublist-side">
					<li class="subitem-side">
						<a class="sublink-side" href="<c:url value='/league/recodeHit'></c:url>">
							<span class="menu-title">선수기록</span>
						</a>
					</li>
					<li class="subitem-side">
						<a class="sublink-side" href="<c:url value='/league/recodeTeam'></c:url>">
							<span class="menu-title">팀순위</span>
						</a>
					</li>
				</ul>
			</div>
		</li>
	</ul>
</sidebar>

