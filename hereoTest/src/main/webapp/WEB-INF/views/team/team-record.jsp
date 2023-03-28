<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	            		"야구장 예약은 바로 여기, Here <i class="fa-solid fa-baseball"></i>!!"
	            		</c:otherwise>
            		</c:choose>
              "</div>
              <li class="item-team_intro">
                연고지 : <span class="team-local">
                  <a href="#" class="link-local_full badge badge-success">서울</a> 왕십리
                </span>
              </li>
              <li class="item-team_intro">
                창단일 : <span class="team-since">${team.tm_startday_str }</span>
              </li>
              <li class="item-team_intro">
                멤버수 : <span class="team-currentMember">19</span>명 
                
              </li>
              <li class="current-league_text">현재 참여 리그 : <a href="#" class="current-league">가리봉동 가리비 리그</a></li>
            </ul>
          </div>
          <div class="right-record">
          
            <div class="container-matchup">
              <ul class="list-matchup">
                <div class="titletext-matchup">지난 10 경기 결과</div>
                <li class="item-matchup">
                  <span class="num-lineup btn btn-info">1</span>
                  VS <a href="#" class="link-matchup" data-team="mammoth">맘모스</a>
                  <span class="result-matchup win">승</span>
                </li>
                <li class="item-matchup">
                  <span class="num-lineup btn btn-info">2</span>
                  VS <a href="#" class="link-matchup" data-team="dolphins">돌핀즈</a>
                  <span class="result-matchup lose">패</span>
                </li>
                <li class="item-matchup">
                  <span class="num-lineup btn btn-info">3</span>
                  VS <a href="#" class="link-matchup" data-team="Dangdangs">댕댕스</a>
                  <span class="result-matchup draw">무</span>
                </li>
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
                <option data-team="mammoth">23-01-23 VS 맘모스</option>
                <option data-team="dolphins" selected>23-02-03 VS 돌핀즈</option>
                <option data-team="Dangdangs">23-02-13 VS 댕댕스</option>
              </select>
            </div>
            <div class="box-score">
              <div class="team-box our-team">
                <div class="img-box">
                  <img class="team-logo rounded-circle" src="./고양이 로고.png" alt="단또즈">
                  <button class="badge badge-pill badge-success">홈팀</button>
                </div>
                <span class="team-name">단또즈</span>
              </div>
              VS
              <div class="team-box our-team">
                <span class="team-name">돌핀즈</span>
                <div class="img-box">
                  <img class="team-logo rounded-circle" src="./돌고래.png" alt="단또즈">
                  <button class="badge badge-pill badge-danger">원정</button>
                </div>
              </div>
              <div class="score_num">
                <span class="home_score">5</span>
                :
                <span class="opponent_score">2</span>
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
                <tr>
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
                    <th>1회</th>
                    <th>2회</th>
                    <th>3회</th>
                    <th>4회</th>
                    <th>5회</th>
                    <th>6회</th>
                    <th>타수</th>
                    <th>안타</th>
                    <th>타점</th>
                    <th>득점</th>
                    <th>도루</th>
                    <th>타율</th>

                  </tr>
                </thead>
                <tbody>
                  <tr class="trscore_hometeam">
                    <td class="ht_name-player">강백호</td>
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
                  <tr class="trscore_hometeam">
                    <td class="name-player">강백호</td>
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
                  <tr class="trscore_hometeam">
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
                  <tr class="trscore_hometeam">
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
     

      
      <div class="block-liner team-history">
        <div class="content-blockliner">
          팀 연혁
        </div>


      </div>


      <div class="bottom-team-history">
        <div class="container-team-participate-league">
          <h2 class="title-team-league">전체 리그 참여 연혁</h2>
          <hr>
          <ul class="list-team-league">
            <li class="item-team-league">
              <a href="#" class="link-team-league">kh배 동계 아마추어 리그 <div class="badge badge-success">4강</div></a>
            </li>
            <li class="item-team-league">
              <a href="#" class="link-team-league">배민배 하계 아마추어리그 <div class="badge badge-danger">우승</div></a>
            </li>
          </ul>
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

    </script>