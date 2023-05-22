<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/league/league-enroll.css'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>



<div class="container-box">
<div class="middle-box mt-2">
		<div class="filter-box">
			<div class="form-group">
				<label for="league-name"></label>
				<select class="form-control" id="league-name">
					<option>전체</option>
				<c:forEach items="${laList }" var="la">
					<option value="${la.la_name }">${la.la_name }</option>
				</c:forEach>
				</select>
			</div>
			<button type="button" class="btn btn-outline-secondary">검색</button>
		</div>
		<div class="bottom-box">
			<table class="table">
				<thead>
					<tr>
						<th style="width: 5%">번호</th>
						<th style="width: 7%">년도</th>
						<th style="width: 20%">리그이름</th>
						<th style="width: 20%">리그타입</th>
						<th style="width: 5%">신청팀</th>
						<th style="width: 10%">모집현황</th>
						<th style="width: 15%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${laList }" var="la" varStatus="vs">
						<tr>
							<td>${vs.index+1 }<input type="hidden" value="${la.la_num }" name="la_num"></td>
							<td>${la.la_start_date_str }</td>
							<td>${la.la_name }</td>
							<td>${la.la_match_type }</td>
							<td>
								
							</td>
							<td>
								<c:if test="${la.la_team_state == '모집완료' }">
									<button type="button" class="btn btn-danger">모집완료</button>
								</c:if>
								<c:if test="${la.la_team_state == '모집중' }">
									<button type="button" class="btn btn-info">모집중</button>
								</c:if>
							</td>
							<td>
								<c:if test="${la.la_team_state == '모집완료' }">
									<button type="button" class="btn btn-outline-danger">신청불가</button>
								</c:if>
								<c:if test="${la.la_team_state == '모집중' }">
									<button type="button" class="btn btn-outline-success btn-application">신청</button>
									<button type="button" class="btn btn-outline-danger btn-cancell">취소</button>
								</c:if>
								
							</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
	$('.btn-application').click(function(){
		if('${member.me_id}' == ''){
			alert('로그인한 회원만 신청이 가능합니다.');
			return;
		}
		//리스트에 있는 값이여서 값을 찾아와야함
		let la_num = $(this).parents('tr').find('[name=la_num]').val();
		let url = '<c:url value="/league/team/appli/"></c:url>'+la_num;
		
		$.ajax({
	        async:true,
	        type:'get',
	        url: url,
	        dataType:"json",//서버에서 보낸 데이터의 타입. Map받으로 받을거기 때문에 json
	        success : function(data){
	        	if(data.res == 3){
	        		alert('이미 참가신청이 되어있습니다.');
	        	}else if(data.res == 2){
	        		alert('참가신청을 했습니다.');
	        	}
	        }
	    });
	});
	
	$('.btn-cancell').click(function(){

	});
</script>