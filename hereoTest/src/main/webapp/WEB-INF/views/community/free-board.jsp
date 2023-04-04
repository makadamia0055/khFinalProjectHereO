<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/community/free-board.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/community/community-common.css'></c:url>" rel="stylesheet" />
<link href="<c:url value='/resources/css/sidebar/sidebar-template.css'></c:url>" rel="stylesheet" />
<main class="free-main">
      <span class="free__title">자유게시판</span><br />
      <div class="free__hotTopic">
        <h5 class="free__hotTopic-title">이번주 조회수 T⚾P 5</h5>
        <div class="free_hotTopic-contents">
          <div class="Top5"><a href="#">1</a></div>
          <div class="Top5"><a href="#">1</a></div>
          <div class="Top5"><a href="#">1</a></div>
          <div class="Top5"><a href="#">1</a></div>
          <div class="Top5"><a href="#">1</a></div>
        </div>
      </div>
      <div class="free__contents">
        <form>
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
              <tr>
                <td>10</td>
                <td class="free__contents-title"><a href="#">반갑습니다</a></td>
                <td>BASEBALL</td>
                <td>17</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>9</td>
                <td class="free__contents-title"><a href="#">반갑습니다</a></td>
                <td>BASEBALL</td>
                <td>17</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>8</td>
                <td class="free__contents-title"><a href="#">반갑습니다</a></td>
                <td>BASEBALL</td>
                <td>17</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>7</td>
                <td class="free__contents-title"><a href="#">반갑습니다</a></td>
                <td>BASEBALL</td>
                <td>17</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>6</td>
                <td class="free__contents-title">
                  <a href="#">이번 주말에 비온다던데</a>
                </td>
                <td>kia</td>
                <td>11</td>
                <td>02-22-14:55</td>
              </tr>
              <tr>
                <td>5</td>
                <td class="free__contents-title">
                  <a href="#">님들 들어와보셈</a>
                </td>
                <td>uoooi</td>
                <td>25</td>
                <td>02-22-12:15</td>
              </tr>
              <tr>
                <td>4</td>
                <td class="free__contents-title">
                  <a href="#">이런 사이트도 생기고 ㅋㅋ</a>
                </td>
                <td>hi</td>
                <td>16</td>
                <td>02-21-22:55</td>
              </tr>
              <tr>
                <td>3</td>
                <td class="free__contents-title">
                  <a href="#">여기서 예약하신분?</a>
                </td>
                <td>soccer</td>
                <td>30</td>
                <td>02-21-20:17</td>
              </tr>
              <tr>
                <td>2</td>
                <td class="free__contents-title"><a href="#">반갑습니다</a></td>
                <td>BASEBALL</td>
                <td>3</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>1</td>
                <td class="free__contents-title"><a href="#">반갑습니다</a></td>
                <td>BASEBALL</td>
                <td>4</td>
                <td>02-22-17:55</td>
              </tr>
            </tbody>
          </table>
          <div class="writeBoard-btnBox"><a href="<c:url value='/community/writing'></c:url>"><button class="writeBoard-btn">글쓰기</button></a></div>
          <div class="commu-common__pageNum">
            <ul class="pagination pagination-sm">
              <li class="page-item prev">
                <a class="page-link text-secondary" href="#">◀</a>
              </li>
              <li class="page-item active">
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
              <li class="page-item next">
                <a class="page-link text-secondary" href="#">▶</a>
              </li>
            </ul>
          </div>
          <div class="commu-common__search">
            <select>
              <option style="font-size: 14px" class="freeBoard-opt">제목</option>
              <option style="font-size: 14px" class="freeBoard-opt">작성자</option>
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

    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
