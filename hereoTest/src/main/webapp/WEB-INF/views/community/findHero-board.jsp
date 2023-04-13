<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
              <tr>
                <td>10</td>
                <td>서울</td>
                <td>모집중</td>
                <td class="free__contents-title">
                  <a href="#">타자 구해요</a>
                </td>
                <td>BASEBALL</td>
                <td>17</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>9</td>
                <td>서울</td>
                <td>모집중</td>
                <td class="free__contents-title">
                  <a href="#">이번달 28일</a>
                </td>
                <td>BASEBALL</td>
                <td>17</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>8</td>
                <td>서울</td>
                <td>모집중</td>
                <td class="free__contents-title">
                  <a href="#">내야수 구해요</a>
                </td>
                <td>BASEBALL</td>
                <td>17</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>7</td>
                <td>경기</td>
                <td>모집중</td>
                <td class="free__contents-title">
                  <a href="#">이번주 경기 뛰는거 가능?</a>
                </td>
                <td>BASEBALL</td>
                <td>17</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>6</td>
                <td>서울</td>
                <td>모집 완료</td>
                <td class="free__contents-title">
                  <a href="#">급해요 빨리 연락주세요</a>
                </td>
                <td>kia</td>
                <td>11</td>
                <td>02-22-14:55</td>
              </tr>
              <tr>
                <td>5</td>
                <td>서울</td>
                <td>모집중</td>
                <td class="free__contents-title">
                  <a href="#">ㅇㅇ팀 ㅇㅇ포지션 필요</a>
                </td>
                <td>uoooi</td>
                <td>25</td>
                <td>02-22-12:15</td>
              </tr>
              <tr>
                <td>4</td>
                <td>경기</td>
                <td>모집중</td>
                <td class="free__contents-title">
                  <a href="#">타자 구합니다</a>
                </td>
                <td>hi</td>
                <td>16</td>
                <td>02-21-22:55</td>
              </tr>
              <tr>
                <td>3</td>
                <td>경기</td>
                <td>모집 완료</td>
                <td class="free__contents-title">
                  <a href="#">구인 완</a>
                </td>
                <td>soccer</td>
                <td>30</td>
                <td>02-21-20:17</td>
              </tr>
              <tr>
                <td>2</td>
                <td>서울</td>
                <td>모집 완료</td>
                <td class="free__contents-title"><a href="#">연락xx</a></td>
                <td>BASEBALL</td>
                <td>3</td>
                <td>02-22-17:55</td>
              </tr>
              <tr>
                <td>1</td>
                <td>서울</td>
                <td>모집중</td>
                <td class="free__contents-title">
                  <a href="#">빠른 연락 부탁드림</a>
                </td>
                <td>BASEBALL</td>
                <td>4</td>
                <td>02-22-17:55</td>
              </tr>
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