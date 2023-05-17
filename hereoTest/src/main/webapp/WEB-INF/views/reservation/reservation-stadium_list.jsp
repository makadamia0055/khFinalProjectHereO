<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reservation-stadium_list.css'></c:url>"/>
	<div class="stadium-infoList">
        <div class="top">
			<span><b>구장 등록 요청 리스트</b></span>
			<a href="<c:url value="/reservation/stadium/insert"></c:url>">
				<button type="button" class="btn btn-primary btn-ins">구장등록</button>
			</a>
		</div>
        <table class="stadium-list-table">
            <tr class="header">
                <th class="cell header-item">번호</th>
                <th class="cell header-item">구장이름</th>
                <th class="cell header-item">아이디</th>
                <th class="cell header-item">등록요청일자</th>
                <th class="cell header-item">예약일정</th>
                <th class="cell header-item">승인 여부</th>
                <th class="cell header-item">비고</th>
            </tr>
            <c:forEach items="${list}" var="sd" varStatus="vs">                 
	            <tr class="body">       		
						    <td class="cell">${sd.sd_num}</td>
						    <td class="cell">
						      <a href="<c:url value='/reservation/stadium/detail/${sd.sd_num}'/>">${sd.sd_name}</a>
						    </td>
						    <td class="cell">${sd.sd_me_id}</td>
						    <td class="cell">${sd.sd_register_date_str}</td>
						    <td class="cell">
						      <a href="<c:url value='/reservation/stadium/timetable'/>" class="btn btn-primary btn-sm" role="button">예약 일정</a>
						    </td>
						    <td class="cell">${sd.sd_confirm}</td>
						    <td class="cell btn-groups">
						    	<div>
						    		<button type="button" class="btn btn-outline-warning btn-sm">수정</button>
						      		<button type="button" class="btn btn-outline-danger btn-sm">삭제</button>
						    	</div>
						    </td>			  	          
	            </tr>            
            </c:forEach> 
        </table>        
    </div>