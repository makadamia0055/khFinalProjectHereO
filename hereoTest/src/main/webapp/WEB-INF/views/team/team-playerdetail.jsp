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
              <li class="list-group-item list-group-item-action">통산 출장 경기 : <span class="all_join_match"></span>경기</li> 
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
        
       
        <div class="block-tile title-recently_Match_score">
          일자별 경기 성적
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
                  <th class="match_oppoStr">상대</th>
                  <th class="match_AVG">타율</th>
                  <th class="match_PA">타석</th>
                  <th class="match_AB">타수</th>
                  <!-- <th class="match_R">득점</th> -->
                  <th class="match_H">안타</th>
                  <th class="match_2B">2루타</th>
                  <th class="match_3B">3루타</th>
                  <th class="match_HR">홈런</th>
                  <!-- <th class="match_RBI">타점</th> -->
                  <th class="match_SB">도루</th>
                  <th class="match_CS">도루실패</th>
                  <th class="match_BB">볼넷</th>
                  <th class="match_HBP">사구</th>
                  <th class="match_SO">삼진</th>
                  <th class="match_GDP">병살</th>

                </tr>
              </thead>
              <tbody>
              	<c:if test="${empty pHList}">
					<tr><td colspan="17">타자 기록이 없습니다</td></tr>
				</c:if>	
				<c:forEach items="${pHList}" var="ph">
                <tr>
                  <td class="match_date">${ph.ms_datetime_str}</th>
                  <td class="match_oppo" data-mrnum="${ph.ph_mr_num}"></td>
                  <td class="match_AVG">${ph.ph_hits / ph.ph_bats}</td>
                  <td class="match_PA">${ph.ph_bats}</td>
                  <td class="match_AB">${ph.ph_hits}</td>
                  <!-- <td class="match_R"></td> -->
                  <td class="match_H">${ph.ph_single_hits}</td>
                  <td class="match_2B">${ph.ph_twobase_hits}</td>
                  <td class="match_3B">${ph.ph_threebase_hits}</td>
                  <td class="match_HR">${ph.ph_homeruns}</td>
                  <!-- <td class="match_RBI"></td> -->
                  <td class="match_SB">${ph.ph_steals}</td>
                  <td class="match_CS">${ph.ph_fail_steals}</td>
                  <td class="match_BB">${ph.ph_fourballs}</td>
                  <td class="match_HBP">${ph.ph_hitbypitches}</td>
                  <td class="match_SO">${ph.ph_strike_outs}</td>
                  <td class="match_GDP">${ph.ph_doubleplays}</td>
                </tr>
                </c:forEach>
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
                  <th class="match_oppoStr">상대</th>
                  <!-- <th class="match_AVG">결과</th> -->
                  <!-- <th class="match_PA">평균자책점</th> -->
                  <th class="match_AB">타자수</th>
                  <th class="match_R">이닝</th>
                  <th class="match_H">피안타</th>
                  <th class="match_HR">홈런</th>
                  <th class="match_4b">볼넷</th>
                  <th class="match_hbp">사구</th>
                  <th class="match_RBI">삼진</th>
                  <th class="match_SB">실점</th>
                  <!-- <th class="match_CS">자책점</th> -->
                  <th class="match_BB">투구수</th>
                  
                </tr>
              </thead>
              <tbody>
				<c:if test="${empty pPList}">
					<tr><td colspan="14">투수 기록이 없습니다</td></tr>
				</c:if>	
                <c:forEach items="${pPList}" var="pp">
                <tr>
                  <td class="match_date">${pp.ms_datetime_str}</th>
                  <td class="match_oppo" data-mrnum="${pp.pp_mr_num}"></td>
                  <!-- <td class="match_AVG"></td> -->
                  <!-- <td class="match_PA"></td> -->
                  <td class="match_AB">${pp.pp_hitters}</td>
                  <td class="match_R">${pp.pp_innings}</td>
                  <td class="match_H">${pp.pp_hits }</td>
                  <td class="match_HR">${pp.pp_homeRuns}</td>
                  <td class="match_4b">${pp.pp_fourBalls}</td>
                  <td class="match_hbp">${pp.pp_hitByPitches}</td>
                  <td class="match_RBI">${pp.pp_strikeOuts}</td>
                  <td class="match_SB">${pp.pp_losePoints}</td>
                  <!-- <td class="match_CS"></td> -->
                  <td class="match_BB">${pp.pp_pitches}</td>
                  
                </tr>
                </c:forEach>
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
			년도별 경기 성적	
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
                    <th class="match_date">년도</th>
                    
                    <th class="match_AVG">타율</th>
                    <th class="match_PA">타석</th>
                    <th class="match_AB">타수</th>
                    <!-- <th class="match_R">득점</th> -->
                    <th class="match_H">안타</th>
                    <th class="match_2B">2루타</th>
                    <th class="match_3B">3루타</th>
                    <th class="match_HR">홈런</th>
                    <!-- <th class="match_RBI">타점</th> -->
                    <th class="match_SB">도루</th>
                    <th class="match_CS">도루실패</th>
                    <th class="match_BB">볼넷</th>
                    <th class="match_HBP">사구</th>
                    <th class="match_SO">삼진</th>
                    <th class="match_GDP">병살</th>
    
                  </tr>
                </thead>
                <tbody>
    
                  
                   <c:if test="${empty yHList}">
					<tr><td colspan="17">타자 기록이 없습니다</td></tr>
				</c:if>	
				<c:forEach items="${yHList}" var="yh">
                  <tr>
                  <td class="match_date">${yh.yh_year}</th>
                  
                  <td class="match_AVG">${yh.yh_hits / yh.yh_bats}</th>
                  
                  <td class="match_PA">${yh.yh_bats}</td>
                  <td class="match_AB">${yh.yh_hits}</td>
                  <!-- <td class="match_R"></td> -->
                  <td class="match_H">${yh.yh_single_hits}</td>
                  <td class="match_2B">${yh.yh_twobase_hits}</td>
                  <td class="match_3B">${yh.yh_threebase_hits}</td>
                  <td class="match_HR">${yh.yh_homeruns}</td>
                  <!-- <td class="match_RBI"></td> -->
                  <td class="match_SB">${yh.yh_steals}</td>
                  <td class="match_CS">${yh.yh_fail_steals}</td>
                  <td class="match_BB">${yh.yh_fourballs}</td>
                  <td class="match_HBP">${yh.yh_hitbypitches}</td>
                  <td class="match_SO">${yh.yh_strike_outs}</td>
                  <td class="match_GDP">${yh.yh_doubleplays}</td>
                </tr>
                </c:forEach>
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
                    <th class="match_date">년도</th>
                    <!-- <th class="match_PA">평균자책점</th> -->
                    <th class="match_AB">타자수</th>
                    <th class="match_R">이닝</th>
                    <th class="match_H">피안타</th>
                    <th class="match_2B">홈런</th>
                    <th class="match_3B">볼넷</th>
                    <th class="match_HR">사구</th>
                    <th class="match_RBI">삼진</th>
                    <th class="match_SB">실점</th>
                    <!-- <th class="match_CS">자책점</th> -->
                    <th class="match_BB">피안타율</th>
                    
                  </tr>
                </thead>
                <tbody>
  
                  
                 <c:if test="${empty yPList}">
					<tr><td colspan="14">투수 기록이 없습니다</td></tr>
				</c:if>	
                <c:forEach items="${yPList}" var="yp">
                <tr>
                  <td class="match_date">${yp.yp_year}</th>
                  <!-- <td class="match_AVG">0.320</td> -->
                  <%-- <td class="match_PA">${yp.yp_earnedruns/pp.pp_innings}</td> --%>
                  <td class="match_AB">${yp.yp_hitters}</td>
                  <td class="match_R">${yp.yp_innings}</td>
                  <td class="match_H">${yp.yp_hits}</td>
                  <td class="match_HR">${yp.yp_homeRuns}</td>
                  <td class="match_4b">${yp.yp_fourBalls}</td>
                  <td class="match_hbp">${yp.yp_hitByPitches}</td>
                  <td class="match_RBI">${yp.yp_strikeOuts}</td>
                  <td class="match_SB">${yp.yp_losePoints}</td>
                  <%-- <td class="match_CS">${yp.yp_earnedruns }</td> --%>
                  <td class="match_BB">${yp.yp_pitches}</td>
                  
                </tr>
                </c:forEach>
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
  }, ]
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
  setOppoNamer();
  /* 상대팀 이름 넣어주는 메소드 */
  function setOppoNamer(){
	  let matchOppo = $('.match_oppo');
	  for(let tmp of matchOppo){
		  let mrnum= $(tmp).data('mrnum');
		  let mrObj={
				  mr_num:mrnum,
				  tm_num:${team.tm_num}
		  }
		  let oppoTmName;
		  ajaxParam("POST", mrObj, '<c:url value="/team/ajax/oppoName"></c:url>', function(data){
			  oppoTmName= data.oppoTeam.tm_name;
		  })
		  let tmpStr = '<a class="badge badge-danger">'+oppoTmName+'</a>';
		  $(tmp).append(tmpStr);
		  
	  }
	  
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
 

</script>
