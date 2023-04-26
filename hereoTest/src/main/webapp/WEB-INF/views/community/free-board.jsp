<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/community/free-board.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/community/community-common.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />
<main class="free-main">
      <span class="free__title">자유게시판</span><br />
      <div class="free__hotTopic">
        <h5 class="free__hotTopic-title">이번주 조회수 T⚾P 5</h5>
        <div class="free_hotTopic-contents">
        	<div class="Top5">
        		<c:forEach items="${topFive}" var="t" varStatus="no">	
        			<span class="topFiveList"><a href="<c:url value='/community/content/${t.bo_num}'></c:url>"><i class="fa-solid fa-fire fire_re"></i>  ${no.count}. ${t.bo_title}</a></span>
        		</c:forEach>
        	</div>	
        </div>
      </div>
      <div class="free__contents">
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="colgroup" width="10%">#</th>
                <th scope="colgroup" width="55%">글제목</th>
                <th scope="colgroup" width="15%">작성자</th>
                <th scope="colgroup" width="10%">조회수</th>
                <th scope="colgroup" width="10%">작성일자</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${free_board}" var="fr" varStatus="no">
	             <tr>
	                <td><c:out value="${pm.totalCount - pm.cri.pageStart - no.index}" /></td>
	                <td class="free__contents-title"><a href="<c:url value='/community/content/${fr.bo_num}'></c:url>">${fr.bo_title }</a></td>
	                <td>${fr.me_nickname }</td>
	                <td>${fr.bo_view }</td>
	                <td>${fr.bo_register_date_str2 }</td>
              	</tr>
              </c:forEach>
            </tbody>
          </table>
          <div class="writeBoard-btnBox"><a href="<c:url value='/community/writing/${bt_num}'></c:url>">
          	<button type="button" class="writeBoard-btn">글쓰기</button>
          	</a>
          </div>
          <div class="commu-common__pageNum">
            <ul class="pagination pagination-sm">
              <c:if test="${pm.prev}">
              	<li class="page-item">
                	<a class="page-link text-secondary" href="<c:url value='/community/free?page=${pm.startPage-1}
                		&search=${pm.cri.search}&type=${pm.cri.type} }'></c:url>">◀</a>
              	</li>
              </c:if>	
              <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
              	<li class="page-item <c:if test="${pm.cri.page ==i}"> active </c:if>">
                	<a class="page-link text-secondary" href="<c:url value='/community/free?page=${i}&search=${pm.cri.search}&type=${pm.cri.type}'></c:url>">${i}</a>
             	</li>
             </c:forEach>
             <c:if test="${pm.next}">
              <li class="page-item">
                <a class="page-link text-secondary" href="<c:url value='/community/free?page=${pm.endPage+1}
                		&search=${pm.cri.search}&type=${pm.cri.type} }'></c:url>">▶</a>
              </li>
             </c:if> 
            </ul>
          </div>
        <form>  
          <div class="commu-common__search">
            <select name="searchType">
              <option style="font-size: 14px" class="freeBoard-opt" value="bo_title" <c:if test="${pm.cri.searchType == 'bo_title'}">selected</c:if>>제목</option>
              <option style="font-size: 14px" class="freeBoard-opt" value="me_nickname" <c:if test="${pm.cri.searchType == 'me_nickname'}">selected</c:if>>작성자</option>
            </select>
            <input type="text" class="commu-common__search-input" name="searchName" value="${pm.cri.searchName}" />
            <a href="<c:url value='/community/free?searchType=${pm.cri.searchType}&searchName=${pm.cri.searchName } '></c:url>"><button type="submit" class="commu-common__search-btn">검색</button></a>
          </div>
        </form>
      </div>
    </main>

    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
