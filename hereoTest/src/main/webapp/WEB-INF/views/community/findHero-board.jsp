<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/community/findHero-board.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/community/community-common.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />

<main class="hero-main">
      <span class="hero__title">용병구해요</span><br />
      <div class="hero__region">
        <div class="hero__region-select region-all"><a href="#">#전체</a></div>
        <div class="hero__region-select region-seoul">
          <a href="#">#서울</a>
        </div>
        <div class="hero__region-select region-kungGi">
          <a href="#">#경기</a>
        </div>
      </div>
      <div class="hero__contents">
        <form>
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
              <li class="page-item">
                <a class="page-link text-secondary" href="#">◀</a>
              </li>
              <li class="page-item">
                <a class="page-link text-secondary" href="#">1</a>
              </li>
              <li class="page-item">
                <a class="page-link text-secondary" href="#">2</a>
              </li>
              <li class="page-item">
                <a class="page-link text-secondary" href="#">3</a>
              </li>
              <li class="page-item">
                <a class="page-link text-secondary" href="#">4</a>
              </li>
              <li class="page-item">
                <a class="page-link text-secondary" href="#">5</a>
              </li>
              <li class="page-item">
                <a class="page-link text-secondary" href="#">▶</a>
              </li>
            </ul>
          </div>
          <div class="commu-common__search">
            <select>
              <option style="font-size: 14px">제목</option>
              <option style="font-size: 14px">작성자</option>
              <option style="font-size: 14px">모집 완료</option>
              <option style="font-size: 14px">모집중</option>
            </select>
            <input type="text" class="commu-common__search-input" />
            <input
              type="button"
              value="검색"
              class="commu-common__search-btn"
            />
          </div>
        </form>
      </div>
    </main>