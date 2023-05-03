<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/community/findHero-board.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/community/community-common.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />

<main class="hero-main">
      <span class="hero__title">용병구해요</span><br />
      <div class="hero__region">
        <div class="hero__region-select region-all"><a href="<c:url value='/community/findHero'></c:url>">#전체</a></div>
        <div class="hero__region-select region-seoul">
          <a href="<c:url value='/community/findHero?bo_region=서울'></c:url>">#서울</a>
        </div>
        <div class="hero__region-select region-kungGi">
          <a href="<c:url value='/community/findHero?bo_region=경기'></c:url>">#경기</a>
        </div>        
      </div>
      <div class="hero__region-select hero__state" style="background-color: #B9F3FC">
         <a href="<c:url value='/community/findHero?bo_state=모집중'></c:url>">#모집중</a>
      </div>
      <div class="hero__contents">
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="colgroup" width="7%">#</th>
                <th scope="colgroup" width="8%">지역</th>
                <th scope="colgroup" width="10%">현황</th>
                <th scope="colgroup" width="40%">글제목</th>
                <th scope="colgroup" width="15%">작성자</th>
                <th scope="colgroup" width="10%">조회수</th>
                <th scope="colgroup" width="10%">작성일자</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${hero_board}" var="hr" varStatus="no">
	             <tr>
	                <td><c:out value="${pm.totalCount - pm.cri.pageStart - no.index}" /></td>
	                <td>${hr.bo_region}</td>
	                <td>${hr.bo_state}</td>
	                <td class="hero__contents-title"><a href="<c:url value='/community/content/${hr.bo_num}'></c:url>">${hr.bo_title }</a></td>
	                <td>${hr.me_nickname }</td>
	                <td>${hr.bo_view }</td>
	                <td>${hr.bo_register_date_str2 }</td>
              	</tr>
              </c:forEach>
            </tbody>
          </table>
          <div class="writeBoard-btnBox"><a href="<c:url value='/community/writing/${bt_num}'></c:url>"><button type="button" class="writeBoard-btn">글쓰기</button></a></div>
          <div class="commu-common__pageNum">
            <ul class="pagination pagination-sm">
              <c:if test="${pm.prev}">
              	<li class="page-item">
                	<a class="page-link text-secondary" href="<c:url value='/community/findHero?page=${pm.startPage-1}
                		&search=${pm.cri.search}&type=${pm.cri.type} }'></c:url>">◀</a>
              	</li>
              </c:if>	
              <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
              	<li class="page-item <c:if test="${pm.cri.page ==i}"> active </c:if>">
                	<a class="page-link text-secondary" href="<c:url value='/community/findHero?page=${i}&search=${pm.cri.search}&type=${pm.cri.type}'></c:url>">${i}</a>
             	</li>
             </c:forEach>
             <c:if test="${pm.next}">
              <li class="page-item">
                <a class="page-link text-secondary" href="<c:url value='/community/findHero?page=${pm.endPage+1}
                		&search=${pm.cri.search}&type=${pm.cri.type} }'></c:url>">▶</a>
              </li>
             </c:if> 
            </ul>
          </div>
        <form>  
          <div class="commu-common__search">
            <select name="searchType">
              <option style="font-size: 14px" value="bo_title" <c:if test="${pm.cri.searchType == 'bo_title'}">selected</c:if>>제목</option>
              <option style="font-size: 14px" value="me_nickname" <c:if test="${pm.cri.searchType == 'me_nickname'}">selected</c:if>>작성자</option>
            </select>
            <input type="text" class="commu-common__search-input" name="searchName" value="${pm.cri.searchName}" />
			<a href="<c:url value='/community/findHero?searchType=${pm.cri.searchType}&searchName=${pm.cri.searchName } '></c:url>"><button type="submit" class="commu-common__search-btn">검색</button></a>
          </div>
        </form>
      </div>
    </main>