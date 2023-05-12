<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<style>
	.stadium-infoList{
	   position: absolute;  left: 20%;  margin-left: 30px;
	   padding: 20px 0 20px 0; box-sizing: border-box; 
	   border-radius: 10px;  margin-top: 150px;
	}
	.stadium-list-table{
	    width: 950px;
	}
	.top{
	padding: 10px; display: flex; width: 100%;
	align-items: center; justify-content: space-between;
	list-style: none;
	}
	.header {
	display: flex;
	font-weight: bold;
	background-color: #f0f0f0;
	}
	.cell {
	padding: 5px; text-align: center;
	flex: 1; width: calc(16.66666666667%);
	}
	b{font-size: 18px;}
	.body {
	display: flex;
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
	align-items: center;
	}
	td a:hover{text-decoration: underline; color: #007bff;}
	.btn-groups{
	    float: left;
	}
	</style>
	<div class="stadium-infoList">
        <div class="top">
			<span><b>구장 등록 요청 리스트</b></span>
			<a href="<c:url value="/reservation/stadium/insert"></c:url>">
				<button type="button" class="btn btn-primary btn-ins">구장등록</button>
			</a>
		</div>
        <div class="stadium-list-table">
            <div class="header">
                <div class="cell header-item">번호</div>
                <div class="cell header-item">구장이름</div>
                <div class="cell header-item">아이디</div>
                <div class="cell header-item">등록요청일자</div>
                <div class="cell header-item">예약일정</div>
                <div class="cell header-item">승인 여부</div>
                <div class="cell header-item">비고</div>
            </div>
            
            <div class="body">
            	<c:forEach items="${list}" var="sd" varStatus="vs">            		
					    <div class="cell">${sd.sd_num}</div>
					    <div class="cell">
					      <a href="<c:url value='/reservation/stadium/detail/${sd.sd_num}'/>">${sd.sd_name}</a>
					    </div>
					    <div class="cell">${sd.sd_me_id}</div>
					    <div class="cell">${sd.sd_register_date_str}</div>
					    <div class="cell">
					      <a href="<c:url value='/reservation/stadium/timetable'/>" class="btn btn-primary btn-sm" role="button">예약 일정</a>
					    </div>
					    <div class="cell">${sd.sd_confirm}</div>
					    <div class="cell btn-groups">
					      <button class="btn btn-outline-warning btn-sm">수정</button>
					      <button class="btn btn-outline-danger btn-sm">삭제</button>
					    </div>			  	
            	</c:forEach>
           
            </div>            
        </div>        
    </div>