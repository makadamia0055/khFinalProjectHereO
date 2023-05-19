<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link	rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<style>

#main_logo{
	witdh: 300px; height: 300px;
}


</style>
<script>
    function ajax(method, obj, url, successFunc, errorFunc){
    	$.ajax({
    		async:false,
    		type: method,
    		data: JSON.stringify(obj),
    		url: url, 
    		dataType: "json",
    		contentType:"application/json; charset=UTF-8",
    		success: successFunc,
    		error: errorFunc
    		
    	});
    }
    
    </script>

<section class="teamsep-main">
      <div class="teamsep-leftbox">
        <div class="container-introduce">
         <div class="left-introduce">
          <div class="box-logo">
            <img id="main_logo" src="
	            <c:choose>
					<c:when test="${empty team.tm_team_img}">
						<c:url value='/files/defaultlogo.png'></c:url>
					</c:when>
					<c:otherwise>
						<c:url value='/files${team.tm_team_img}'></c:url>
					</c:otherwise>
				</c:choose> " class="rounded-circle" alt="${team.tm_name }">
          </div>
            
        </div>
        <div class="right-introduce">
          <ul class="list-team_intro">
            <h1 class="team-name"></span>${team.tm_name}</h1>
            <div class="team-message">
            	<c:choose> 
            		<c:when test="${team.tm_slogan !=null && team.tm_slogan.trim().length()!=0}">${team.tm_slogan}</c:when>
            		<c:otherwise>
            		"야구장 예약은 바로 여기, Here <i class="fa-solid fa-baseball"></i>!!"
            		</c:otherwise>
            	</c:choose>
            </div>
            <li class="item-team_intro">
            	구단주 : <span class="team-leader">
            	<c:if test="${empty teamLeader }">없음</c:if>
            	${teamLeader.me_nickname }</span> 
            	
            </li>
            <li class="item-team_intro">
              지역 : <span class="team-local">
                <a href="#" class="link-local_full badge badge-success">${region[team.tm_re_num -1].re_sido }</a> 
              </span>
            </li>
            <li class="item-team_intro">
              창단일 : <span class="team-since">${team.tm_startday_str }</span>
            </li>
            <li class="item-team_intro">
              멤버수 : <span class="team-currentMember">${memberCnt }</span>명 
              <!-- <span class="team-maxMember">
                <span class="team-maxMember-num">30</span>명
              </span> -->
            </li>
            
          </ul>
        </div>
        <c:choose>
        <c:when test="${userTeam.tm_num == team.tm_num }">
        <div id="accordion" class="subcontainer-league">
		
          <div class="card">
            <div class="card-header">
              <a class="card-link" data-toggle="collapse" href="#collapseOne">
                팀원 메뉴
              </a>
            </div>
            <div id="collapseOne" class="collapse" data-parent="#accordion">
              <div class="card-body">
                <a href="#" class=""> 팀 탈퇴</a>
              </div>
            </div>
          </div>
        </div>
        </c:when>
          </c:choose>
       </div>
       
        <div class="block-liner container-calendar">
          <div class="content-blockliner title-calendar">
         전체 팀 일정
          </div>
         </div>
         <div class="d-flex justify-content-around">
       	  <table class="p-2 table text-light">
       	  	<thead>
	       	  	<tr>
		       	  	<th class="text-center">매치 타입</th>
		       	  	<th class="text-center">상대팀</th>
		       	  	<th class="text-center">경기 일자</th>
		       	  	<th class="text-center">경기 라인업</th>
	       	  	</tr>
       	  	</thead>
       	  	<tbody>
       	  	<c:if test="${empty scList }">
       	  		<tr>
       	  			<td colspan="100%" class="text-center">이번주 스케줄이 없습니다.</td>
       	  			
       	  		</tr>
       	  	</c:if>
       	  	<c:forEach items="${scList}" var="sc" varStatus="status">
       	  		<tr>
       	  			<td class="text-center">
       	  			<c:choose>
       	  				<c:when test="${sc.ms_match_sort =='리그' }"><span class="badge badge-warning">${sc.ms_match_sort}</span></c:when>
       	  				<c:otherwise><span class="badge badge-light">${sc.ms_match_sort}</span></c:otherwise>
       	  			
       	  			</c:choose>
       	  			<c:choose>
       	  				<c:when test="${sc.ms_tm_home_num == team.tm_num && not empty sc.ms_tm_away_num}">
       	  					<span class="badge badge-success">홈</span></td><td>
       	  					VS <a class="oppoteam" href="<c:url value='/team/sep?teamNum=${sc.ms_tm_away_num }'></c:url>" data-team="${sc.ms_tm_away_num }" data-index="${status.index }"> </a>
     	  				</c:when>
     	  				<c:when test="${sc.ms_tm_home_num == team.tm_num && empty sc.ms_tm_away_num}">
       	  					<span class="badge badge-primary" data-team="0" data-index="${status.index }">연습</span></td><td>
       	  				</c:when>
     	  				<c:otherwise>
     	  					<span class="badge badge-warning">원정</span></td>
     	  					<td class="text-center">
     	  					VS <a class="oppoteam" href="<c:url value='/team/sep?teamNum=${sc.ms_tm_home_num }'></c:url>" data-team="${sc.ms_tm_home_num }" data-index="${status.index }"></a>
     	  					
     	  				</c:otherwise>
       	  			</c:choose>
       	  			<script>
       	  				var schedule = $('.oppoteam').get();
       	  				for(i of schedule){
       	  					if(i.dataset.team==0)
       	  						continue;
       	  					
							let teamObj = {
									tm_num : i.dataset.team
							}
							ajax("POST", teamObj ,'<c:url value="/team/ajax/teamNum"></c:url>', function(data){
								
								$(i).text(data.team.tm_name);
								
							} )	
       	  				}
       	  			</script>
       	  			</td>
       	  			<td>
       	  				<span class="date"><fmt:formatDate type="both" pattern = "yyyy년 MM월 dd일 HH시 mm분" value="${sc.ms_datetime }"></fmt:formatDate></span>
       	  			<a class="btn btn-light" href="#">일정 상세보기</a>
      	  			</td>
      	  			<td class="text-center">
      	  				<c:if test="${sc.ms_match_sort != '연습'}">
      	  					<a class="btn btn-warning" data-matchNum="${sc.ms_num}" href="<c:url value='/team/lineup?teamNum=${team.tm_num}&ms_num=${sc.ms_num}'></c:url>">라인업 제출</a>
      	  				</c:if>
      	  			</td>
       	  			
       	  		</tr>
       	  	</c:forEach>
       	  	</tbody>
       	  	
       	  </table>
       	  
          
       
         </div>
         
       
        
      <div class="block-liner team-history">
        <div class="content-blockliner">
          팀 소개
        </div>


      </div>


      <div class="bottom-team-history">
        <div class="container-team-participate-league">
          <h2 class="title-team-league">${team.tm_slogan }</h2>
          <hr>
          <p>팀 소개글</p>
          <p>${team.tm_team_introduce }</p>
        </div>
    </section>



    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
   
    
    