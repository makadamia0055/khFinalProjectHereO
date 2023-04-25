<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/community/eventAcid-board.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/community/community-common.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />
<main class="accid-main">
      <span class="accid__title">사건사고 게시판</span><br />
      <p class="accid__notice">🔥 사건사고 게시판은 익명게시판입니다.</p>
      <div class="accid__contents">
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="colgroup" width="10%">#</th>
                <th scope="colgroup" width="70%">글제목</th>
                <th scope="colgroup" width="10%">조회수</th>
                <th scope="colgroup" width="10%">작성일자</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${acid_board}" var="ac" varStatus="no">
	             <tr>
	                <td><c:out value="${pm.totalCount - pm.cri.pageStart - no.index}" /></td>
	                <td class="acid__contents-title"><a href="<c:url value='/community/content/${ac.bo_num}'></c:url>">${ac.bo_title }</a></td>
	                <td>${ac.bo_view }</td>
	                <td>${ac.bo_register_date_str2 }</td>
              	</tr>
              </c:forEach>
            </tbody>
          </table>
          <div class="writeBoard-btnBox"><a href="<c:url value='/community/writing/${bt_num}'></c:url>"><button type="button" class="writeBoard-btn">글쓰기</button></a></div>
          <div class="commu-common__pageNum">
            <ul class="pagination pagination-sm">
             <c:if test="${pm.prev}">
              	<li class="page-item">
                	<a class="page-link text-secondary" href="<c:url value='/community/eventAcid?page=${pm.startPage-1}
                		&search=${pm.cri.search}&type=${pm.cri.type} }'></c:url>">◀</a>
              	</li>
              </c:if>	
              <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
              	<li class="page-item <c:if test="${pm.cri.page ==i}"> active </c:if>">
                	<a class="page-link text-secondary" href="<c:url value='/community/eventAcid?page=${i}&search=${pm.cri.search}&type=${pm.cri.type}'></c:url>">${i}</a>
             	</li>
             </c:forEach>
             <c:if test="${pm.next}">
              <li class="page-item">
                <a class="page-link text-secondary" href="<c:url value='/community/eventAcid?page=${pm.endPage+1}
                		&search=${pm.cri.search}&type=${pm.cri.type} }'></c:url>">▶</a>
              </li>
             </c:if> 
            </ul>
          </div>
         <form> 
          <div class="commu-common__search">
            <select name="searchType">
              <option style="font-size: 14px" class="freeBoard-opt"value="bo_title" <c:if test="${pm.cri.searchType == 'bo_title'}">selected</c:if>>제목</option>
            </select>
            <input type="text" class="commu-common__search-input" name="searchName" value="${pm.cri.searchName}" />
            <a href="<c:url value='/community/eventAcid?searchType=${pm.cri.searchType}&searchName=${pm.cri.searchName } '></c:url>"><button type="submit" class="commu-common__search-btn">검색</button></a>
          </div>
        </form>
      </div>
    </main>

    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
