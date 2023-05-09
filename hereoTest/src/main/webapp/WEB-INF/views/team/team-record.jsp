<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />


<section class="teamrec-main">
      <div class="teamrec-leftbox">
        <div class="container-record">
          <div class="left-record">
            <ul class="list-team_record_intro">
              <li class="item-team_intro">
                <div class="box-logo">
                  <img src="
                  <c:choose>
					<c:when test="${empty team.tm_team_img}">
						<c:url value='/files/defaultlogo.png'></c:url>
					</c:when>
					<c:otherwise>
						<c:url value='/files${team.tm_team_img}'></c:url>
					</c:otherwise>
				</c:choose> 
                  " class="rounded-circle img-team-logo" alt="${team.tm_name }">
                  <span class="team-name">${team.tm_name} </span><br>
                  <span >구단 기록실</span>
                </div>
              </li>
              
              <div class="team-message">"
            	  	<c:choose> 
	            		<c:when test="${team.tm_slogan !=null && team.tm_slogan.trim().length()!=0}">${team.tm_slogan}</c:when>
	            		<c:otherwise>
	            		야구장 예약은 바로 여기, Here <i class="fa-solid fa-baseball"></i>!!
	            		</c:otherwise>
            		</c:choose>
              "</div>
              <li class="item-team_intro">
                통산 경기 : <span class="team-total">
                <c:choose>
                  	<c:when test="${empty totalMatch.total|| totalMatch.total == -1}">오류</c:when>
                  	<c:when test="${totalMatch.total == 0}">없음</c:when>
                  	<c:otherwise>${totalMatch.total} 경기</c:otherwise>
               	</c:choose>
                </span>
              </li>
              <li class="item-team_intro">통산 승-무-패 : 
              <c:choose>
                  	<c:when test="${empty totalMatch.total|| totalMatch.total == -1}">오류</c:when>
                  	<c:when test="${totalMatch.total == 0}">없음</c:when>
                  	<c:otherwise>${totalMatch.win}-${totalMatch.draw}-${totalMatch.lose} 경기</c:otherwise>
               	</c:choose>
              	
              </li>
              <li class="item-team_intro">
                통산 팀 승률 : <c:set var="rate" value="${totalMatch.win}/${totalMatch.total}"/>
                <c:choose>
                  	<c:when test="${empty totalMatch.total|| totalMatch.total == -1}">오류</c:when>
                  	<c:when test="${totalMatch.total == 0||totalMatch.win==0}">0%</c:when>
                  	<c:otherwise>${rate*100}%</c:otherwise>
               	</c:choose>
              </li>
              
            </ul>
          </div>
          <div class="right-record">
          
            <div class="container-matchup">
              <ul class="list-matchup">
                <div class="titletext-matchup">최근 5 경기 스케줄</div>
                <c:forEach items="${msList}" var="ms" varStatus="i">
	                <c:if test="${fn:length(msList) - i.count <5}">
	                	<li class="item-matchup">
		                  <span class="num-lineup btn btn-info">${fn:length(msList) - i.count +1}</span>
		                  VS <a href="#" class="link-matchup" data-ms="${ms.ms_num}">
			                <c:choose>
			                	<c:when test="${ms.ms_tm_home_num == ms.ms_tm_away_num}">연습경기</c:when>
			                	<c:when test="${ms.ms_tm_home_num != ms.ms_tm_away_num and ms.ms_tm_home_num == team.tm_num}">VS ${ms.awayTeam.tm_name}</c:when>
			                	<c:when test="${ms.ms_tm_home_num != ms.ms_tm_away_num and ms.ms_tm_away_num == team.tm_num}">VS ${ms.homeTeam.tm_name}</c:when>
			                </c:choose> 
		                  </a>
		                  <span class="result-matchup"></span>
		                </li>
	                
	                </c:if>
	                
                </c:forEach>
              </ul>
            </div>
          </div> 

        </div>
        


        <div class="block-liner container-latestscore">
          <div class="content-blockliner score-teamstat">
            <div class="titletext-latestscore">지난 경기 기록 보기</div>
            </div>
        </div>

        
        <!-- <div class="box-datePick">
          <iframe src="https://calendar.google.com/calendar/embed?height=300&wkst=2&bgcolor=%234285F4&ctz=Asia%2FSeoul&showTitle=0&showTabs=0&showPrint=0&showCalendars=0&showTz=0&mode=MONTH&src=Y2RiYWNmNDhiZGRmY2I2YjdhZWQ3YzM4ZjYwODljZjk5OTc2MmZkOTliYzA0OTc4N2FiYjc2MDFiZTRhMmE5MEBncm91cC5jYWxlbmRhci5nb29nbGUuY29t&color=%23F09300" style="border-width:0" width="400" height="300" frameborder="0" scrolling="no"></iframe>
        </div> -->
        <div class="container-lastMatchRec clear-fix">
          <div class="subcontainer-firstLine">
            <div class="box-datepicker form-group">
              <label for="last_match_date">경기 날짜 선택 </label>
              <select class="form-control" id="last_match_date">
              	<c:forEach items="${msList}" var="ms">
                	<option data-ms="${ms.ms_num}">${ms.ms_datetime_str} 
                	<c:choose>
                		<c:when test="${ms.ms_tm_home_num == ms.ms_tm_away_num}">연습경기</c:when>
                		<c:when test="${ms.ms_tm_home_num != ms.ms_tm_away_num and ms.ms_tm_home_num == team.tm_num}">VS ${ms.awayTeam.tm_name}</c:when>
                		<c:when test="${ms.ms_tm_home_num != ms.ms_tm_away_num and ms.ms_tm_away_num == team.tm_num}">VS ${ms.homeTeam.tm_name}</c:when>
                	</c:choose> 
                	</option>
                
                </c:forEach>
              </select>
            </div>
            <div class="box-score">
              <div class="team-box our-team">
                <div class="img-box">
                   <img class="team-logo home-team rounded-circle" src="<c:choose>
										<c:when test="${empty team.tm_team_img}">
											<c:url value='/files/defaultlogo.png'></c:url>
										</c:when>
										<c:otherwise>
											<c:url value='/files${team.tm_team_img}'></c:url>
										</c:otherwise>
									</c:choose>" alt="단또즈">
                  <button class="badge badge-pill badge-success">홈팀</button>
                </div>
                <span class="team-name home-team">단또즈</span>
              </div>
              VS
              <div class="team-box our-team">
                <span class="team-name away-team">돌핀즈</span>
                <div class="img-box">
                  <img class="team-logo away-team rounded-circle" src="<c:choose>
										<c:when test="${empty team.tm_team_img}">
											<c:url value='/files/defaultlogo.png'></c:url>
										</c:when>
										<c:otherwise>
											<c:url value='/files${team.tm_team_img}'></c:url>
										</c:otherwise>
									</c:choose>" alt="단또즈">
                  <button class="badge badge-pill badge-danger">원정</button>
                </div>
              </div>
              <div class="score_num">
                <span class="home_score">5</span>
                :
                <span class="away_score">2</span>
              </div>
            </div>

            <div class="big_container-lineup">
              <div class="container-lineup home-team">
                <div class="titletext-lineup">선발 Line-up</div>
                <ul class="list-lineup collapse" id="lineup1">
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="attendance badge badge-warning">용병</span>
                    <!-- <span class="attendance badge badge-success">용병</span> -->
  
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="freelancer badge badge-warning"></span>
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="attendance badge badge-warning">용병</span>
                    <!-- <span class="attendance badge badge-success">용병</span> -->
  
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="freelancer badge badge-warning"></span>
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="attendance badge badge-warning">용병</span>
                    <!-- <span class="attendance badge badge-success">용병</span> -->
  
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="freelancer badge badge-warning"></span>
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="attendance badge badge-warning">용병</span>
                    <!-- <span class="attendance badge badge-success">용병</span> -->
  
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="freelancer badge badge-warning"></span>
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="attendance badge badge-warning">용병</span>
                    <!-- <span class="attendance badge badge-success">용병</span> -->
  
                  </li>
                  
                  
                </ul>
                
                <a href="./team-whole_player.html" role="button" class="btn btn-primary col-lg-12">전체 선수 보기</a>
                <a href="#lineup1" role="button" class="btn btn-secondary col-lg-12" data-toggle="collapse">접기/펼치기</a>

              </div>
              <div class="container-lineup opponent-team">
                <div class="titletext-lineup">선발 Line-up</div>
                <ul class="list-lineup collapse" id="lineup1">
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="attendance badge badge-warning">용병</span>
                    <!-- <span class="attendance badge badge-success">용병</span> -->
  
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="freelancer badge badge-warning"></span>
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="attendance badge badge-warning">용병</span>
                    <!-- <span class="attendance badge badge-success">용병</span> -->
  
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="freelancer badge badge-warning"></span>
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="attendance badge badge-warning">용병</span>
                    <!-- <span class="attendance badge badge-success">용병</span> -->
  
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="freelancer badge badge-warning"></span>
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="attendance badge badge-warning">용병</span>
                    <!-- <span class="attendance badge badge-success">용병</span> -->
  
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="freelancer badge badge-warning"></span>
                  </li>
                  <li class="item-lineup">
                    <span class="num-lineup btn btn-info">1</span>
                    <a href="#" class="link-lineup">강백호</a>
                    <span class="position-lineup">유격수</span>
                    <span class="attendance badge badge-warning">용병</span>
                    <!-- <span class="attendance badge badge-success">용병</span> -->
  
                  </li>
                  
                  
                </ul>
                
                <a href="./team-whole_player.html" role="button" class="btn btn-primary col-lg-12">전체 선수 보기</a>
                <a href="#lineup1" role="button" class="btn btn-secondary col-lg-12" data-toggle="collapse">접기/펼치기</a>

              </div>
            </div>
            

          </div>
          <div class="subcontainer-secondLine">
            <div class="box-detail_score">
              <table class="table-detail_score table">
                <tr class="th_row">
                  <th class="name-team">팀</th>
                  <th>1회</th>
                  <th>2회</th>
                  <th>3회</th>
                  <th>4회</th>
                  <th>5회</th>
                  <th>6회</th>
                  <th>Total</th>
                </tr>
                <tr class="trscore_hometeam">
                  <td class="name-home_team">단또즈</td>
                  <td class="inning_1">1</td>
                  <td class="inning_2">0</td>
                  <td class="inning_3">1</td>
                  <td class="inning_4">0</td>
                  <td class="inning_5">0</td>
                  <td class="inning_6">3</td>
                  <td class="total_home">5</td>
                </tr>
                <tr class="trscore_opponent">
                  <td class="name-home_team">돌핀즈</td>
                  <td class="inning_1">0</td>
                  <td class="inning_2">0</td>
                  <td class="inning_3">0</td>
                  <td class="inning_4">2</td>
                  <td class="inning_5">0</td>
                  <td class="inning_6">0</td>
                  <td class="total_home">2</td>
                </tr>
                
              </table>
            </div>
           
          </div>

          <div class="subcontainer-secondLine">
            <div class="box-detail_score">
              <div class="btn-group btn-group_homeaway">
								<button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split dropdown-homeaway" data-toggle="dropdown">
									홈/어웨이<span class="caret"></span>
								</button>
								<div class="dropdown-menu">
									<a href="#" class="dropdown-item item-home">홈팀</a>
									<a href="#" class="dropdown-item item-away">어웨이팀</a>
									
								</div>
							</div>
              <div class="btn-group btn-group_position">
								<button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split dropdown-position" data-toggle="dropdown">
									타자/투수<span class="caret"></span>
								</button>
								<div class="dropdown-menu">
									<a href="#" class="dropdown-item item-whole">전체</a>
									<a href="#" class="dropdown-item item-pitcher">투수</a>
                  <a href="#" class="dropdown-item item-hitter">타자</a>

									
								</div>
							</div>
              
              <table class="table table-bordered table-sm table-hitter table-stat">
                <thead>
                  <tr>
                    <th class="name-player">선수</th>
                    <th>선발/교체</th>
                   	<th>타순</th>
                    <th>1회</th>
                    <th>2회</th>
                    <th>3회</th>
                    <th>4회</th>
                    <th>5회</th>
                    <th>6회</th>
                    <th>타수</th>
                    <th>안타</th>
                    <th>홈런</th>
                    <th>볼넷</th>
                    <th>도루</th>
                    <th>타율</th>

                  </tr>
                </thead>
                <tbody class="container-trstat_home hitter">
                  <tr class="trstat_hometeam">
                    <td class="ht_name-player">강백호</td>
                    <td class="ht_partType">선발</td>
                    <td class="ht_hitorder">1</td>
                    <td class="ht_inning_1">4구, 도루</td>
                    <td class="ht_inning_2"></td>
                    <td class="ht_inning_3">좌플</td>
                    <td class="ht_inning_4">좌안</td>
                    <td class="ht_inning_5"></td>
                    <td class="ht_inning_6"></td>
                    <td class="ht_hit_time">2</td>
                    <td class="ht_hit">1</td>
                    <td class="ht_hit_point">2</td>
                    <td class="ht_point">1</td>
                    <td class="ht_run">1</td>
                    <td class="ht_hitrate">0.500</td>
                  </tr>
                  <tr class="trstat_hometeam">
                    <td class="name-player">강백호</td>
                    <td class="ht_hitorder">2</td>
                    <td class="inning_1">4구, 도루</td>
                    <td class="inning_2"></td>
                    <td class="inning_3">좌플</td>
                    <td class="inning_4">좌안</td>
                    <td class="inning_5"></td>
                    <td class="inning_6"></td>
                    <td class="hit_time">2</td>
                    <td class="hit">1</td>
                    <td class="hit_point">2</td>
                    <td class="point">1</td>
                    <td class="run">1</td>
                    <td class="hitrate">0.500</td>
                  </tr>
                  
                </tbody>
                
              </table>
              <table class="table table-bordered table-sm table-pitcher table-stat">
                <thead>
                  <tr>
                    <th class="name-player">투수</th>
                    <th>결과</th>
                    <th>이닝</th>
                    <th>타자</th>
                    <th>타수</th>
                    <th>피안타</th>
                    <th>피홈런</th>
                    <th>희타</th>
                    <th>희비</th>
                    <th>볼넷</th>
                    <th>사구</th>
                    <th>삼진</th>
                    <th>폭투</th>
                    <th>보크</th>
                    <th>실점</th>
                    <th>자책점</th>
                    <th>투구수</th>
                    <th>방어율</th>

                  </tr>
                </thead>
                <tbody>
                  <tr class="trstat_hometeam">
                    <td class="name-player">강백호</td>
                    <td class="pt_result">-</td>
                    <td class="pt_inning">2 ⅔</td>
                    <td class="pt_vshitter_num">13</td>
                    <td class="pt_vshitter_time">8</td>
                    <td class="pt_hit">1</td>
                    <td class="pt_homerun">0</td>
                    <td class="pt_sacrifice_bunt">0</td>
                    <td class="pt_sacrifice_fly">0</td>
                    <td class="pt_fourball">2</td>
                    <td class="pt_deadball">3</td>
                    <td class="pt_k">4</td>
                    <td class="pt_failball">0</td>
                    <td class="pt_balk">1</td>
                    <td class="pt_lose_point">2</td>
                    <td class="pt_self_lose_point">2</td>
                    <td class="pt_pitching_time">53</td>
                    <td class="pt_rate">5.26</td>
                  </tr>
                  <tr class="trstat_hometeam">
                    <td class="name-player">강백호</td>
                    <td class="pt_result">-</td>
                    <td class="pt_inning">2 ⅔</td>
                    <td class="pt_vshitter_num">13</td>
                    <td class="pt_vshitter_time">8</td>
                    <td class="pt_hit">1</td>
                    <td class="pt_homerun">0</td>
                    <td class="pt_sacrifice_bunt">0</td>
                    <td class="pt_sacrifice_fly">0</td>
                    <td class="pt_fourball">2</td>
                    <td class="pt_deadball">3</td>
                    <td class="pt_k">4</td>
                    <td class="pt_failball">0</td>
                    <td class="pt_balk">1</td>
                    <td class="pt_lose_point">2</td>
                    <td class="pt_self_lose_point">2</td>
                    <td class="pt_pitching_time">53</td>
                    <td class="pt_rate">5.26</td>
                  </tr>
                  
                  
                </tbody>
                
              </table>
            </div>
           
          </div>
            
          
            

        </div>

         
        </div>

        
         
          
         


        </div>
      </div>
     

      
      

        <!-- <div class="container-team-current-league">
          <h2 class="title-team-current-league">현재 참여 중 리그</h2>
          <ul class="list-team-current-league">
            <li class="item-team-current-league">
              <a href="#" class="link-team-current-league">
                쌍용배 아마 최강야구 8강 진출
              </a>
            </li>
          </ul>
        </div> -->

        <!-- <div class="container-team-winlose-graph">
          <span class="title-winlosegraph">창단 이후 승률</span>
          <div class="item-winlosegraph">
            <canvas id="team-winlosegraph"></canvas>
          </div>

        </div> -->
        
      </div>
      <!-- 이후 스프링으로 빼서 따로 페이지 만들기 -->
      
    </section>



    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>
    <script>
      // const ctx = document.getElementById('team-winlosegraph');
    
      // new Chart(ctx, {
      //   type: 'bar',
      //   data: {
      //     labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
      //     datasets: [{
      //       label: '# of Votes',
      //       data: [12, 19, 3, 5, 2, 3],
      //       borderWidth: 1
      //     }]
      //   },
      //   options: {
      //     scales: {
      //       y: {
      //         beginAtZero: true
      //       }
      //     }
      //   }
      // });
      
    let homePitcherArr = [];
  	let homeHitterArr = [];
  	let awayPitcherArr = [];
  	let awayHitterArr = [];
      $('.btn-group_position a').click(function(e){
        e.preventDefault();
        $('.box-detail_score .table-stat').hide();
       if($(this).hasClass('item-whole')){
        $('.box-detail_score table').show();
       }else if($(this).hasClass('item-pitcher')){
        $('.box-detail_score .table-pitcher').show();
       }else{
        $('.box-detail_score .table-hitter').show();

       }

      })
      $('.btn-group_homeaway a').click(function(e){
        e.preventDefault();
        $('.big_container-lineup .container-lineup').hide();
        if($(this).hasClass('item-home')){
         $('.big_container-lineup .container-lineup.home-team').show();

        }else{
          $('.big_container-lineup .container-lineup.opponent-team').show();

        }
      })
      $('.right-record a').click(function(){
        let team = $(this).data('team');
        $('.box-datepicker #last_match_date option').removeProp('selected');
        $('.box-datepicker #last_match_date option').filter(function(){
          return $(this).data('team')==team;
        }).prop('selected', true)
      })
      let mrObj = {
    	  mr_num : 1
      }
      ajax("POST", mrObj, '<c:url value="/team/ajax/record?tm_num=${team.tm_num}"></c:url>', function(data){
    	  console.log(data);
    	  scoreBoardMaker(data);
    	  nameBoardMaker(data);
    	  partInMaker(data);
      })
      function scoreBoardMaker(data){
    	  /* 이닝 변수 선언 */
    	  let inningCnt = data.matchRecord.endInning;
    	  /* 이닝 th 만들기 */
    	  let thStr = '<th class="name-team">팀</th>'
    	  for(let i = 0; i<inningCnt; i++){
    		  thStr+= '<th>'+(i+1)+'회</th>'
    	  }
          thStr += '<th>Total</th>';
          $('.th_row').html(thStr);
          /* 시작팀 뼈대 만들기 */
          let homeTeam = data.matchRecord.matchSchedule.homeTeam;
          let tdStr = '<td class="name-home_team">'+homeTeam.tm_name+'</td>'
          for(let i = 0; i<inningCnt; i++){
    		  tdStr+= '<td class="score-Home" data-inning="'+(i+1)+'">0</td>'
    	  }
          
          tdStr += '<td class="total_home"></td>'
          $('.trscore_hometeam').html(tdStr);
          /* 원정팀 뼈대 만들기 */
          let awayTeam = data.matchRecord.matchSchedule.awayTeam;
          tdStr = '<td class="name-away_team">'+awayTeam.tm_name+'</td>'
          for(let i = 0; i<inningCnt; i++){
    		  tdStr+= '<td class="score-away" data-inning="'+(i+1)+'">0</td>'
    	  }
          
          tdStr += '<td class="total_away"></td>'
          $('.trscore_opponent').html(tdStr);
          /* 팀 점수 넣어주기 */
          let innings = data.matchRecord.inningList;
          /* 총점 선언 */
          let homeSum = 0;
          let awaySum = 0;
          /* 이닝 별 점수 넣기 */
          for(let tmp of innings){
        	  let inningNum = tmp.mi_inning;
        	  if(tmp.mi_isFirstLast){
         		  $('.score-Home').filter(function(){
        			  if($(this).data('inning')==inningNum)
        				  return this;
        		  }).text(tmp.mi_point);
         		  homeSum+=tmp.mi_point;
        	  }else{
        		  $('.score-away').filter(function(){
        			  if($(this).data('inning')==inningNum)
        				  return this;
        		  }).text(tmp.mi_point);
        		  awaySum+=tmp.mi_point;
        	  }
          }
          /* 총점 넣어주기 */
          $('.total_home').text(homeSum);
          $('.total_away').text(awaySum);
          
      }
      function nameBoardMaker(data){
    	  /* 팀 선언 */
    	  let homeTeam = data.matchRecord.matchSchedule.homeTeam;
    	  let awayTeam = data.matchRecord.matchSchedule.awayTeam;
    	  /* 점수 선언 */
    	  let homeScore = data.matchRecord.mr_point_home;
    	  let awayScore = data.matchRecord.mr_point_away;
    	  /* 팀 이름 넣어주기 */
    	  $('.team-box .team-name.home-team').text(homeTeam.tm_name);
    	  $('.team-box .team-name.away-team').text(awayTeam.tm_name);
    	  /* 팀 점수 넣어주기 */
    	  $('.score_num .home_score').text(homeScore);
    	  $('.score_num .away_score').text(awayScore);
    	  /* 팀 로고 넣어주기 */
    	  let str = "<c:url value='/files/defaultlogo.png'></c:url>";
    	  if(homeTeam.tm_team_img != null&& homeTeam.tm_team_img.trim().length!=0){
    		str ="<c:url value='/files"+homeTeam.tm_team_img+"'></c:url>";
    	  }
		  $('.team-logo.home-team').attr("src", str)
		  str = "<c:url value='/files/defaultlogo.png'></c:url>";
		  if(awayTeam.tm_team_img != null&& awayTeam.tm_team_img.trim().length!=0){
			str ="<c:url value='/files"+awayTeam.tm_team_img+"'></c:url>"; 
    	  }   
    	  
		  $('.team-logo.away-team').attr("src", str)

      }
    
    function partInMaker(data){
    	let homeList = data.homePartInList;
    	let awayList = data.awayPartInList;
    	homePitcherArr = [];
    	homeHitterArr = [];
    	awayPitcherArr = [];
    	awayHitterArr = [];
    	for(let tmp of homeList){
    		if(tmp.mp_po_num==1){
    			homePitcherArr.push(tmp);
    		}else{
    			homeHitterArr.push(tmp);
    		}
    		
    	}
    	for(let tmp of awayList){
    		if(tmp.mp_po_num==1){
    			awayPitcherArr.push(tmp);
    		}else{
    			awayHitterArr.push(tmp);
    		}
    		
    	}
    	
    	hitterPlateMaker(homeHitterArr);
    	pitcherPlateMaker(homePitcherArr);

    }
    function hitterPlateMaker(arr1){
    	$('.container-trstat_home').html('');
    	for(let i = 0 ; i<arr1.length ; i++){
    		
	    	let str = '<tr class="trstat_hometeam" data-num="'+(i+1)+'">'
	        +'<td class="ht_name-player"></td>'
	        +'<td class="ht_partType"></td>'
	        +'<td class="ht_hitorder"></td>'
	        +'<td class="ht_inning_1"></td>'
	        +'<td class="ht_inning_2"></td>'
	        +'<td class="ht_inning_3"></td>'
	        +'<td class="ht_inning_4"></td>'
	        +'<td class="ht_inning_5"></td>'
	        +'<td class="ht_inning_6"></td>'
	        +'<td class="ht_hit_time"></td>'
	        +'<td class="ht_hit"></td>'
	        +'<td class="ht_homerun"></td>'
	        +'<td class="ht_fourball"></td>'
	        +'<td class="ht_run"></td>'
	        +'<td class="ht_hitrate"></td>'
	      +'</tr>'
	    	$('.container-trstat_home').append(str);
    	}
    	setHitter(arr1);
    }
    function setHitter(arr){
    	/* 정렬 */
    	arr.sort((a,b)=>{
    		if(a.mp_order != b.mp_order)
    			return (a.mp_order-b.mp_order)
    		if(a.mp_inning != b.mp_inning)
    			return (a.mp_inning - b.mp_inning)
    		return (a.mp_num-b.mp_num)
    	})
	   	let container = $('.container-trstat_home .trstat_hometeam');	
    	for(let tmp of container){
    		/* hitter table가져와서 순서대로 세팅한 뒤 ajax로 배터 데이터 가져와서 세팅하는게 나을듯? */
    		let index = container.index(tmp);
    		let tmpArr = arr.at(index);
    		let uObj = {
    			tp_num : tmpArr.mp_tp_num,
    			mr_num : tmpArr.mp_mr_num
    		} 
    		ajaxParam("POST", uObj, '<c:url value="/team/ajax/playerRecord"></c:url>', function(data){
    			console.log(data);
    			$(tmp).find('.ht_name-player').text(data.player.me_nickname);
    			let prh = data.pRHitter
    			if(data.pRHitter !=null){
	    			$(tmp).find('.ht_hit_time').text(prh.ph_hits);
	    			$(tmp).find('.ht_hit').text(prh.ph_single_hits + prh.ph_twobase_hits + prh.ph_threebase_hits );
	    			$(tmp).find('.ht_homerun').text(prh.ph_homeruns);
	    			$(tmp).find('.ht_fourball').text(prh.ph_fourballs);
	    			$(tmp).find('.ht_run').text(prh.ph_steals);
	    			$(tmp).find('.ht_hitrate').text((prh.ph_hits/prh.ph_bats * 100)+ "%");
    			}else{
    				$(tmp).find('.ht_hit_time').addClass('text-center').attr('colspan', '6').text("기록 없음");
    				$(tmp).find('.ht_hit').remove()
	    			$(tmp).find('.ht_homerun').remove()
	    			$(tmp).find('.ht_fourball').remove()
	    			$(tmp).find('.ht_run').remove()
	    			$(tmp).find('.ht_hitrate').remove()
    			}
    		});
    		$(tmp).find('.ht_partType').text(tmpArr.mp_type);
    		$(tmp).find('.ht_hitorder').text(tmpArr.mp_order);
    				
    	}
    }
    function pitcherPlateMaker(arr1, arr2){
    	
    }
      
    function ajaxParam(method, obj, url, successFunc, errorFunc){
    	$.ajax({
    		async:false,
    		type: method,
    		data: obj,
    		url: url, 
    		dataType: "json",
    		
    		success: successFunc,
    		error: errorFunc
    		
    	});
    }  
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