<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/league/league-search.css'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>

<div class="container-main">

   <!-- 리그 지역 -->
  <div class="box-main">
    <div class="main-top-region">
      <ul class="list-region">
        <li class="item-region">
          <a  href="<c:url value='/league/leagueSearch?type=0'></c:url>" role="button" data-local="all">전체</a>
        </li>
        <c:forEach items="${region }" var="re">
         <li class="item-region">
           <a href="<c:url value='/league/leagueSearch?type=${re.re_num}&search=${pm.cri.search }'></c:url>" class="link-region btn" role="button" data-local="${re.re_num}">${re.re_sido}</a>
         </li>
        </c:forEach>
      </ul>
    </div>
        
        
    <div class="container-league">
      <ul class="list-league">
	      <c:forEach items="${league }" var="lg">
	        <li class="item-league">
	          <div class="left-box">
	            <a href="<c:url value='/league/main${lg.lg_num}'></c:url>" class="link-league">
	              <img src='<c:url value='/resources/img/league/kbo로고.png'></c:url>' class="item-league-logo"></img>
	            </a>
	          </div>
	          <div class="right-box">
	            리그 이름 : <a href="<c:url value='/league/main${lg.lg_num }'></c:url>" class="link-league">${lg.lg_name }</a><br>
	            리그 상태 : <span>${lg.lg_state }</span>
	          </div>
	        </li>
	      </c:forEach>
      </ul>
      <div class="container-pagenation">
			<ul class="pagination justify-content-center">
				<c:if test="${pm.prev}">
					<li class="page-item prev"><a href="<c:url value='/team/main?page=${pm.startPage - 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">이전</a></li>
				</c:if>
				<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="index">
					<li class="page-item
						<c:if test='${index == pm.cri.page  }'> active </c:if> ">
						<a href="<c:url value='/league/leagueSearch?page=${index}&type=${pm.cri.type }'></c:url>" class="page-link">${index}</a>
					</li>
				</c:forEach>
				<c:if test="${pm.next}">
					<li class="page-item next"><a href="<c:url value='/team/main?page=${pm.startPage + 1}&search=${pm.cri.search}&type=${pm.cri.type }'></c:url>" class="page-link">다음</a></li>
				</c:if>
			</ul>
		</div>
    </div>
  </div>
</div>

