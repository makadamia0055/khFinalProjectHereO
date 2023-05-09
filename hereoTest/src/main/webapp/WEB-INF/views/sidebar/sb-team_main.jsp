<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
	<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
	
	<c:choose>
		<c:when test="${fn:contains(path, '/team/lineup')}">
			<!-- 라인업 페이지 일 경우 사이드바 -->
			<div>${team.tm_name}팀 라인업</div>
			<div>0월0일 vs xx팀</div>
			<div class="text-center"><h3>선수 리스트</h3></div>
			<hr>
			<div class="d-flex flex-wrap">
			<c:forEach items="${playerList}" var="pl">
				<c:forEach items="${tPlayerList}" var="tp">
					<c:if test="${pl.pl_num == tp.tp_pl_num && tp.tp_auth > 1 }">
						<a href="#" class="box-player" draggable="true" data-tpnum='<c:forEach items="${tPlayerList}" var="tp"><c:if test="${pl.pl_num == tp.tp_pl_num}">${tp.tp_num}</c:if></c:forEach>'>
							<img src="
							<c:choose>
								<c:when test="${empty pl.pl_player_img}">
									<c:url value='/files/defaultlogo.png'></c:url>
								</c:when>
								<c:otherwise>
									<c:url value='/files${pl.pl_player_img}'></c:url>
								</c:otherwise>
							</c:choose>
							" draggable="false" class="icon-player " alt="">
							<br>
							<div class="box-name">
								<span class="bakNum-player">
									<c:forEach items="${tPlayerList}" var="tp">
										<c:if test="${pl.pl_num == tp.tp_pl_num}">${tp.tp_backnum}</c:if>
									</c:forEach>
								</span>.
								<span class="name-player">${pl.me_nickname }</span>
							</div>
							<div class="box-position_hope">
								<c:forEach items="${pl.positionList}" var="po">
									<span class="badge badge-pill badge-danger" data-position="${po.ph_po_num}">${po.ph_po_ko_name}</span>
								</c:forEach>
							</div>
						</a>
						
					
					</c:if>
				</c:forEach>
				
			</c:forEach>
			</div>
			<hr>
			
			
			
		</c:when> 
		<c:otherwise>
		<!-- 라인업 페이지가 아닐 경우 사이드바 -->
			<c:choose>
		<c:when test="${not empty currentTeam}">
			<c:set value="${currentTeam}" scope="page" var="tm" />
		</c:when>
	</c:choose>
    <ul class="list-side">
      <li class="item-side">
        <a
          href="<c:url value='/team/main'></c:url>"
          role="button"
          class="link-side btn btn-outline-light col-lg-12"
          >
        <c:choose>
			<c:when test="${not empty tm}">
				<i class="fa-solid fa-baseball"></i> 다른 팀 보기
			</c:when>
			<c:otherwise>
				<i class="fa-solid fa-baseball"></i> 전체 팀 보기
			</c:otherwise>
		</c:choose>
          
        </a
        >
      </li>
      <c:choose>
			<c:when test="${not empty tm && tm.tm_num != userTeam.tm_num}">
				<li class="item-side team-name this-teamMenu">
			        <a
			          href="#demo1"
			          class="link-side btn btn-light col-lg-12"
			          data-toggle="collapse"
			          >${tm.tm_name } 팀 메뉴</a
			        >
		       	 <div id="demo1" class="collapse show">
		          <ul class="sublist-side">
		            <li class="subitem-side">
		              <a
		                href="<c:url value='/team/sep?teamNum=${tm.tm_num }'></c:url>"
		                class="sublink-side btn btn-danger col-sm-8"
		                >팀 메인페이지</a
		              >
		            </li>
		            <li class="subitem-side">
		              <a
		                href="<c:url value='/team/record?teamNum=${tm.tm_num }'></c:url>"
		                
		                class="sublink-side btn btn-outline-danger col-sm-8"
		                >경기 기록실</a
		              >
		            </li>
		            <li class="subitem-side">
		              <a
		                href="<c:url value='/team/wholeplayer?teamNum=${tm.tm_num }'></c:url>"
		                class="sublink-side btn btn-danger col-sm-8"
		                >전체 선수 리스트</a
		              >
		            </li>
		            <li class="subitem-side">
		              <a
		                href="<c:url value='/team/board_list?teamNum=${tm.tm_num }'></c:url>"
		                class="sublink-side btn btn-outline-danger col-sm-8"
		                >팀 게시판</a
		              >
		            </li>
		          </ul>
		        </div>
		      </li>

			</c:when>
			<c:otherwise>


			</c:otherwise>
		</c:choose>
		<!-- 나중에 유저 팀으로 바꿔야함. -->
		<c:if test="${not empty userTeam}">
			<li class="item-side team-name">
	        <a
	          href="#demo"
	          class="link-side btn btn-light col-lg-12"
	          data-toggle="collapse"
	          ><span class="badge badge-success">${userTeam.tm_name}</span> 우리 팀 메뉴</a
	        >
	        <div id="demo" class="collapse">
	          <ul class="sublist-side">
	            <li class="subitem-side">
	              <a
	                href="<c:url value='/team/sep?teamNum=${userTeam.tm_num }'></c:url>"
	                class="sublink-side btn btn-danger col-sm-8"
	                >팀 메인페이지</a
	              >
	            </li>
	            <li class="subitem-side">
	              <a
	                href="<c:url value='/team/record?teamNum=${userTeam.tm_num }'></c:url>"
	                class="sublink-side btn btn-outline-danger col-sm-8"
	                >경기 기록실</a
	              >
	            </li>
	            <li class="subitem-side">
	              <a
	                href="<c:url value='/team/wholeplayer?teamNum=${userTeam.tm_num }'></c:url>"
	                class="sublink-side btn btn-danger col-sm-8"
	                >전체 선수 리스트</a
	              >
	            </li>
	            <li class="subitem-side">
	              <a
	                href="<c:url value='/team/board_list?teamNum=${userTeam.tm_num }'></c:url>"
	                class="sublink-side btn btn-outline-danger col-sm-8"
	                >팀 게시판</a
	              >
	            </li>
	            <li class="subitem-side">
	              <a
	                href="<c:url value='/team/wtjPage'></c:url>"
	                class="sublink-side btn btn-danger col-sm-8"
	                >팀 가입 관리 게시판</a
	              >
	            </li>
	            <li class="subitem-side">
	              <a
	                href="<c:url value='/team/modify'></c:url>"
	                class="sublink-side btn btn-danger col-sm-8"
	                >팀 정보 수정 게시판(임시)</a
	              >
	            </li>
	          </ul>
	        </div>
	      </li>
		</c:if>
		<c:if test="${not empty loginUser && loginUser.me_siteauth==9 }">
      		<li class="item-side">
		        <a
		          href="<c:url value='/team/admin'></c:url>"
		          class="link-side btn btn-light col-lg-12"
		          >관리자 메뉴</a
		        >
      		</li>
      </c:if>
    </ul>
		</c:otherwise>
	</c:choose>
	
 </sidebar>