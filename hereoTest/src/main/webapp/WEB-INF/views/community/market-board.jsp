<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/community/market-board.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/community/community-common.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />

<main class="market-main">
      <span class="market__title">중고거래</span>
      <p class="market__notice">
        💡 히어로의 중고거래 게시판 거래품목은 야구물품에 한정함을 알려드립니다.
      </p>
      <div class="market__region">
        <div
          class="market__region-select region-all"
          style="background-color: #95cd41"
        >
          <a href="#">#전체</a>
        </div>
        <div
          class="market__region-select region-seoul"
          style="background-color: #c7f2a4"
        >
          <a href="#">#서울</a>
        </div>
        <div
          class="market__region-select region-kungGi"
          style="background-color: #c7f2a4"
        >
          <a href="#">#경기</a>
        </div>
      </div>
      <div class="market__buyAndSell">
        <div class="market__sell" style="background-color: #ffd384">
          <a href="#">#팝니다</a>
        </div>
        <div class="market__buy" style="background-color: #fff9b0">
          <a href="#">#삽니다</a>
        </div>
      </div>
      <div class="market__contents">
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
                        <c:forEach items="${market_board}" var="mk" varStatus="no">
	             <tr>
	                <td><c:out value="${fn:length(market_board) - no.index}" /></td>
	                <td>${mk.bo_region}</td>
	                <td>${mk.bo_state}</td>
	                <td class="market__contents-title"><a href="<c:url value='/community/content/${mk.bo_num}'></c:url>">${mk.bo_title }</a></td>
	                <td>${mk.me_nickname }</td>
	                <td>${mk.bo_view }</td>
	                <td>${mk.bo_register_date_str2 }</td>
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
              <option style="font-size: 14px">판매 완료</option>
              <option style="font-size: 14px">판매중</option>
              <option style="font-size: 14px">삽니다</option>
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