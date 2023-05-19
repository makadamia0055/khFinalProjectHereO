<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />

<style>
/* 사이드바 */
*{list-style: none;  text-decoration: none; padding: 0; margin: 0;}
.reservation-sidebar {
  position: fixed;
  z-index: 99;
  top: 120px;
  padding-top: 30px;
  width: calc(18%);
  height: 100vh;
  float: left;
  clear: both;
}
.reservation-sidebar iframe{
  width: 100%;
  height: 100%;
  background-color: white;
}
.list-side{
  position: relative;
}
.list-side .item-side .link-side,.list-side .item-side .subitem-side .sublink-side{
  text-align: left;
}
/* 사이드메뉴 색깔 클래스 */
.reserve-submenu__color {
  background-color: white;
  color : black;
      }
</style>
<sidebar>
	<ul class="list-side">
      <li class="item-side reservationMenu">
         <a href="#demo1" class="link-side btn btn-light col-md" data-toggle="collapse">실시간 예약하기</a>
         <div id="demo1" class="collapse">
            <ul class="sublist-side">
               <li class="subitem-side">                          
                  <a href="<c:url value='/reservation/main'></c:url>" target="_parent"  class="sublink-side btn btn-secondary col-sm-3">예약하기</a>
               </li>
               <li class="subitem-side">
                  <a href="../reservation/stadium-reservation_league.html" target="_parent"  class="sublink-side btn btn-secondary col-sm-3">리그 예약하기</a>
               </li>        
            </ul>
         </div>
      </li>
      <li class="item-side">
         <a href="<c:url value='/reservation/check'></c:url>" target="_parent" class="link-side btn btn-light col-md">예약 확인</a>
      </li>
      <li class="item-side">
         <a href="<c:url value='/reservation/stadium/list'></c:url>" target="_parent"  class="link-side btn btn-light col-md">구장 등록</a>
      </li>
      <c:if test="${not empty loginUser && loginUser.me_siteauth==9 }">
      	<li class="item-side reservationAdmin">
	         <a href="#demo2" class="link-side btn btn-light col-md" data-toggle="collapse">관리자 메뉴</a>
	         <div id="demo2" class="collapse">
	            <ul class="sublist-side">
	               <li class="subitem-side">
	                  <a href="<c:url value='/reservation/stadium/list'></c:url>" target="_parent"  class="sublink-side btn btn-secondary col-sm-3">구장 관리</a>
	               </li>
	               <li class="subitem-side">
	                  <a href="#" target="_parent"  class="sublink-side btn btn-secondary col-sm-3">기록 관리</a>
	               </li>                       
	            </ul>
	         </div>
	      </li>
      </c:if>
   </ul> 
 </sidebar>