<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/hereoTest/resources/css/team/team_common.css" />
<link rel="stylesheet" href="/hereoTest/resources/css/team/team.css" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<section class="teamplayerdetail-main">
      <div class="section-title-playerdetail">
        <h1>선수 프로필</h1>
      </div>
			<div class="container-playerprofile">
        <div class="leftbox-profile">
          
          <div class="player-icon no_icon">
            
          </div>
          <div class="rightbox-profile">
            <ul class="list-group player-profile1">
              <h3 class="player-name">${player.me_nickname }</h3>
              <li class="list-group-item list-group-item-action">소속팀 : 
              	<c:choose>
              		<c:when test="${not empty team}">${team.tm_name}</c:when>
              		<c:otherwise>소속팀 없음</c:otherwise>
              	</c:choose>
              </span><span class="player-team"></li>
              <li class="list-group-item list-group-item-action">통산 출장 경기 : <span class="all_join_match">29</span>경기</li> 
              <li class="list-group-item list-group-item-action item-throwhitarm">
                투타 : <span class="player-throwarm">${player.pl_pitching_hand }</span><span class="player-hitarm">${player.pl_hitting_hand }</span>
              </li>
              <li class="list-group-item list-group-item-action">
               주요 포지션:<c:forEach items="${player.positionList }" var="pl"><span class="team_position badge badge-pill badge-success">${pl.ph_po_ko_name }</span>
								</c:forEach>
              </li>
              <li class="list-group-item list-group-item-action">선출 여부 : </span><span class="player-ispro">${player.pl_ispro }</li>
              
              </ul>
            
          </div>
          
          <div class="box-player_graph">
            <canvas id="PlayerStatChart"></canvas>

          </div>
          
        </div>
        
        <!-- <div class="block-tile title-recently_Match_score">
          최근 경기 성적
        
        </div>
        <div class="hitter_memu">
          <ul class="hitter_date_stat">
            <li class="match_date">2023-02-23</li>
            <li class="enter_time">3타수</li>
            <li class="hit_time">2안타</li>
            <li class="home_run"></li>
            <li class="hit_rate"></li>

          </ul>
        </div>
        <div class="pitcher_memu">

        </div>
        
          
       
        <div class="container-latest_score">
          <div class="box-latest_score">
            <ul class="latest-stat-hit">
              <li class="item-last10gamehit">
                10경기 타율 : <span class="last10gamehit">0.302</span>
              </li>
              <li class="item-last10hit">
                10타석 타율 : <span class="last10hit">0.404</span>
              </li>
              <li class="item-hitpoint">
                10경기 타점 : <span class="last10hitpoint">3</span>점
              </li>
            </ul>
            <ul class="latest-stat-throw">
              <!-- 주요 구종 -->
              <!-- <li class="item-last10gamepitch">
                10경기 자책점 : <span class="last10gamepitch">2.302</span>
              </li>
              <li class="item-last10hitted">
                10타석 피안타율 : <span class="last10hitted">0.404</span>
              </li>
              <li class="item-hitpoint">
                10경기 실점 : <span class="last10losepoint">6</span>점
              </li>
            </ul>
           
          </div> 
        </div> -->
        <div class="block-tile title-recently_Match_score">
          최근 10경기 성적
          <div class="box-btn box-latest">
            <a href="#" role="button" class="btn btn-primary hitter">타자</a>
            <a href="#" role="button" class="btn btn-success btn-pithcer" style="display:none;">투수</a>
          </div>
        </div>
        
        <div class="hitter_latest10_history">
          <div class="latest_10_match">
            <table class="table table-bordered">
              <thead class="thead thead-dark">
                <tr>
                  <th class="match_date">일자</th>
                  <th class="match_oppo">상대</th>
                  <th class="match_AVG">타율</th>
                  <th class="match_PA">타석</th>
                  <th class="match_AB">타수</th>
                  <th class="match_R">득점</th>
                  <th class="match_H">안타</th>
                  <th class="match_2B">2루타</th>
                  <th class="match_3B">3루타</th>
                  <th class="match_HR">홈런</th>
                  <th class="match_RBI">타점</th>
                  <th class="match_SB">도루</th>
                  <th class="match_CS">도루실패</th>
                  <th class="match_BB">볼넷</th>
                  <th class="match_HBP">사구</th>
                  <th class="match_SO">삼진</th>
                  <th class="match_GDP">병살</th>

                </tr>
              </thead>
              <tbody>

                <tr>
                  <td class="match_date">2023-02-12</th>
                  <td class="match_oppo"><a class="badge badge-danger">돌핀즈</span></td>
                  <td class="match_AVG">0.320</td>
                  <td class="match_PA">3</td>
                  <td class="match_AB">2</td>
                  <td class="match_R">1</td>
                  <td class="match_H">1</td>
                  <td class="match_2B">1</td>
                  <td class="match_3B">0</td>
                  <td class="match_HR">0</td>
                  <td class="match_RBI">1</td>
                  <td class="match_SB">1</td>
                  <td class="match_CS">0</td>
                  <td class="match_BB">3</td>
                  <td class="match_HBP">0</td>
                  <td class="match_SO">1</td>
                  <td class="match_GDP">0</td>
                </tr>
                
              </tbody>
            </table>
          </div>
        </div>
        <div class="pitcher_latest10_history" style="display:none;">
          <div class="latest_10_match">
            <table class="table table-bordered">
              <thead class="thead thead-dark">
                <tr>
                  <th class="match_date">일자</th>
                  <th class="match_oppo">상대</th>
                  <th class="match_AVG">결과</th>
                  <th class="match_PA">평균자책점</th>
                  <th class="match_AB">타자수</th>
                  <th class="match_R">이닝</th>
                  <th class="match_H">피안타</th>
                  <th class="match_2B">홈런</th>
                  <th class="match_3B">볼넷</th>
                  <th class="match_HR">사구</th>
                  <th class="match_RBI">삼진</th>
                  <th class="match_SB">실점</th>
                  <th class="match_CS">자책점</th>
                  <th class="match_BB">피안타율</th>
                  
                </tr>
              </thead>
              <tbody>

                
                <tr>
                  <td class="match_date">2023-02-12</th>
                  <td class="match_oppo"><a class="badge badge-danger">돌핀즈</span></td>
                  <td class="match_AVG">0.320</td>
                  <td class="match_PA">3</td>
                  <td class="match_AB">2</td>
                  <td class="match_R">1</td>
                  <td class="match_H">1</td>
                  <td class="match_2B">1</td>
                  <td class="match_3B">0</td>
                  <td class="match_HR">0</td>
                  <td class="match_RBI">1</td>
                  <td class="match_SB">1</td>
                  <td class="match_CS">0</td>
                  <td class="match_BB">3</td>
                  
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- <div class="container-playergraph clear-fix">
          <h2>팀내 타율 순위</h2>
          <canvas id="PlayerStatChart"></canvas>
        </div> -->
        <!-- 베스트 플레이 영상 -->
        <div class="block-tile title-Match_recode">
         전체 경기 기록 열람
         <div class="box-btn">
          <a href="#" role="button" class="btn btn-primary hitter">타자</a>
          <a href="#" role="button" class="btn btn-success btn-pithcer" style="display:none;">투수</a>
         </div>
        </div>
        <!-- 선수 열람 스탯 칸 -->
          <!-- 선수 유형을 분류, 투수, 타자, 투타 겸업 -->
            
          <div class="hitter_history">
            <div class="latest_match">
              <table class="table table-bordered">
                <thead class="thead thead-dark">
                  <tr>
                    <th class="match_date">일자</th>
                    <th class="match_oppo">상대</th>
                    <th class="match_AVG">타율</th>
                    <th class="match_PA">타석</th>
                    <th class="match_AB">타수</th>
                    <th class="match_R">득점</th>
                    <th class="match_H">안타</th>
                    <th class="match_2B">2루타</th>
                    <th class="match_3B">3루타</th>
                    <th class="match_HR">홈런</th>
                    <th class="match_RBI">타점</th>
                    <th class="match_SB">도루</th>
                    <th class="match_CS">도루실패</th>
                    <th class="match_BB">볼넷</th>
                    <th class="match_HBP">사구</th>
                    <th class="match_SO">삼진</th>
                    <th class="match_GDP">병살</th>
    
                  </tr>
                </thead>
                <tbody>
    
                  
                  <tr>
                    <td class="match_date">2023-02-12</th>
                    <td class="match_oppo"><a class="badge badge-danger">돌핀즈</span></td>
                    <td class="match_AVG">0.320</td>
                    <td class="match_PA">3</td>
                    <td class="match_AB">2</td>
                    <td class="match_R">1</td>
                    <td class="match_H">1</td>
                    <td class="match_2B">1</td>
                    <td class="match_3B">0</td>
                    <td class="match_HR">0</td>
                    <td class="match_RBI">1</td>
                    <td class="match_SB">1</td>
                    <td class="match_CS">0</td>
                    <td class="match_BB">3</td>
                    <td class="match_HBP">0</td>
                    <td class="match_SO">1</td>
                    <td class="match_GDP">0</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

          <div class="pitcher_history"  style="display:none;">
            <div class="latest_match">
              <table class="table table-bordered">
                <thead class="thead thead-dark">
                  <tr>
                    <th class="match_date">일자</th>
                    <th class="match_oppo">상대</th>
                    <th class="match_AVG">결과</th>
                    <th class="match_PA">평균자책점</th>
                    <th class="match_AB">타자수</th>
                    <th class="match_R">이닝</th>
                    <th class="match_H">피안타</th>
                    <th class="match_2B">홈런</th>
                    <th class="match_3B">볼넷</th>
                    <th class="match_HR">사구</th>
                    <th class="match_RBI">삼진</th>
                    <th class="match_SB">실점</th>
                    <th class="match_CS">자책점</th>
                    <th class="match_BB">피안타율</th>
                    
                  </tr>
                </thead>
                <tbody>
  
                  
                  <tr>
                    <td class="match_date">2023-02-12</th>
                    <td class="match_oppo"><a class="badge badge-danger">돌핀즈</span></td>
                    <td class="match_AVG">0.320</td>
                    <td class="match_PA">3</td>
                    <td class="match_AB">2</td>
                    <td class="match_R">1</td>
                    <td class="match_H">1</td>
                    <td class="match_2B">1</td>
                    <td class="match_3B">0</td>
                    <td class="match_HR">0</td>
                    <td class="match_RBI">1</td>
                    <td class="match_SB">1</td>
                    <td class="match_CS">0</td>
                    <td class="match_BB">3</td>
                    
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
  


			

		</section>

    <script
      src="https://kit.fontawesome.com/bedfa56d7f.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>

