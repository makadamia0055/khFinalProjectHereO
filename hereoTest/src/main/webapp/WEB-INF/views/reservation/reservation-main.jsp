<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- bootstrap -->
	<link rel="stylesheet" href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>"/>
	<script src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>    
	<!-- datepicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
   
    <link rel="stylesheet" href="<c:url value='/resources/css/reservation/reservation-main.css'></c:url>" />
    
<body> 
    <div class="reservations">        
        <div class="topbox">            
            <div class="search_boxes">
                <ul class="list-region clear-fix">
                    <li class="item-region">
                        <a href="#" class="link-region btn btn-dark" role="button" data-local="전체">전체</a>
                    </li>
                    <c:forEach items="${regionList}" var="rl">
                    <li class="item-region">
                        <a href="<c:url value='/reservation/main?game_date=${game_date}&region=${rl.re_num}'></c:url>" class="link-region btn btn-light" role="button" data-local="${rl.re_num}">${rl.re_sido}</a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="search_box">
                <div id="datepicker"></div>   
            </div>
            <div class="search_box region_select">
                <input class="form-control" type="text" name="search" id="search" placeholder="검색어 입력">
                <div class="input-group-append">
                    <button type="submit" class="btn btn-secondary">검색</button>
                </div>
            </div>
        </div> 
        <div class="list">
            <table cellpadding="0" cellspacing="0" class="content_table">
                <colgroup>
                    <col span="1" width="100">
                    <col span="1" width="300">
                    <col span="1" width="900">
                </colgroup>
                <thead>
                    <tr id="table-title">
                        <th id="table-name">지역</th>
                        <th id="table-name">구장</th>
                        <th id="table-name">내용</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${stadiumList}" var="st">
                    <tr class="stadium-list">
                        <td rowspan="3" id="table-region">
                            <p><strong>${regi.re_sido}</strong></p>
                        </td>
                        <td rowspan="3" id="table-stadium">
                            <a href="<c:url value='/reservation/stadium/info'></c:url>">
                                <img src="강상.jpg" alt="" class="img">
                                <br>
                                <strong style="color: black; font-size: 15px;">구장명 : </strong><span>${st.sd_name}</span>
                                <input type="hidden" name="sd_num" value="${st.sd_num}">
                                <br>
                                <strong style="color: black; font-size: 15px;">구장 위치 : </strong><span>경기도 양평</span>
                            </a>
                        </td>
                        <td rowspan="3" class="table-content">
                            <div class="info-content">
                                <div class="game-group">
                                    <div class="game-title">1게임</div>
                                    <div class="game-title">2게임</div>
                                    <div class="game-title">3게임</div>
                                    <div class="game-title">4게임</div>
                                    <div class="game-title">5게임</div>
                                    <div class="game-title">6게임</div>
                                    <div class="game-title">7게임</div>
                                    <div class="game-title">8게임</div>
                                    <div class="game-title">9게임</div>
                                    <div class="game-title">10게임</div>                                
                                    <br>
                                    <div class="game-info">
                                        <div class="status"><span class="league">리그</span></div>
                                        <div class="status"><span class="confirm">확정</span></div>
                                        <div class="status"><span class="reserve">예약</span></div>
                                        <div class="status"><span class="league">리그</span></div>
                                        <div class="status"><span class="reserve">예약</span></div>
                                        <div class="status"><span class="none"></span></div>
                                        <div class="status"><span class="none"></span></div>
                                        <div class="status"><span class="none"></span></div>
                                        <div class="status"><span class="none"></span></div>
                                        <div class="status"><span class="none"></span></div>                                    
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr><td></td></tr>
                    <tr><td></td></tr>   
                    <!-- 구장 리스트 1개 단위 -->
                    
                   </c:forEach> 
                </tbody>
            </table>
        </div>
        <div class="pagination">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#">이전</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">다음</a></li>
              </ul>
        </div>
    </div>  
    <input type="hidden" name="region" value="${region}">
    <input type="hidden" name="game_date" value="${game_date}">    
<script src="<c:url value='/resources/js/reservation/regionbox.js'></c:url>"></script>
<script src="https://kit.fontawesome.com/bedfa56d7f.js" crossorigin="anonymous"></script>
<script>
  $(".reserve").click(function() {
	  var sd_num = $(this).parents('.table-content').prev().find('[name=sd_num]').val();
      var game_date = $('[name=game_date]').val();
  window.location.href = "<c:url value='/reservation/stadium-info'></c:url>" +'?game_date=' + game_date + '&stadium=' + sd_num ;
  });  
  // 데이트피커
$( function() {
    $( "#datepicker" ).datepicker({
      changeMonth: true,
      changeYear: true,
      nextText: "다음달",
      prevText: "이전달",
      dayNamesMin : ['일','월','화','수','목','금','토'],
      monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
      dateFormat : "yy/mm/dd",
      minDate: "dtNow", // 오늘 날짜 이전 데이터 클릭 방지
      showButtonPanel:true,
      currentText : "오늘 날짜",
      onSelect: function(dateText) {
          var dateText = $(this).val();
          var region = $('[name=region]').val();
          region = region==''?0 : region;
          var url = "<c:url value='/reservation/main?game_date='></c:url>" + dateText.replace(/\//g, "-") + '&region='+region;
          window.location.href = url;
      }
    });
} );
$('.link-region').on('click', function() {
	  var region = $(this).data('local');
	  
	  if(region == '전체'){
	    $('.stadium-list').show();
	  } else {
	    $('.stadium-list').hide();
	    $('.stadium-list:contains("' + region + '")').show();
	  }
	});
</script>

</body>
</html>