<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reservation-stadium_list.css'></c:url>"/>
	<div class="stadium-infoList">
        <div class="top">
			<span><b>예약 확인</b></span>
		</div>
        <table class="stadium-list-table">
            <tr class="header">
                <th class="cell header-item">주문번호</th>
                <th class="cell header-item">구장이름</th>
                <th class="cell header-item">예약날짜</th>
                <th class="cell header-item">예약게임</th>
                <th class="cell header-item">시작시간</th>
                <th class="cell header-item">구매상태</th>                         
                <th class="cell header-item">결체취소</th>
            </tr>
            <c:forEach items="${reserveList}" var="r">                 
	            <tr class="body">       		
						    <td class="cell">${r.ss_num}</td>
						    <td class="cell">${r.st.s.sd_name }</td>
						    <td class="cell">${r.ss_game_date}</td>
							<td class="cell">${r.st.st_game_num}</td>	
						    <td class="cell">${r.st.st_start_time}시</td>
						    <td class="cell">${r.ss_state}</td>
						    <c:set var="currentTime" value="<%= new java.util.Date() %>"/>
 	          				<c:choose>
								  <c:when test="${r.ss_game_date_toDate > currentTime && r.ss_state =='결제완료'}">
								  	<td class="cell"><button class="cancel_btn"  data-receipt-id="${r.ss_receipt_id}">취소가능</button></td>
								  </c:when>
								  <c:otherwise>
								    <td class="cell">취소완료</td>
								  </c:otherwise>
							</c:choose>	 
	            </tr>           
            </c:forEach> 
        </table>
        <ul class="pagination pagination-sm">
            	<c:if test="${pm.prev}">
              		<li class="page-item">
                		<a class="page-link text-secondary" href="<c:url value='/reservation/check?page=${pm.startPage-1}'></c:url>">◀</a>
              		</li>
              	</c:if>
              	<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
              		<li class="page-item <c:if test="${pm.cri.page ==i}"> active </c:if>">
                		<a class="page-link text-secondary" href="<c:url value='/reservation/check?page=${i}'></c:url>">${i}</a>
             		 </li>
             	</c:forEach>
              	<c:if test="${pm.next}">	
              		<li class="page-item">
                		<a class="page-link text-secondary" href="<c:url value='/reservation/check?page=${pm.endPage+1}'></c:url>">▶</a>
              		</li>
              	</c:if>	
         </ul>        
    </div>
    <script>
    $('.cancel_btn').click(function(){
        var receipt_id = $(this).data('receipt-id');
		var url='/reservation/check';
    	$.ajax({			
			asyn:true,
			type:'post',
			url:'<c:url value="/reservation/cancel"></c:url>',
			data: {receipt_id:receipt_id},
			success : function(data){
			alert("결제가 취소되었습니다.");
			window.location.href='<%= request.getContextPath() %>'+url;
    	
    	},
        error:function(request,status,error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    	})
    }) 
    </script>