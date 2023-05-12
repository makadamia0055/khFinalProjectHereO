<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- bootstrap -->
	<link rel="stylesheet" href="<c:url value='/resources/css/common/bootstrap.min.css'></c:url>"/>
	<script src="<c:url value='/resources/js/common/jquery.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/popper.min.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/common/bootstrap.bundle.min.js'></c:url>"></script>  
	
	<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reservation-stadium_info.css'></c:url>" />
<body>
	<div class="stadium-info">
      <div class="btn-box">
         <button id="go-back" class="btn-prev btn btn-dark">이전 페이지</button>
         <button class="btn btn-success btn-update">수정</button>
      </div>
      <div class="info-img">
         <img src="강상.jpg" alt="" class="img img1" style="width: 1000px; height: 500px;">
         <img src="강상3.jpg" alt="" class="img img2" style="width: 1000px; height:500px; display: none;">
         <img src="화도.jpg" alt="" class="img img3" style="width: 1000px; height: 500px; display: none;">
         <button onclick="prevImage()" class="prev-button">&lt;</button>
         <button onclick="nextImage()" class="next-button">&gt;</button>     
      </div>
      <table class="schedule">
         <colgroup>
            <col span="1" width="83">
            <col span="1" width="145">
            <col span="1" width="105">
            <col span="1" width="165">
            <col span="1" width="85">
            <col span="1">
         </colgroup>
         <thead>
            <tr>
               <th>게임</th>
               <th>대관시작시간</th>
               <th>대관시간</th>
               <th>대관비용</th>
               <th>상태</th>
               <th>예약현황</th>
            </tr>
         </thead>
         <tbody>
           <c:forEach items="${sd}" var="sd">
            <tr>
	               <th>1게임</th>
	               <td>09시 00분 부터</td>
	               <td>2시간30분</td>
	               <td><span class="price">${sd.st_rent_cost }</span></td>   
	               <td class="status"><a href="<c:url value='/reservation/payment?stadium=${sd.st_num}'></c:url>"><span class="league">리그</span></a>
	               	</td>
	               <td><strong></strong></td>
            </tr>       
           </c:forEach> 
         </tbody>
         <!-- <form name="cancelpzForm" id="cancelpzForm" action="/booking/stadium/reserve" method="post"></form>
            <input type="hidden" name="mode" value="cancelpz">
            <input type="hidden" name="booking_idx" value="28742">
            <input type="hidden" name="booking_num" id="cancle_booking_num">       -->
      </table>
      <div class="info-content">
        <div class="info-detail">
            <table cellpadding="0" cellspacing="0" class="content-table">
               <tbody>
                  <tr>
                  
                  	<input type="hidden" name="stadium-num" value="">
                     <td class="title" style="width: 30%;">
                        <b>구장명</b>
                     </td>
                     <td class="content">
                        <span>화도강변구장</span>
                     </td>
                  </tr>
                  <tr>
                     <td class="title" style="width: 30%;">
                        <b>구장 주소</b>
                     </td>
                     <td class="content">
                        <span>경기도 남양주시 화도읍 금남리 160-15</span>
                     </td>
                  </tr>
                  <tr>
                     <td class="title" style="width: 30%;">
                        <b>구장 연락처</b>
                     </td>
                     <td class="content">
                        <span>담당자 : 홍길동 </span><br>
                        010-1234-5678
                     </td>
                  </tr>                  
                  <tr>
                     <td class="title">
                        <b>시설 사용 규칙</b>
                     </td>
                     <td class="content">
                        <span>구장 내 금연/지정 장소 흡연 가능</span><br>
                        <span>징 스파이크 사용 불가</span><br>
                        <span>고의 및 과실로 인한 시설물 훼손 및 파손시 사용자가 배상함을 원칙으로 함</span><br>
                        <span>사용 후 마운드 및 덕아웃 정리정돈</span><br>
                        <span>쓰레기는 분리수거 후 한쪽으로 모아주시기 바랍니다.</span><br>
                        <span>주류반입 절대 금지</span><br>
                        <span>위 내용이 지켜지지 않을 경우 환불 없이 퇴장조치 될 수 있으니 예약시 꼭 참고 바랍니다.</span><br>
                     </td>
                  </tr>
                  <tr>
                     <td class="title">
                        <b>운영시간</b>
                     </td>
                     <td class="content">
                        <span>09:00 - 22:00</span>
                     </td>
                  </tr>
                  <tr>
                     <td class="title">
                        <b>구장 위치</b>
                     </td>
                     <td class="content">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d202617.08581931773!2d126.81202966985373!3d37.48687569746108!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3563353717ee8dff%3A0x18867e9be64110a4!2z7ZmU64-E6rCV67OA6rWs7J6l!5e0!3m2!1sko!2skr!4v1677091915779!5m2!1sko!2skr" width="300" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                     </td>
                  </tr>
               </tbody>
            </table>  
        </div>
      </div>
   </div>
   <script>
      var currentImage = 0;
      var images = $(".img");
      var numImages = images.length;
      var interval = 6000; // 이미지 전환 간격 (밀리초)

      function showImage(index) {
      images.hide();
      images.eq(index).show();
      }

      function nextImage() {
      currentImage++;
      if (currentImage >= numImages) {
         currentImage = 0;
      }
      showImage(currentImage);
      }

      function prevImage() {
      currentImage--;
      if (currentImage < 0) {
         currentImage = numImages - 1;
      }
      showImage(currentImage);
      }

      // 이미지 자동 전환 
      function autoImage() {
      nextImage();
      }

      // 이미지 자동전환을 시키는 타이머
      var timer = setInterval(autoImage, interval);

      //이미지 호버했을때 타이머 멈춤 벗어나면 시작
      $(".img").hover(function() {
      clearInterval(timer);
      }, function() {
      timer = setInterval(autoImage, interval);
      });

      //이전,다음 버튼 클릭 이벤트 
      $(".prev-button").click(function() {
      prevImage();
      });
      $(".next-button").click(function() {
      nextImage();
      });
      // 처음에 첫 번째 이미지만 보이게 설정
      showImage(currentImage);
   </script>
   <script>
   document.getElementById('go-back').addEventListener('click', () => {
	   window.history.back();
	   });
   // 예약 버튼 클릭 이벤트
   $(".reserve").click(function() {
   window.location.href = "<c:url value='/reservation/reservation-stadium'></c:url>";
   });
   </script>
</body>
</html>