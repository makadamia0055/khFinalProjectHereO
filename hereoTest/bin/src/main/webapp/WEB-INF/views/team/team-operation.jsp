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
        <div id="accordion" class="subcontainer-league">

          <div class="card">
            <div class="card-header">
              <a class="card-link" data-toggle="collapse" href="#collapseOne">
                현재 진행중 리그
              </a>
            </div>
            <div id="collapseOne" class="collapse" data-parent="#accordion">
              <div class="card-body">
                <a href="#" class=""> 왕십리 아마야구 주말리그</a>
              </div>
            </div>
          </div>
        </div>
          
       </div>
       
        <div class="block-liner container-calendar">
          <div class="content-blockliner title-calendar">
          팀 일정
          </div>
         </div>
         <div class="d-flex justify-content-around">
       	  <table class="p-2 table text-light">
       	  	<thead>
	       	  	<tr>
		       	  	<th class="text-center">매치 타입</th>
		       	  	<th class="text-center">상대팀</th>
		       	  	<th class="text-center">경기 일자</th>
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
       	  			<td>
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
     	  					<span class="badge badge-warning">원정</span></td><td>
     	  					VS <a class="oppoteam" href="<c:url value='/team/sep?teamNum=${sc.ms_tm_home_num }'></c:url>" data-team="${sc.ms_tm_home_num }" data-index="${status.index }"></a>
     	  					
     	  				</c:otherwise>
       	  			</c:choose>
       	  			<script>
       	  				let schedule = $('.oppoteam').get();
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
       	  			
       	  		</tr>
       	  	</c:forEach>
       	  	</tbody>
       	  	
       	  </table>
       	  
          
       
         </div>
         
       
        <div class="block-liner container-latestscore">
          <div class="content-blockliner score-teamstat">
           <c:choose>
              	<c:when test="${not empty nextMatch}">
       			 <div class="titletext-latestscore">다음 경기</div>
            		 일시 : <span class="date-nextMatch">2023-02-18 오후 3시</span><br>
        	  	 	  구장 : <span class="location-nextmatch"><a href="#">왕십리 사근초등학교</a></span><br>
          		  	 <a href="#" class="link-nextMatch btn btn-primary">예약 페이지로</a>
            
              	</c:when>
              	<c:otherwise>
          		<div class="titletext-latestscore">다음 경기</div>
             	 <span>미정</span><br>
            	  <a href="#" class="link-nextMatch btn btn-dark">예약 페이지로</a>
              	</c:otherwise>
              	
              </c:choose>
          </div>
         </div>
           
           <c:choose>
              	<c:when test="${not empty nextMatch}">
              		<div class="container-vsTeam">
			            <div class="our_team title-team animate__animated">
			              <div class="img-box">
			                <img class="team-logo rounded-circle" src="<c:choose>
								<c:when test="${empty team.tm_team_img}">
									<c:url value='/files/defaultlogo.png'></c:url>
								</c:when>
								<c:otherwise>
									<c:url value='/files${team.tm_team_img}'></c:url>
								</c:otherwise>
							</c:choose>" alt="${team.tm_name }">
			                <button class="badge badge-pill badge-success">홈팀</button>
			              </div>
			              단또즈</div>
			            <div class="item-vs_icon">VS</div>
			            <div class="oppo_team title-team animate__animated">
			              <a href="#">
			              <div class="img-box">
			                <img class="team-logo rounded-circle" src="<c:choose>
								<c:when test="${empty team.tm_team_img}">
									<c:url value='/files/defaultlogo.png'></c:url>
								</c:when>
								<c:otherwise>
									<c:url value='/files${team.tm_team_img}'></c:url>
								</c:otherwise>
							</c:choose>" alt="${team.tm_name }">
			                <button class="badge badge-pill badge-danger">원정</button>
			              </div>
			              흑우즈</a></div>
			          </div>
			
			        </div>
			        <a class="block-liner container-vsScore" href="#gamerecord" data-toggle="collapse">
			          <div class="content-blockliner score-teamstat">
			            <div class="titletext-latestscore">상대 전적</div>
			              <span class="latest-win">1</span>승 
			              <span class="latest-lose">2</span>패
			              <span class="latest-draw">0</span><span class="isDraw">무</span>
			            </div>
			        </a>
			
			        <!-- 컬랩스 상대전적 -->
			        <div class="collapse" id="gamerecord">
			          <div class="container-prevMatch" >
			            <div class="container-matchup">
			              <ul class="list-matchup">
			                <div class="titletext-matchup">VS <span class="oppoTeam_name">흑우즈</span> 지난 경기 결과</div>
			                <li class="item-matchup">
			                  <span class="num-lineup btn btn-info">1</span>
			                  <a href="#" class="link-matchup">2022-11-23</a>경기
			                  <span class="result-matchup win">승</span>
			                </li>
			                <li class="item-matchup">
			                  <span class="num-lineup btn btn-info">2</span>
			                  <a href="#" class="link-matchup">2023-01-11</a>경기
			                  <span class="result-matchup lose">패</span>
			                </li>
			                <li class="item-matchup">
			                  <span class="num-lineup btn btn-info">3</span>
			                  <a href="#" class="link-matchup">2023-02-01</a>경기
			                  <span class="result-matchup draw">무</span>
			                </li>
			              </ul>
			              
			            </div>
			            <div class="container-graph">
			              <canvas id="graph_vsOppoPitcher"></canvas>
			            </div>
			            
			          </div>
			        </div>  
			
			
			        <div class="container-nextMatch">
			          <div class="container-lineup">
			            <ul class="list-lineup">
			              <div class="titletext-lineup">다음 경기 Line-up</div>
			              <li class="item-lineup">
			                <span class="num-lineup btn btn-info">1</span>
			                <a href="#" class="link-lineup">강백호</a>
			                <span class="position-lineup">유격수</span>
			                <span class="attendance badge badge-warning">출석확인</span>
			              </li>
			              <li class="item-lineup">
			                <span class="num-lineup btn btn-info">2</span>
			                <a href="#" class="link-lineup">이백호</a>
			                <span class="position-lineup">유격수</span>
			                <span class="attendance badge badge-warning"></span>
			              </li>
			              <li class="item-lineup">
			                <span class="num-lineup btn btn-info">3</span>
			                <a href="#" class="link-lineup">김백호</a>
			                <span class="position-lineup">유격수</span>
			                <span class="attendance badge badge-warning">출석확인</span>
			              </li>
			              <li class="item-lineup">
			                <span class="num-lineup btn btn-info">4</span>
			                <a href="#" class="link-lineup">공백호</a>
			                <span class="position-lineup">유격수</span>
			                <span class="attendance badge badge-warning"></span>
			              </li>
			              <li class="item-lineup">
			                <span class="num-lineup btn btn-info">5</span>
			                <a href="#" class="link-lineup">황백호</a>
			                <span class="position-lineup">유격수</span>
			                <span class="attendance badge badge-warning">출석확인</span>
			              </li>
			              <li class="item-lineup">
			                <span class="num-lineup btn btn-info">6</span>
			                <a href="#" class="link-lineup">박백호</a>
			                <span class="position-lineup">유격수</span>
			                <span class="attendance badge badge-warning"></span>
			              </li>
			              <li class="item-lineup">
			                <span class="num-lineup btn btn-info">7</span>
			                <a href="#" class="link-lineup">유백호</a>
			                <span class="position-lineup">유격수</span>
			                <span class="attendance badge badge-warning">출석확인</span>
			              </li>
			              <li class="item-lineup">
			                <span class="num-lineup btn btn-info">8</span>
			                <a href="#" class="link-lineup">구백호</a>
			                <span class="position-lineup">유격수</span>
			                <span class="attendance badge badge-warning"></span>
			              </li>
			              <li class="item-lineup">
			                <span class="num-lineup btn btn-info">9</span>
			                <a href="#" class="link-lineup">하백호</a>
			                <span class="position-lineup">유격수</span>
			                <span class="attendance badge badge-warning"></span>
			              </li>
			              <li class="item-lineup">
			                <span class="num-lineup btn btn-success">P</span>
			                <a href="#" class="link-lineup">주백호</a>
			                <span class="position-lineup">투수</span>
			                <span class="attendance badge badge-warning"></span>
			              </li>
			              
			              
			             
			            </ul>
			            
			            <button class="btn btn-primary col-lg-12">출석 체크</button>
			         </div>
			
			         <div class="forflex">
			          <div class="container-hover-lineup next_match" style="display: none;">
			            <h4 class="player-name">강백호</h4>
			            <div class="box-player-profile">
			              신장 : <span class="height-player">178</span>cm / 
			              몸무게 : <span class="weight-player">89</span>kg,<br>
			              투타 : <span class="pitch-hand">우</span>투/
			              <span class="hit-hand">우</span>타,<br> 
			
			            </div>
			                        
			            <br>
			            <h5>직전 경기 성적</h5>
			            <div class="player-stat-latestWinLose">
			              <div class="statFor hitter_stat">
			                <li class="title_hitter"><h5>타자</h5></li>
			                <li>타석 : <span class="prev_hitseat">3</span>회</li>
			                <li>타점 : <span class="prev_hitpoint">3</span>점</li>
			                <li>타율 : <span class="prev_hitrate">0.302</span></li>
			                <li><span class="badge badge-success">홈런</span></li>  
			              </div>
			              <div class="statFor pitcher_stat">
			                  <li class="title_hitter"><h5>투수</h5></li>
			                  <li>이닝 : <span class="prev_inning">3</span>회</li>
			                  <li>실점 : <span class="prev_losepoint">3</span>점</li>
			                  <li>삼진 : <span class="prev_Kpoint">3</span>K</li>
			                  <li>방어율 : <span class="prev_loserate">0.302</span></li>
			                  <li><span class="badge badge-success">승리</span></li>  
			                </div>
			              </div>
			            </div>
			          </div>
			
			
			         <div class="container-lineup opponent">
			          <ul class="list-lineup">
			            <div class="titletext-lineup opponent">상대팀 Line-up</div>
			            <li class="item-lineup">
			              <span class="num-lineup btn btn-info">1</span>
			              <a href="#" class="link-lineup">강태웅</a>
			              <span class="position-lineup">유격수</span>
			              <span class="attendance badge badge-warning">출석확인</span>
			            </li>
			            <li class="item-lineup">
			              <span class="num-lineup btn btn-info">2</span>
			              <a href="#" class="link-lineup">이태웅</a>
			              <span class="position-lineup">유격수</span>
			              <span class="attendance badge badge-warning"></span>
			            </li>
			            <li class="item-lineup">
			              <span class="num-lineup btn btn-info">3</span>
			              <a href="#" class="link-lineup">김태웅</a>
			              <span class="position-lineup">유격수</span>
			              <span class="attendance badge badge-warning">출석확인</span>
			            </li>
			            <li class="item-lineup">
			              <span class="num-lineup btn btn-info">4</span>
			              <a href="#" class="link-lineup">공태웅</a>
			              <span class="position-lineup">유격수</span>
			              <span class="attendance badge badge-warning"></span>
			            </li>
			            <li class="item-lineup">
			              <span class="num-lineup btn btn-info">5</span>
			              <a href="#" class="link-lineup">황태웅</a>
			              <span class="position-lineup">유격수</span>
			              <span class="attendance badge badge-warning">출석확인</span>
			            </li>
			            <li class="item-lineup">
			              <span class="num-lineup btn btn-info">6</span>
			              <a href="#" class="link-lineup">박태웅</a>
			              <span class="position-lineup">유격수</span>
			              <span class="attendance badge badge-warning"></span>
			            </li>
			            <li class="item-lineup">
			              <span class="num-lineup btn btn-info">7</span>
			              <a href="#" class="link-lineup">유태웅</a>
			              <span class="position-lineup">유격수</span>
			              <span class="attendance badge badge-warning">출석확인</span>
			            </li>
			            <li class="item-lineup">
			              <span class="num-lineup btn btn-info">8</span>
			              <a href="#" class="link-lineup">구태웅</a>
			              <span class="position-lineup">유격수</span>
			              <span class="attendance badge badge-warning"></span>
			            </li>
			            <li class="item-lineup">
			              <span class="num-lineup btn btn-info">9</span>
			              <a href="#" class="link-lineup">하태웅</a>
			              <span class="position-lineup">유격수</span>
			              <span class="attendance badge badge-warning"></span>
			            </li>
			            <li class="item-lineup">
			              <span class="num-lineup btn btn-success">P</span>
			              <a href="#" class="link-lineup">주태웅</a>
			              <span class="position-lineup">투수</span>
			              <span class="attendance badge badge-warning"></span>
			            </li>
			            
			            
			           
			          </ul>
			          
			          <a href="./team-sep.html" role="button" class="btn btn-primary col-lg-12">상대 팀 페이지로 </a>
			       </div>
			        </div>	
              	</c:when>
              	<c:otherwise>
              		
             	</c:otherwise>
              	
           </c:choose>
              
          


        
         
         
         
      
      
    </div>
  </div>


      <!-- 상단 메뉴들과 마진 좀 넣기 -->
      

      
     

      
        </div>
      </div>
      <!-- 이후 스프링으로 빼서 따로 페이지 만들기 -->
      
    </section>



    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
   <!--  <script>
      const ctx = document.getElementById('graph_vsOppoPitcher');
    
      new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ['1번', '2번', '3번', '4번', '5번', '6번', '7번', '8번', '9번'],
          datasets: [{
            label: '상대 선발 - 상대 타율',
            data: [0.320, 0.190, 0.306, 0.505, 0.23, 0.312 , 0.250, 0, 0.610],
            borderWidth: 0.2
          }]
        },
        options: {
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });
    </script> -->
    <script>
      $('.container-nextMatch .container-lineup .list-lineup li').hover(function(){
        $('.container-hover-lineup.next_match').show();
        let playerName = $(this).find('.link-lineup').text();
        let playerPosition = $(this).find('.position-lineup').text();
        let isPitcher = $(this).find('.num-lineup').text();
        $('.container-hover-lineup.next_match').find('.player-name').text(playerName);
        if(isPitcher=='P'){
          $('.container-hover-lineup.next_match').find('.statFor').hide()
          $('.container-hover-lineup.next_match').find('.statFor.pitcher_stat').show();
        }else{
          $('.container-hover-lineup.next_match').find('.statFor').hide()
          $('.container-hover-lineup.next_match').find('.statFor.hitter_stat').show();
        }
        if($(this).parents('.container-lineup').hasClass('opponent')){
          // 상대팀 호버시
          $('.container-hover-lineup.next_match').css('background-color','rgb(211, 44, 136)');
        }else{
          //우리팀 호버시
          $('.container-hover-lineup.next_match').css('background-color','rgb(23, 60, 109)');
        }

        
        
        
      }, function(){
        $('.container-hover-lineup.next_match').hide();

      } )
      $('.container-vsTeam .title-team').hover(function(){
        $(this).addClass('animate__pulse')
      }, function(){
        $(this).removeClass('animate__pulse')

      })
    </script>
    