<script>
  const ctx = document.getElementById('PlayerStatChart');

  new Chart(ctx, {
    type: 'radar',
    data: {
      labels: ['장타력', '주루', '컨택트', '수비', '송구력', '피칭'],
      datasets: [{
    label: '선수 스탯',
    data: [60, 59, 60, 31, 56, 0],
    fill: true,
    backgroundColor: 'rgba(255, 99, 132, 0.2)',
    borderColor: 'rgb(255, 99, 132)',
    pointBackgroundColor: 'rgb(255, 99, 132)',
    pointBorderColor: '#fff',
    pointHoverBackgroundColor: '#fff',
    pointHoverBorderColor: 'rgb(255, 99, 132)'
  }, {
    label: '팀 평균',
    data: [50, 48, 40, 45, 96, 27],
    fill: true,
    backgroundColor: 'rgba(54, 162, 235, 0.2)',
    borderColor: 'rgb(54, 162, 235)',
    pointBackgroundColor: 'rgb(54, 162, 235)',
    pointBorderColor: '#fff',
    pointHoverBackgroundColor: '#fff',
    pointHoverBorderColor: 'rgb(54, 162, 235)'
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

</script>
<script>
  $('.title-recently_Match_score .box-btn .btn').click(function(e){
    e.preventDefault();
    $('.pitcher_latest10_history').toggle();
    $('.title-recently_Match_score .box-btn .btn').toggle();
    $('.hitter_latest10_history').toggle();
    
  });
  $('.title-Match_recode .box-btn .btn').click(function(e){
    e.preventDefault();
    $('.pitcher_history').toggle();
    $('.title-Match_recode .box-btn .btn').toggle();
    $('.hitter_history').toggle();
    
  });

 

</script>
