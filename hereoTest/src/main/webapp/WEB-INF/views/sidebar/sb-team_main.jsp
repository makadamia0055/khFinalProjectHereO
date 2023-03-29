<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
.list-side {
  position: relative;
  background-color: transparent;
}

.list-side .item-side .link-side {
  text-align: left;
  padding-left: 10px;
  background-color: #150050;
  
}
.list-side .item-side .link-side.btn-light{
  background-color: antiquewhite;
}


.sublist-side .subitem-side {
  margin-left: 10px;
}
.sublist-side .subitem-side .sublink-side {
  padding: 10px;
  text-align: left;
}
.sublist-side .subitem-side .sublink-side.btn-outline-danger {
  background-color: antiquewhite;
}

</style>
<c:choose>
	<c:when test="${not empty team}">
		<c:set value="${team}" scope="session" var="tm" />
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
			<c:when test="${not empty team}">
				다른 팀 보기
			</c:when>
			<c:otherwise>
				전체 팀 보기
			</c:otherwise>
		</c:choose>
          
        </a
        >
      </li>
      <li class="item-side team-name this-teamMenu">
        <a
          href="#demo1"
          class="link-side btn btn-light col-lg-12"
          data-toggle="collapse"
          >${tm.tm_name } 팀 메뉴</a
        >
        <div id="demo1" class="collapse">
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
                href="../board/team-sep-board_main.html"
                class="sublink-side btn btn-outline-danger col-sm-8"
                >팀 게시판</a
              >
            </li>
          </ul>
        </div>
      </li>
      <li class="item-side team-name">
        <a
          href="#demo"
          class="link-side btn btn-light col-lg-12"
          data-toggle="collapse"
          >우리 팀 메뉴</a
        >
        <div id="demo" class="collapse">
          <ul class="sublist-side">
            <li class="subitem-side">
              <a
                href="<c:url value='/team/sep?teanNum=${team.tm_num }'></c:url>"
                class="sublink-side btn btn-danger col-sm-8"
                >팀 메인페이지</a
              >
            </li>
            <li class="subitem-side">
              <a
                href="<c:url value='/team/record?teamNum=${team.tm_num }'></c:url>"
                class="sublink-side btn btn-outline-danger col-sm-8"
                >경기 기록실</a
              >
            </li>
            <li class="subitem-side">
              <a
                href="<c:url value='/team/wholeplayer?teamNum=${team.tm_num }'></c:url>"
                class="sublink-side btn btn-danger col-sm-8"
                >전체 선수 리스트</a
              >
            </li>
            <li class="subitem-side">
              <a
                href="../board/team-sep-board_main.html"
                target="_parent"
                class="sublink-side btn btn-outline-danger col-sm-8"
                >팀 게시판</a
              >
            </li>
            <li class="subitem-side">
              <a
                href="../join-control/team-join-board_main.html"
                target="_parent"
                class="sublink-side btn btn-danger col-sm-8"
                >팀 가입 관리 게시판</a
              >
            </li>
          </ul>
        </div>
      </li>
      <li class="item-side">
        <a
          href="<c:url value='/team/join'></c:url>"
          
          class="link-side btn btn-outline-light col-lg-12"
          >가입신청</a
        >
      </li>
      <li class="item-side">
        <a
          href="<c:url value='/admin'></c:url>"
          class="link-side btn btn-light col-lg-12"
          >관리자 메뉴</a
        >
      </li>
    </ul>