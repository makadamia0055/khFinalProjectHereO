<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />

<section class="team-board-main ">
	<div class="container-board">
			<div class="title-board">
				<strong><i class="fa-solid fa-baseball"></i> &nbsp;팀 게시판</strong>
				<p>${team.tm_name } 팀 게시판입니다.</p>
			</div>
			<div class="box-board">
					<ul class="list-board">
						<li class="item-board top">
							<div class="num">번호</div>
							<div class="category">말머리</div>
							<div class="title">제목</div>
							<div class="writer">작성자</div>
							<div class="date">작성일</div>
							<div class="updown">추천수</div>
							<div class="view">조회수</div>
							
						</li>
						<c:if test="${empty boardList}">
							<li>
								<div class="text-center">등록된 게시글이 없습니다.</div>
							</li>
						</c:if>
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
						<c:forEach items="${boardList}" var="bo" varStatus="idx">
							<li class="item-board item">
								<div class="num">${bo.bo_num}</div>
								<div class="category">
									<c:forEach items="${categoryList}" var="ct">
										<c:if test="${not empty ct && bo.bo_bc_num == ct.bc_num}">${ct.bc_name}</c:if>
									</c:forEach>
								</div>
								<div class="title"><a href="<c:url value='/team/board_detail?teamNum=${team.tm_num }&boNum=${bo.bo_num }'></c:url>" class="">${bo.bo_title }</a></div>
								<div class="writer">${bo.bo_me_id }</div>
								<fmt:parseDate value = "${bo.bo_register_date_str}" pattern = "yyyy-MM-dd" var = "boDate"/>
								<fmt:formatDate value="${boDate}" pattern = "yyyy-MM-dd" var="boDateStr"/>
								
								<div class="date">
								
									<c:choose>
										<c:when test="${boDateStr == sysDate}">
											<fmt:formatDate value = "${bo.bo_register_date}" pattern = "HH:mm:ss"/>
										</c:when>	
										<c:otherwise>
											${boDateStr}
										</c:otherwise>
									
									</c:choose>
								
								
								</div>
								<div class="updown">${bo.bo_up } / -${ bo.bo_down }</div>
								<div class="view">${bo.bo_view }</div>
							</li>
						</c:forEach>
						
					</ul>
				<div class="board-pagenation">
					<ul class="pagination justify-content-center">
						<c:if test="${pm.prev}">
							<li class="page-item prev"><a href="<c:url value='/team/main?page=${pm.startPage - 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">이전</a></li>
						</c:if>
						<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
							<li class="page-item
								<c:if test='${index == pm.cri.page  }'> active </c:if> ">
								<a href="<c:url value='/team/main?page=${index}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">${index}</a>
							</li>
						</c:forEach>
						<c:if test="${pm.next}">
							<li class="page-item next"><a href="<c:url value='/team/main?page=${pm.startPage + 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">다음</a></li>
						</c:if>
					</ul>
					
				</div>
				<div class="btnBox-board">
					<a href="<c:url value='/team/board_write?teamNum=${team.tm_num }'></c:url>" class="btn-on">글 등록</a>
					<!-- <a href="#" class="">수정</a> -->
				</div>
			</div>
		</div>
	</section>
</body>
<script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
		
