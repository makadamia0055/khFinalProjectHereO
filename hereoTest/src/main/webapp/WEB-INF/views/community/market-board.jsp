<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
              <tr>
                <td>10</td>
                <td>서울</td>
                <td>판매중</td>
                <td class="market__contents-title">
                  <a href="#">배트 팝니다</a>
                </td>
                <td>BASEBALL</td>
                <td>17</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>9</td>
                <td>서울</td>
                <td>삽니다</td>
                <td class="market__contents-title">
                  <a href="#">글러브 삽니다</a>
                </td>
                <td>BASEBALL</td>
                <td>17</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>8</td>
                <td>서울</td>
                <td>판매중</td>
                <td class="market__contents-title">
                  <a href="#">글러브 싸게 팔아요</a>
                </td>
                <td>BASEBALL</td>
                <td>17</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>7</td>
                <td>경기</td>
                <td>판매 완료</td>
                <td class="market__contents-title">
                  <a href="#">판매완</a>
                </td>
                <td>BASEBALL</td>
                <td>17</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>6</td>
                <td>서울</td>
                <td>판매중</td>
                <td class="market__contents-title">
                  <a href="#">안쓰는 용품 다 팝니다</a>
                </td>
                <td>kia</td>
                <td>11</td>
                <td>02-22-14:55</td>
              </tr>
              <tr>
                <td>5</td>
                <td>서울</td>
                <td>판매 완료</td>
                <td class="market__contents-title">
                  <a href="#">쪽지xx판매 했음</a>
                </td>
                <td>uoooi</td>
                <td>25</td>
                <td>02-22-12:15</td>
              </tr>
              <tr>
                <td>4</td>
                <td>경기</td>
                <td>판매중</td>
                <td class="market__contents-title">
                  <a href="#">유니폼 팔아요</a>
                </td>
                <td>hi</td>
                <td>16</td>
                <td>02-21-22:55</td>
              </tr>
              <tr>
                <td>3</td>
                <td>경기</td>
                <td>판매 완료</td>
                <td class="market__contents-title">
                  <a href="#">배트 팔아요</a>
                </td>
                <td>soccer</td>
                <td>30</td>
                <td>02-21-20:17</td>
              </tr>
              <tr>
                <td>2</td>
                <td>서울</td>
                <td>판매 완료</td>
                <td class="market__contents-title">
                  <a href="#">모자 팔아요</a>
                </td>
                <td>BASEBALL</td>
                <td>3</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>1</td>
                <td>서울</td>
                <td>판매중</td>
                <td class="market__contents-title">
                  <a href="#">첫번째로 팝니다</a>
                </td>
                <td>BASEBALL</td>
                <td>4</td>
                <td>02-22-17:55</td>
              </tr>
            </tbody>
          </table>
          <div class="writeBoard-btnBox"><a href="<c:url value='/community/writing'></c:url>"><button type="button" class="writeBoard-btn">글쓰기</button></a></div>
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