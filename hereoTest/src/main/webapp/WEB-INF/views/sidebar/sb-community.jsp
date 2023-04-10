<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />
  <style>
  	.commu-submenu__color > a,
	.commu-talk_background > a{
	 background-color: #FFE3A9;
	 color : black;
	 border: 1px solid #FFF9D7;
	}
	
	.commu-submenu__color> a:hover {
	  background-color: #FBFACD;
	}
	
	.commu-submenu__selected {
	  background-color: #FBFACD;
	}
  </style>
  <sidebar>  
    <li class="item-side team-name this-teamMenu commu-submenu__color">
      <a
        href="#free-board"
        class="link-side btn btn-light col-lg-12"
        data-toggle="collapse"
        >Talk 이모저모</a
      >
      <div id="free-board" class="collapse">
        <ul class="sublist-side">
          <li class="subitem-side commu-talk_background">
            <a
              href="<c:url value='/community/free'></c:url>"
              class="sublink-side btn btn-danger col-lg-12"
              >자유게시판</a
            >
          </li>
          <li class="subitem-side commu-talk_background">
            <a
              href="<c:url value='/community/eventAcid'></c:url>"
              target="_parent"
              class="sublink-side btn btn-outline-danger col-lg-12"
              >사건 사고 게시판</a
            >
          </li>
        </ul>
      </div>
    </li>
    <li class="item-side commu-submenu__color">
      <a
        href="<c:url value='/community/findHero'></c:url>"
        target="_top"
        class="link-side btn btn-light col-lg-12"
        >용병 구해요</a
      >
    </li>
    <li class="item-side commu-submenu__color">
      <a
        href="<c:url value='/community/market'></c:url>"
        target="_top"
        class="link-side btn btn-light col-lg-12"
        >중고거래</a
      >
    </li>
   <c:if test="${loginUser!=null}"> 
     <li class="item-side commu-submenu__color">
      <a
        href="<c:url value='/community/admin'></c:url>"
        target="_top"
        class="link-side btn btn-light col-lg-12"
        >관리자메뉴</a
      >
    </li>
    </c:if>
  </sidebar>     
    
