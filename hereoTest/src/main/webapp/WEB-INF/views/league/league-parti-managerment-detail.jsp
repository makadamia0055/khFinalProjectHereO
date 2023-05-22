<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/common/style.css'></c:url>" rel="stylesheet">
<link href="<c:url value='/resources/css/league/league-managerment.css?version=2305182115'></c:url>" rel="stylesheet">
<script  type="text/javascript" src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
<script  type="text/javascript" src="<c:url value='/resources/js/league/league-managerment.js'></c:url>"></script>

<div class="container-box">
	<div class="top-box mt-2">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link schedule" href="<c:url value='/league/schedulemanagerment/${lg_num}'></c:url>">리그일정관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link register active" href="<c:url value='/league/partimanagerment/list/${lg_num}'></c:url>">리그참가관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link create" href="<c:url value='/league/insertType/${lg_num}'></c:url>">리그타입관리</a>
			</li>
		</ul>
	</div>
	<div class="middle-box register mt-2">
		<div class="bottom-box">
			<table class="table">
				<thead>
					<tr>
						<th style="width: 5%">번호</th>
						<th style="width: 15%">로고</th>
						<th style="width: 40%">팀이름</th>
						<th style="width: 5%">팀원수</th>
						<th style="width: 10%">참가승인</th>
					</tr>
				</thead>

				<tbody>	
					<c:forEach items="${lpList }" var="lp" varStatus="vs">
						<tr>
							<td>${vs.index+1 }<input type="hidden" value="${lp.lp_num }" name="lp_num"></td>
							<td>${lp.lp_team.tm_team_img }</td>
							<td>
								<a href=""><input type="hidden" value="${lp.lp_tm_num}" name="lp_tm_num">${lp.lp_team.tm_name }</a>
							</td>
							<td>15</td> <!-- 팀원수 계산 미구현 -->
							<td>
								<select class="select-approval">
									<option value="0" data-state="0" <c:if test="${lp.lp_approval == 0 }">selected</c:if>>대기</option>
									<option value="1" data-state="1" <c:if test="${lp.lp_approval == 1 }">selected</c:if>>거부</option>
									<option value="2" data-state="2" <c:if test="${lp.lp_approval == 2 }">selected</c:if>>승인</option>
								</select>
							</td>
						</tr>
					</c:forEach>
				</tbody>
					<a href="<c:url value='/league/partimanagerment/${lg_num}/detail/${la_num}/save'></c:url>">
						<button type="button" class="btn btn-outline-info btn-save">저장</button>
					</a>
					<a href="<c:url value='/league/partimanagerment/${lg_num}/detail/${la_num}/update'></c:url>">
						<button type="button" class="btn btn-outline-success btn-complete">모집완료</button>
					</a>
						

			</table>
		</div>
	</div>
</div>

<script>
$('.select-approval').change(function(){
	//select박스는 data.state를 사용할수없음
	let lp_approval = $(this).val();
	//리스트에 있는 값이여서 값을 찾아와야함
	let lp_num = $(this).parents('tr').find('[name=lp_num]').val();
	let lp_tm_num = $(this).parents('tr').find('[name=lp_tm_num]').val();
	let url = '<c:url value="/league/approval/"></c:url>'+lp_num+'/' + lp_approval +'/' + lp_tm_num;
	
	$.ajax({
        async:true,
        type:'get',
        url: url,
        dataType:"json",//서버에서 보낸 데이터의 타입. Map받으로 받을거기 때문에 json
        success : function(data){
        	if(data.state == 1){
        		alert('팀의 참가승인을 거절하였습니다.');
        	}else if(data.state == 2){
        		alert('팀의 참가승인을 승인하였습니다.');
        	}
        }
    });
});
</script>